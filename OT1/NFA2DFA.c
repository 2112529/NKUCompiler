//NFA转成DFA
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>
#include <math.h>
#include <time.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <assert.h>
#define MAX_NFA_STATES 10000
#define MAX_DFA_STATES 100000
#define MAX_DFA_TRANS 1000000
#define MAX_DFA_TRANS_LEN 1000000
#define MAX_DFA_TRANS_CHARS 1000000
#define MAX_DFA_TRANS_CHARS_LEN 1000000
#define MAX_DFA_TRANS_CHARS_CHARS 1000000
#define MAX_DFA_TRANS_CHARS_CHARS_LEN 1000000
#define MAX_DFA_TRANS_CHARS_CHARS_CHARS 1000000
#define MAX_DFA_TRANS_CHARS_CHARS_CHARS_LEN 1000000
#define MAX_DFA_TRANS_CHARS_CHARS_CHARS_CHARS 1000000
#define MAX_DFA_TRANS_CHARS_CHARS_CHARS_CHARS_LEN 1000000
#define MAX_DFA_TRANS_CHARS_CHARS_CHARS_CHARS_CHARS 100000
//define struct NFA
struct NFA_STATES{
    int id;
    int is_end;
    int is_start;
    int is_accept;
    int is_reject;
    int is_accept_reject;
    int is_start_accept;
    int is_start_reject;
    int is_start_accept_reject;
    int is_end_accept;
    int is_end_reject;
    int is_end_accept_reject;
    int is_end_start;
    int is_end_start_accept;
    int is_end_start_reject;
    int is_end_start_accept_reject;
    int is_end_accept_reject;
    int is_end_start_accept_reject;
    int is_end_end;
    int is_end_end_accept;
    int is_end_end_reject;
    int is_end_end_accept_reject;
    int is_end_end_start;
    int is_end_end_start_accept;
    int is_end_end_start_reject;
    int is_end_end_start_accept_reject;
    int is_end_end_accept_reject;
    int is_end_end_start_accept_reject;
    int is_end_end_end;
    int is_end_end_end_accept;
    int is_end_end_end_reject;
    int is_end_end_end_accept_reject;
    int is_end_end_end_start;
};
//define struct DFA
struct DFA_STATES{
    int id;
    int is_end;
    int is_start;
    int is_accept;
    int is_reject;
    int is_accept_reject;
    int is_start_accept;
    int is_start_reject;
    int is_start_accept_reject;
    int is_end_accept;
    int is_end_reject;
    int is_end_accept_reject;
    int is_end_start;
    int is_end_start_accept;
    int is_end_start_reject;
    int is_end_start_accept_reject;
    int is_end_accept_reject;   
    int is_end_start_accept_reject;
    int is_end_end;
};
omp_lock_t lock;
struct DFA_STATES *dfa_states;
struct DFA_STATES *dfa_states_accept;
struct DFA_STATES *dfa_states_reject;
struct DFA_STATES *dfa_states_accept_reject;
struct DFA_STATES *dfa_states_start;
