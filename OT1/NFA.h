#ifndef NFA_H
#define NFA_H
#include<stdio.h>
#include<stdlib.h>
#include <stdbool.h>

// 声明NFA的数据结构
typedef struct NFAState NFAState;
typedef struct NFATransition NFATransition;
struct NFATransition {
    char symbol;
    NFAState *source;
    NFAState *destination;
    NFATransition *next;
};
struct NFAState {
    int isAccepting;
    NFATransition *transitions;
    int StateID;
};
typedef struct {
    NFAState *start;
    NFAState *accept;
    NFATransition *transitions;
} NFA;
NFA finalNFA;
int StateIDCount=0;
#define MAX_SYMBOLS 10
#define MAX_STATES 20 // the number of NFA states根据实际情况调整


// 声明NFA操作函数
NFA createBasicNFA(char c);
NFA createUnionNFA(NFA a, NFA b);
NFA createConcatNFA(NFA a, NFA b);
NFA createStarNFA(NFA a);


void printNFA(NFA nfa, FILE *output) {
    // 创建一个队列存放待访问的状态
    NFAState* queue[20]; // 假设最多有20个状态，你可以根据需要增减
    int front = 0, rear = 0;

    // 创建一个标记数组来记录哪些状态已被访问
    bool visited[20] = {false};

    // 开始状态入队
    queue[rear++] = nfa.start;
    visited[nfa.start->StateID] = true;

    while (front != rear) { // 当队列不为空时
        NFAState* currentState = queue[front++];
        //if(currentState->isAccepting==1&&front!=rear)continue;

        fprintf(output, "State: %d, isAccepting: %d\n", currentState->StateID, currentState->isAccepting);
        
        NFATransition* currentTrans = currentState->transitions;
        while (currentTrans != NULL) {
            fprintf(output, "\tTransition on '%c' to state %d\n", currentTrans->symbol, currentTrans->destination->StateID);
            
            // 如果目的状态未被访问，则将其添加到队列中
            if (!visited[currentTrans->destination->StateID]) {
                queue[rear++] = currentTrans->destination;
                visited[currentTrans->destination->StateID] = true;
            }

            currentTrans = currentTrans->next;
        }
    }
}
void dfs(NFAState* currentState, bool* symbolExists, bool* stateVisited, int* index, char* alphabet) {
    // 如果已经访问过该状态，直接返回
    if (stateVisited[currentState->StateID]) {
        return;
    }

    // 标记该状态为已访问
    stateVisited[currentState->StateID] = true;

    NFATransition* currentTrans = currentState->transitions;
    while (currentTrans) {
        if (!symbolExists[(unsigned char)currentTrans->symbol]) {
            symbolExists[(unsigned char)currentTrans->symbol] = true;
            alphabet[(*index)++] = currentTrans->symbol;
        }
        // 深度优先搜索下一个状态
        dfs(currentTrans->destination, symbolExists, stateVisited, index, alphabet);

        currentTrans = currentTrans->next;
    }
}
void findAlphabet(NFA* nfa, char* alphabet) {
    bool symbolExists[MAX_SYMBOLS] = { false };
    bool stateVisited[MAX_STATES] = { false };
    int index = 0;

    dfs(nfa->start, symbolExists, stateVisited, &index, alphabet);

    alphabet[index] = '\0'; // 结束符号
}
#endif // NFA_H

