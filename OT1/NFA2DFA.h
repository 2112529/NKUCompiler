#define MAX_STATES 100 // the number of NFA states根据实际情况调整
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




typedef struct EpsilonClosure {
    int *states;   // 状态数组
    int count;     // 状态的数量
} EpsilonClosure;

int DFAStateCount=0;
//计算NFA中某一状态的e闭包
void DFS(NFAState *state, int *visited, EpsilonClosure *closure) {
    // 如果状态已经被访问过，返回
    if (visited[state->StateID]) return;

    // 标记状态为已访问
    visited[state->StateID] = 1;

    // 添加状态到ε闭包
    closure->states[closure->count++] = state->StateID;

    // 遍历状态的所有转换
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
    closure->states = malloc(MAX_STATES * sizeof(int));
    closure->count = 0;

    bool visited[MAX_STATES] = { false };
    DFS(state, visited, closure);

    return closure;
}
//
DFAState* createDFAState(EpsilonClosure *closure, int stateID, NFA *nfa) {
    DFAState *newDFAState = malloc(sizeof(DFAState));
    newDFAState->NFAStateSet = closure;
    newDFAState->StateID = stateID;
    newDFAState->transitions = NULL;

    // 判断该DFA状态是否应该是接受状态
    newDFAState->isAccepting = 0;
    for (int i = 0; i < closure->count; i++) {
        if (nfa->accept->StateID == closure->states[i]) {
            newDFAState->isAccepting = 1;
            break;
        }
    }

    return newDFAState;
}

// 根据给定的DFA状态和一个字符计算新的e closure
// 检查给定的NFAStateID是否在EpsilonClosure中
int isStateInClosure(EpsilonClosure* closure, int NFAStateID) {
    for (int i = 0; i < closure->count; i++) {
        if (closure->states[i]->StateID == NFAStateID) {
            return 1;  // 存在
        }
    }
    return 0;  // 不存在
}

// 将srcClosure的状态合并到destClosure中，确保没有重复的状态
void mergeClosures(EpsilonClosure* destClosure, EpsilonClosure* srcClosure) {
    for (int i = 0; i < srcClosure->count; i++) {
        if (!isStateInClosure(destClosure, srcClosure->states[i]->StateID)) {
            destClosure->states[destClosure->count++] = srcClosure->states[i];
        }
    }
}

// 获取从给定NFA状态通过给定符号转移到的所有NFA状态
void getTargetNFAStates(EpsilonClosure* closure, char symbol, EpsilonClosure* targetStates) {
    for (int i = 0; i < closure->count; i++) {
        NFAState* currentNFAState = closure->states[i];
        NFATransition* trans = currentNFAState->transitions;
        while (trans) {
            if (trans->symbol == symbol && !isStateInClosure(targetStates, trans->destination->StateID)) {
                // 添加这个目标状态到targetStates
                targetStates->states[targetStates->count++] = trans->destination;
            }
            trans = trans->next;
        }
    }
}

// 从给定的DFAState和符号计算新的ε闭包
EpsilonClosure* GetNewClosure(DFAState* dfaState, char symbol) {
    EpsilonClosure* targetStates = (EpsilonClosure*)malloc(sizeof(EpsilonClosure));
    targetStates->count = 0;

    // 根据符号获取目标NFA状态集
    getTargetNFAStates(dfaState->NFAStateSet, symbol, targetStates);

    // 计算这个目标NFA状态集的ε闭包
    for (int i = 0; i < targetStates->count; i++) {
        EpsilonClosure* newClosure = computeEpsilonClosure(targetStates->states[i]);
        // 合并新的ε闭包到targetStates
        mergeClosures(targetStates, newClosure);
        free(newClosure);  // 如果computeEpsilonClosure分配了内存
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
