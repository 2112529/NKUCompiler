#include"./NFA2DFA.h"
#include <string.h>



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
            if (NewClosure) {
                DFAState *newState = createDFAState(NewClosure, DFAStateCount++,&finalNFA);
                addToWorklist(&worklist, newState);
                addDFATransition
                    (currentState, alphabet[i], newState);
            }
        }
    }

    return processed.head->state;  // 返回DFA的初始状态
}
int main()
{
    char FinalNFAalphabet[10];
    findAlphabet(&finalNFA,FinalNFAalphabet);
    FinalDFA = convertNFAtoDFA(finalNFA.start, FinalNFAalphabet);
    PrintDFA(FinalDFA);
    //freeDFA(FinalDFA);
    return 0;
}


