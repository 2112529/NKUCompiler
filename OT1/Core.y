%{
/*********************************************

YACC file
**********************************************/
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include <stdbool.h>
#include"./NFA.h"
int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char* s);


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

regex   : regex OR concat       { $$ = createUnionNFA($1, $3); *finalNFA = $$; }
        | concat                { $$ = $1; *finalNFA = $$; }
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
NFAState* createState(int isAccepting) {
    NFAState *s = malloc(sizeof(NFAState));
    s->isAccepting = isAccepting;
    s->transitions = NULL;
    //s->next = NULL;
    s->StateID=StateIDCount++;
    return s;
}

// 添加一个转换到状态
void addTransition(NFAState *from, char symbol, NFAState *to) {
    NFATransition *t = malloc(sizeof(NFATransition));
    t->symbol = symbol;
    t->destination = to;
    t->next = from->transitions;
    from->transitions = t;
}

// 创建一个基本的NFA，它接受一个字符
NFA createBasicNFA(char c) {
    NFAState *start = createState(0);
    NFAState *accept = createState(1);
    addTransition(start, c, accept);
    return (NFA) {start, accept};
}
NFA createUnionNFA(NFA a, NFA b) {


    NFAState *start = createState(0);
    NFAState *accept = createState(1);

    addTransition(start, 'e', a.start);
    addTransition(start, 'e', b.start);
    addTransition(a.accept, 'e', accept);
    addTransition(b.accept, 'e', accept);

    a.accept->isAccepting = 0;
    b.accept->isAccepting = 0;

    return (NFA) {start, accept};
}
NFA createConcatNFA(NFA a, NFA b) {
    NFAState *start = createState(0);
    NFAState *accept = createState(1);

    addTransition(start, 'e', a.start);
    addTransition(a.accept, 'e', b.start);
    addTransition(b.accept, 'e', accept);

    a.accept->isAccepting = 0;
    b.accept->isAccepting = 0;

    return (NFA) {start, accept};
}
NFA createStarNFA(NFA a) {
    NFAState *start = createState(0);
    NFAState *accept = createState(1);

    addTransition(start, 'e', a.start);
    addTransition(a.accept, 'e', a.start);
    addTransition(a.accept, 'e', accept);
    addTransition(start, 'e', accept);

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
    FILE* file = fopen("output", "w");
    if (file) {
        printNFA(*finalNFA, file);
        fclose(file);
    } else {
        fprintf(stderr, "Unable to open output file.\n");
    }

    return 0;
}
void yyerror(const char* s){
    fprintf(stderr,"Parse error: %s\n",s);
    exit(1);
}