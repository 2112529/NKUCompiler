#ifndef NFA2DFA_H
#define NFA2DFA_H

#include "./NFA.h"
// 声明DFA的数据结构
typedef struct DFAState DFAState;
typedef struct DFATransition DFATransition;
typedef struct EpsilonClosure {
    NFAState **states;  // NFA状态指针数组
    int count;          // 状态的数量
} EpsilonClosure;
DFAState* FinalDFA;
int DFAStateCount=0;
struct DFATransition {
    char symbol;
    DFAState *source;
    DFAState *destination;
    DFATransition *next;
};
struct DFAState {
    EpsilonClosure *NFAStateSet;
    int isAccepting;
    DFATransition *transitions;
    int StateID;
};

// 在DFA中添加一个转移
void addDFATransition(DFAState *source, char symbol, DFAState *destination) {
    DFATransition *trans = (DFATransition*)malloc(sizeof(DFATransition));
    trans->symbol = symbol;
    trans->source = source;
    trans->destination = destination;
    trans->next = source->transitions;  // 将新转移添加到链表的开头
    source->transitions = trans;
}
void PrintDFA(DFAState *startState) {
    if (!startState) {
        printf("DFA is empty.\n");
        return;
    }

    FILE *file = fopen("DFAoutput", "w");
    if (!file) {
        perror("Failed to open DFAoutput");
        return;
    }

    // 使用一个visited数组来避免重复访问
    int visited[MAX_STATES] = {0};
    // 使用一个队列来进行宽度优先搜索
    DFAState *queue[MAX_STATES];
    int front = 0, rear = 0;

    queue[rear++] = startState;

    while (front != rear) {
        DFAState *currentState = queue[front++];
        
        if (visited[currentState->StateID]) {
            continue;
        }
        visited[currentState->StateID] = 1;

        // 打印当前DFA状态的信息到文件
        fprintf(file, "DFA State %d ", currentState->StateID);
        if (currentState->isAccepting) {
            fprintf(file, "(Accepting State) ");
        }
        fprintf(file, "consists of NFA states: ");

        // 打印这个DFA状态包含的所有NFA状态到文件
        for (int i = 0; i < currentState->NFAStateSet->count; i++) {
            fprintf(file, "%d ", currentState->NFAStateSet->states[i]->StateID);
        }
        fprintf(file, "\n");

        // 打印从这个DFA状态出发的所有转换到文件
        DFATransition *transition = currentState->transitions;
        while (transition) {
            fprintf(file, "On symbol %c, go to DFA State %d\n", transition->symbol, transition->destination->StateID);
            
            // 如果这个目标DFA状态还没被访问，添加到队列
            if (!visited[transition->destination->StateID]) {
                queue[rear++] = transition->destination;
            }

            transition = transition->next;
        }
        fprintf(file, "\n");
    }

    fclose(file);
}







void DFS(NFAState *state, bool *visited, EpsilonClosure *closure) {
    if (visited[state->StateID]) return;
    visited[state->StateID] = 1;
    closure->states[closure->count++] = state;
    NFATransition *transition = state->transitions;
    while (transition) {
        if (transition->symbol == 'e') {
            DFS(transition->destination, visited, closure);
        }
        transition = transition->next;
    }
}

EpsilonClosure* computeEpsilonClosure(NFAState *state) {
    EpsilonClosure *closure = malloc(sizeof(EpsilonClosure));
    closure->states = malloc(MAX_STATES * sizeof(NFAState*));
    closure->count = 0;

    bool visited[MAX_STATES] = { false };
    DFS(state, visited, closure);

    return closure;
}

DFAState* createDFAState(EpsilonClosure *closure, int stateID, NFA *nfa) {
    DFAState *newDFAState = malloc(sizeof(DFAState));
    newDFAState->NFAStateSet = closure;
    newDFAState->StateID = stateID;
    newDFAState->transitions = NULL;

    newDFAState->isAccepting = 0;
    for (int i = 0; i < closure->count; i++) {
        if (nfa->accept->StateID == closure->states[i]->StateID) {
            newDFAState->isAccepting = 1;
            break;
        }
    }

    return newDFAState;
}

