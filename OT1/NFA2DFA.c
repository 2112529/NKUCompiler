#include <stdio.h>
#include <stdlib.h>
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
// 声明DFA的数据结构
typedef struct DFAState DFAState;
typedef struct DFATransition DFATransition;
struct DFATransition {
    char symbol;
    DFAState *source;
    DFAState *destination;
    DFATransition *next;
};
struct DFAState {
    int isAccepting;
    DFATransition *transitions;
    int StateID;
};

