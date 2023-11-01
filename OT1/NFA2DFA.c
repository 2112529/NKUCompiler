#include <stdio.h>
#include <stdlib.h>
#include "./NFA.h"
#include"./NFA2DFA.h"
#include <stdbool.h>


EpsilonClosure* computeEpsilonClosures(NFAState **allStates, int totalStates) {
    EpsilonClosure *closures = malloc(totalStates * sizeof(EpsilonClosure));
    for (int i = 0; i < totalStates; i++) {
        closures[i].states = malloc(totalStates * sizeof(int));
        closures[i].count = 0;
        int *visited = calloc(totalStates, sizeof(int));
        DFS(allStates[i], visited, &closures[i]);
        free(visited);
    }
    return closures;
}


// 将NFA转换为DFA
DFAState* convertNFAtoDFA(NFAState *start,  char *alphabet) {
    // 初始工作队列
    DFAStateSetList worklist = { NULL, NULL, 0 };
    DFAStateSetList processed = { NULL, NULL, 0 };

    // 为NFA的初始状态创建一个新的DFA状态集合
    EpsilonClosure *InitialClosure = computeEpsilonClosure(start);
    DFAState* InitDFAState = createDFAState(InitialClosure, DFAStateCount++,&finalNFA);
    addToWorklist(&worklist, InitDFAState);

    while (worklist.size) {
        DFAState *currentState = removeFromWorklist(&worklist);
        addToWorklist(&processed, currentState);
        
        for(int i = 0; i < strlen(alphabet); i++) {
            EpsilonClosure *NewClosure = GetNewClosure(currentState, alphabet[i]);
            // 在此处，你可能需要根据当前状态和alphabet[i]计算新的闭包
            if (NewClosure) {
                DFAState *newState = createDFAState(NewClosure, DFAStateCount++,&finalNFA);
                addToWorklist(&worklist, newState);
                addDFATransition
                    (currentState, alphabet[i], newState);
                    
                // 还需要在currentState和newState之间添加转移
            }
        }
    }

    return processed.head->state;  // 返回DFA的初始状态
}
int main()
{
    // int TotalStates=StateIDCount;
    // NFAState **AllStates = getAllStates(finalNFA.start, &TotalStates);
    // EpsilonClosure* Closures=computeEpsilonClosures(AllStates, TotalStates);
    char *FinalNFAalphabet;
    findAlphabet(&finalNFA,FinalNFAalphabet);
    DFAState* FinalDFA = convertNFAtoDFA(finalNFA.start, FinalNFAalphabet);
    printDFA(FinalDFA);
    freeDFA(FinalDFA);
    freeEpsilonClosures(Closures, TotalStates);
    return 0;
}