void freeDFATransition(DFATransition *transition) {
    if (transition) {
        freeDFATransition(transition->next);  // 递归释放链表
        free(transition);
    }
}

void freeDFAState(DFAState *state) {
    if (state) {
        // 释放转移列表
        freeDFATransition(state->transitions);
        
        // 释放ε闭包
        if (state->NFAStateSet) {
            if (state->NFAStateSet->states) {
                free(state->NFAStateSet->states);
            }
            free(state->NFAStateSet);
        }

        // 释放状态本身
        free(state);
    }
}

void freeDFA(DFAState *start) {
    // 使用一个队列或栈，确保我们不会重复访问和释放任何状态
    DFAState **queue = malloc(DFAStateCount * sizeof(DFAState*));
    int front = 0, rear = 0;

    bool *visited = calloc(DFAStateCount, sizeof(bool));

    queue[rear++] = start;
    visited[start->StateID] = true;

    while (front < rear) {
        DFAState *current = queue[front++];
        DFATransition *transition = current->transitions;
        while (transition) {
            if (!visited[transition->destination->StateID]) {
                queue[rear++] = transition->destination;
                visited[transition->destination->StateID] = true;
            }
            transition = transition->next;
        }
        
        freeDFAState(current);
    }

    free(queue);
    free(visited);
}


int isStateInClosure(EpsilonClosure* closure, int NFAStateID) {
    for (int i = 0; i < closure->count; i++) {
        if (closure->states[i]->StateID == NFAStateID) {
            return 1;  // 存在
        }
    }
    return 0;  // 不存在
}

void mergeClosures(EpsilonClosure* destClosure, EpsilonClosure* srcClosure) {
    for (int i = 0; i < srcClosure->count; i++) {
        if (!isStateInClosure(destClosure, srcClosure->states[i]->StateID)) {
            destClosure->states[destClosure->count++] = srcClosure->states[i];
        }
    }
}

void getTargetNFAStates(EpsilonClosure* closure, char symbol, EpsilonClosure* targetStates) {
    for (int i = 0; i < closure->count; i++) {
        NFAState* currentNFAState = closure->states[i];
        NFATransition* trans = currentNFAState->transitions;
        while (trans) {
            if (trans->symbol == symbol && !isStateInClosure(targetStates, trans->destination->StateID)) {
                targetStates->states[targetStates->count++] = trans->destination;
            }
            trans = trans->next;
        }
    }
}

EpsilonClosure* GetNewClosure(DFAState* dfaState, char symbol) {
    EpsilonClosure* targetStates = (EpsilonClosure*)malloc(sizeof(EpsilonClosure));
    targetStates->count = 0;

    getTargetNFAStates(dfaState->NFAStateSet, symbol, targetStates);

    for (int i = 0; i < targetStates->count; i++) {
        EpsilonClosure* newClosure = computeEpsilonClosure(targetStates->states[i]);
        mergeClosures(targetStates, newClosure);
        free(newClosure->states); // 释放分配的状态数组
        free(newClosure);         // 释放computeEpsilonClosure分配的内存
    }

    if (targetStates->count == 0) {
        free(targetStates);
        return NULL;
    }

    return targetStates;
}



//
typedef struct DFAStateSetNode DFAStateSetNode;

struct DFAStateSetNode {
    DFAState *state;
    DFAStateSetNode *next;
};

typedef struct {
    DFAStateSetNode *head;
    DFAStateSetNode *tail;
    int size;
} DFAStateSetList;
// 将状态添加到工作列表
void addToWorklist(DFAStateSetList* list, DFAState* state) {
    DFAStateSetNode *node = (DFAStateSetNode*)malloc(sizeof(DFAStateSetNode));
    node->state = state;
    node->next = NULL;
    
    if (list->tail) {
        list->tail->next = node;
        list->tail = node;
    } else {
        list->head = list->tail = node;
    }
    
    list->size++;
}
// 从工作列表中删除并返回第一个状态
DFAState* removeFromWorklist(DFAStateSetList* list) {
    if (list->head) {
        DFAStateSetNode *node = list->head;
        list->head = list->head->next;
        if (!list->head) list->tail = NULL;
        
        DFAState* state = node->state;
        free(node);
        list->size--;
        return state;
    }
    return NULL;
}
#endif // NFA_H