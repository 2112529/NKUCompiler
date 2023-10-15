%{
/*********************************************

YACC file
**********************************************/
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char* s);
// 声明NFA的数据结构
typedef struct State State;
typedef struct Transition Transition;
struct Transition {
    char symbol;
    State *destination;
    Transition *next;
};
struct State {
    int isAccepting;
    Transition *transitions;
};
typedef struct {
    State *start;
    State *accept;
} NFA;

// 声明NFA操作函数
NFA createBasicNFA(char c);
NFA createUnionNFA(NFA a, NFA b);
NFA createConcatNFA(NFA a, NFA b);
NFA createStarNFA(NFA a);

%}

%union {
    char charval;
    NFA nfaval;
}
//TODO:给每个符号定义一个单词类别
%token OR
%token STAR
%token LPAREN
%token RPAREN

%token <charval> CHAR
%type <nfaval> regex concat basic

%%



//描述正则表达式

regex   : regex OR concat       { $$ = createUnionNFA($1, $3); }
        | concat                { $$ = $1; }
        ;

concat  : concat basic          { $$ = createConcatNFA($1, $2); }
        | basic                { $$ = $1; }
        ;

basic   : basic STAR            { $$ = createStarNFA($1); }
        | CHAR                 { $$ = createBasicNFA($1); }
        | LPAREN regex RPAREN  { $$ = $2; }
        ;



%%

// programs section


// 创建一个新的状态
State* createState(int isAccepting) {
    State *s = malloc(sizeof(State));
    s->isAccepting = isAccepting;
    s->transitions = NULL;
    return s;
}

// 添加一个转换到状态
void addTransition(State *from, char symbol, State *to) {
    Transition *t = malloc(sizeof(Transition));
    t->symbol = symbol;
    t->destination = to;
    t->next = from->transitions;
    from->transitions = t;
}

// 创建一个基本的NFA，它接受一个字符
NFA createBasicNFA(char c) {
    State *start = createState(0);
    State *accept = createState(1);
    addTransition(start, c, accept);
    return (NFA) {start, accept};
}
NFA createUnionNFA(NFA a, NFA b) {
    State *start = createState(0);
    State *accept = createState(1);

    addTransition(start, 0, a.start);
    addTransition(start, 0, b.start);
    addTransition(a.accept, 0, accept);
    addTransition(b.accept, 0, accept);

    a.accept->isAccepting = 0;
    b.accept->isAccepting = 0;

    return (NFA) {start, accept};
}
NFA createConcatNFA(NFA a, NFA b) {
    State *start = createState(0);
    State *accept = createState(1);

    addTransition(start, 0, a.start);
    addTransition(a.accept, 0, b.start);
    addTransition(b.accept, 0, accept);

    a.accept->isAccepting = 0;
    b.accept->isAccepting = 0;

    return (NFA) {start, accept};
}
NFA createStarNFA(NFA a) {
    State *start = createState(0);
    State *accept = createState(1);

    addTransition(start, 0, a.start);
    addTransition(a.accept, 0, a.start);
    addTransition(a.accept, 0, accept);

    a.accept->isAccepting = 0;

    return (NFA) {start, accept};
}




int yylex() {
    char t;
    t = getchar();
    switch(t) {
        case '|': return OR;
        case '*': return STAR;
        case '(': return LPAREN;
        case ')': return RPAREN;
        case '\n':
        case ' ':
        case '\t': return yylex(); // 忽略空白字符
        default:
            if (isalnum(t)) {
                yylval.charval = t;
                return CHAR;
            }
            break;
    }
    return t;
}



int main(void)
{
    yyin=stdin;
    do{
        yyparse();
    }while(!feof(yyin));
    return 0;
}
void yyerror(const char* s){
    fprintf(stderr,"Parse error: %s\n",s);
    exit(1);
}