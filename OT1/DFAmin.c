#include "NFA2DFA.h"


typedef struct Partition {
    DFAState **states;
    int count;
    int capacity;
} Partition;

Partition** partitions;
int numPartitions = 0;

Partition* findPartition(DFAState* state) {
    for (int i = 0; i < numPartitions; i++) {
        for (int j = 0; j < partitions[i]->count; j++) {
            if (partitions[i]->states[j] == state) {
                return partitions[i];
            }
        }
    }
    return NULL;
}

void addStateToPartition(Partition* partition, DFAState* state) {
    if (partition->count == partition->capacity) {
        partition->capacity *= 2;
        partition->states = realloc(partition->states, partition->capacity * sizeof(DFAState*));
    }
    partition->states[partition->count++] = state;
}

void initializePartitions() {
    partitions = malloc(2 * sizeof(Partition*));
    partitions[0] = malloc(sizeof(Partition));  // Accepting states partition
    partitions[0]->states = malloc(DFAStateCount * sizeof(DFAState*));
    partitions[0]->count = 0;
    partitions[0]->capacity = DFAStateCount;

    partitions[1] = malloc(sizeof(Partition));  // Non-accepting states partition
    partitions[1]->states = malloc(DFAStateCount * sizeof(DFAState*));
    partitions[1]->count = 0;
    partitions[1]->capacity = DFAStateCount;

    DFAState* temp = FinalDFA;
    while (temp) {
        if (temp->isAccepting) {
            addStateToPartition(partitions[0], temp);
        } else {
            addStateToPartition(partitions[1], temp);
        }
        temp++;
    }

    numPartitions = 2;
}

void refinePartitions(char symbol) {
    int originalNumPartitions = numPartitions;
    for (int i = 0; i < originalNumPartitions; i++) {
        Partition* currentPartition = partitions[i];
        Partition* newPartition = NULL;

        DFAState* representativeState = currentPartition->states[0];
        DFATransition* representativeTransition = representativeState->transitions;

        // Find the transition for the symbol
        while (representativeTransition && representativeTransition->symbol != symbol) {
            representativeTransition = representativeTransition->next;
        }
        Partition* representativeDestinationPartition = representativeTransition ? findPartition(representativeTransition->destination) : NULL;

        for (int j = 1; j < currentPartition->count; j++) {
            DFAState* currentState = currentPartition->states[j];
            DFATransition* currentTransition = currentState->transitions;

            while (currentTransition && currentTransition->symbol != symbol) {
                currentTransition = currentTransition->next;
            }
            Partition* currentDestinationPartition = currentTransition ? findPartition(currentTransition->destination) : NULL;

            if (currentDestinationPartition != representativeDestinationPartition) {
                if (!newPartition) {
                    partitions[numPartitions++] = malloc(sizeof(Partition));
                    newPartition = partitions[numPartitions-1];
                    newPartition->states = malloc(DFAStateCount * sizeof(DFAState*));
                    newPartition->count = 0;
                    newPartition->capacity = DFAStateCount;
                }
                addStateToPartition(newPartition, currentState);

                // Remove currentState from the current partition
                memmove(&currentPartition->states[j], &currentPartition->states[j+1], (currentPartition->count - j - 1) * sizeof(DFAState*));
                currentPartition->count--;
                j--;
            }
        }
    }
}

void minimizeDFA() {
    initializePartitions();

    int prevNumPartitions;
    do {
        prevNumPartitions = numPartitions;
        for (char c = 'a'; c <= 'z'; c++) {  // Assuming alphabet is a-z
            refinePartitions(c);
        }
    } while (prevNumPartitions != numPartitions);
}
void printMinimizedDFA() {
    printf("Minimized DFA:\n");
    
    // 打印状态
    for (int i = 0; i < numPartitions; i++) {
        printf("State Q%d (%s):\n", i, (partitions[i]->states[0]->isAccepting) ? "accepting" : "non-accepting");
        
        // 打印转换
        for (char c = 'a'; c <= 'z'; c++) {
            DFAState *sourceState = partitions[i]->states[0];
            DFATransition *transition = sourceState->transitions;
            
            // 查找符号对应的转换
            while (transition && transition->symbol != c) {
                transition = transition->next;
            }
            
            if (transition) {
                Partition *destinationPartition = findPartition(transition->destination);
                printf("  On symbol '%c' -> Q%d\n", c, destinationPartition - partitions);
            }
        }
        printf("\n");
    }
}
int main() {
    minimizeDFA();
    printMinimizedDFA();
    return 0;
}

