#include<stdio.h>
#include<stdlib.h>
// 声明NFA的数据结构
typedef struct State State;
typedef struct Transition Transition;
struct Transition {
    char symbol;
    State *source;
    State *destination;
    Transition *next;
};
struct State {
    int isAccepting;
    Transition *transitions;
    int StateID;
};
typedef struct {
    State *start;
    State *accept;
    Transition *transitions;
} NFA;
// 声明NFA操作函数
NFA createBasicNFA(char c);
NFA createUnionNFA(NFA a, NFA b);
NFA createConcatNFA(NFA a, NFA b);
NFA createStarNFA(NFA a);

void printNFA(NFA nfa, FILE *output) {
    // 创建一个队列存放待访问的状态
    State* queue[1000]; // 假设最多有1000个状态，你可以根据需要增减
    int front = 0, rear = 0;

    // 创建一个标记数组来记录哪些状态已被访问
    bool visited[1000] = {false};

    // 开始状态入队
    queue[rear++] = nfa.start;
    visited[nfa.start->StateID] = true;

    while (front != rear) { // 当队列不为空时
        State* currentState = queue[front++];
        //if(currentState->isAccepting==1&&front!=rear)continue;

        fprintf(output, "State: %d, isAccepting: %d\n", currentState->StateID, currentState->isAccepting);
        
        Transition* currentTrans = currentState->transitions;
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
