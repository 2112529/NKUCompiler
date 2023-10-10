// 实现功能更强的词法分析和语法分析程序，使之能支持变量，
// 修改词法分析程序，能识别变量（标识符）和“=”符号，修改语法分析器，
// 使之能分析、翻译“a=2”形式的（或更复杂的，“a=表达式”）赋值语句，
// 当变量出现在表达式中时，能正确获取其值进行计算（未赋值的变量取0）。
// 当然，这些都需要实现符号表的功能
%{
//头文件的引入
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>

//全局变量和函数的声明
int yylex();
extern int yyparse();
FILE* yyin;
int jishu=0;
void yyerror(const char* s);
double getSymbolValue(char* name);//获取符号表中的值
void setSymbolValue(char* name, double value);//设置符号表中的值
char* append(char* a, char* b, char* op); // 拼接字符串

//符号表用于存储变量名和它们的值。这是一个简单的符号表实现，最多可以存储256个变量
typedef struct Symbol {
    char name[256];       
    double value;
} Symbol;

Symbol symbols[256];
int symbolCount = 0;//符号表中的元素个数

%}


%union {//这定义了一个联合类型，它可以存储一个双精度浮点数或一个字符串指针。这用于存储词法单元的值。
    double val;
    char* str;
}

%token <str> VAR
%token <val> NUM
%token ADD MINUS MULTIPLY DIVIDE LEFT RIGHT ASSIGN

%left ADD MINUS
%left MULTIPLY DIVIDE
%right UMINUS         

%type <val> expr
%type <val> lines

%%

lines   :       lines expr ';' { printf("%f\n", $2); }
        |       lines VAR ASSIGN expr ';' { setSymbolValue($2, $4); printf("%f\n", $4); free($2); }
        |       lines ';'
        |       /* empty */ { $$ = 0; }
        ;

expr    :       expr ADD expr   { $$ = $1 + $3; }
        |       expr MINUS expr { $$ = $1 - $3; }
        |       expr MULTIPLY expr { $$ = $1 * $3; }
        |       expr DIVIDE expr { if($3 != 0) $$ = $1 / $3; }
        |       MINUS expr %prec UMINUS { $$ = -$2; }
        |       LEFT expr RIGHT { $$ = $2; }
        |       VAR { $$ = getSymbolValue($1); free($1); }
        |       NUM { $$ = $1; }
        ;

%%

int yylex()
{
    int t;
    char buffer[256];
    int idx = 0;
    while(1){
        t=getchar();
        if(t==' '||t=='\t'||t=='\n'){
            //do nothing
        }else if(isalpha(t)){
            buffer[idx++] = t;
            while(isalnum(t = getchar())) {
                buffer[idx++] = t;
            }
            buffer[idx] = '\0';
            yylval.str = strdup(buffer);
            ungetc(t, stdin);
            return VAR;
        }else if(isdigit(t)){
            yylval.val = 0;
            while(isdigit(t)){
                yylval.val = yylval.val*10 + t-'0';
                t=getchar();               
            }
            ungetc(t, stdin);
            return NUM;
        }else if(t=='+'){
            return ADD;
        }else if(t=='-'){
            return MINUS;
        }else if(t=='*'){
            return MULTIPLY;
        }else if(t=='/'){
            return DIVIDE;
        }else if(t=='('){
            return LEFT;
        }else if(t==')'){
            return RIGHT;
        }else if(t=='='){
            return ASSIGN;
        }else{
            return t;
        }
    }
}
double getSymbolValue(char* name) {
    for(int i = 0; i < symbolCount; i++) {
        if(strcmp(symbols[i].name, name) == 0) {
            return symbols[i].value;
        }
    }
    return 0.0; // 未赋值的变量取0
}

void setSymbolValue(char* name, double value) {
    for(int i = 0; i < symbolCount; i++) {
        if(strcmp(symbols[i].name, name) == 0) {
            symbols[i].value = value;
            return;
        }
    }
    strcpy(symbols[symbolCount].name, name);
    symbols[symbolCount].value = value;
    symbolCount++;
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
