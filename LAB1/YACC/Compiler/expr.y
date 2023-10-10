%{
/*********************************************
本文件主要解决的问题就是实现id识别以及赋值功能的实现,仅支持单次赋值运算
YACC file
**********************************************/
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>

int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char* s);
int num =0;
char IDlist [100][20];
double  IDval[100];
int IDpointer;
double GetIDVal(char* name);
void SetIDVal(char* name, double value);
int temp_counter = 1;



%}

%union {
    double val;
    char* str;
}

//TODO:给每个符号定义一个单词类别
%token ADD MINUS
%token MUL DIV
%token LPAREN RPAREN
%token  EQ
%token <str> ID
%token <val> INTEGER

%type <val> expr
%type <val> lines


%left ADD MINUS
%left MUL DIV
%right UMINUS
        

%%


lines   :       lines expr ';' { printf("%f\n", $2); }
        |       lines ID EQ expr ';' { emit("STORE %s %s\n", $2, $4); SetIDVal($2, $4); free($2); free($4); }
        |       lines ';'
        |       { $$ = strdup(""); }
        ;

expr    :       expr ADD expr   { $$ = new_temp(); emit("ADD %s %s %s\n", $$, $1, $3); free($1); free($3); }
        |       expr MINUS expr { $$ = new_temp(); emit("SUB %s %s %s\n", $$, $1, $3); free($1); free($3); }
        |       expr MUL expr   { $$ = new_temp(); emit("MUL %s %s %s\n", $$, $1, $3); free($1); free($3); }
        |       expr DIV expr   { $$ = new_temp(); emit("DIV %s %s %s\n", $$, $1, $3); free($1); free($3); }
        |       LPAREN expr RPAREN  { $$ = $2; }
        |       MINUS expr %prec UMINUS   { $$ = new_temp(); emit("NEG %s %s\n", $$, $2); free($2); }
        |       ID { $$ = strdup($1); free($1); }
        |       INTEGER { $$ = new_temp(); emit("LOAD %s %f\n", $$, $1); }
        ;



%%

// programs section
void emit(const char* format, ...) {
    va_list args;
    va_start(args, format);
    vfprintf(stdout, format, args);
    va_end(args);
}
char* new_temp() {
    char buffer[10];
    snprintf(buffer, sizeof(buffer), "t%d", temp_counter++);
    return strdup(buffer);
}

int yylex()
{
    char t;
    while(1){
        t=getchar();
        if(t==' '||t=='\t'||t=='\n'){
            
        }else if('0'<=t&&t<='9'){
            // printf("num process");
            //TODO:解析多位数字返回数字类型
            //yylval=0;
            num =0;
            while('0'<=t&&t<='9'){
                num=num*10+t-'0';
                t=getchar();
            }
            ungetc(t,stdin);
            yylval.val = num;
            return INTEGER;
        }
        else if(('a'<=t&&t<='z')||('A'<=t&&t<='Z')||t=='_'){
            int charpointer=0;
            // IDval[charpointer]=t;
            // t=getchar();
            while(('a'<=t&&t<='z')||('A'<=t&&t<='Z')||('0'<=t&&t<='9')||t=='_'){
                IDlist[IDpointer][charpointer]=t;
                charpointer++;
                t=getchar();
            }
            ungetc(t,stdin);
            //IDlist[IDpointer][charpointer]='\0';
            char* tempID = (char*)malloc(charpointer + 1);
            strncpy(tempID, IDlist[IDpointer], charpointer);
            tempID[charpointer] = '\0';
            yylval.str = tempID;

            //yylval.str=IDlist[IDpointer];
            return ID;
        }else if(t=='+'){
            //printf("++++++");
            return ADD;
        }else if(t=='-'){
            return MINUS;
        }//TODO:识别其他符号
        else if(t=='*'){
            return MUL;
        }
        else if(t=='/'){
            return DIV;
        }
        else if(t=='('){
            return LPAREN;
        }
        else if(t==')'){
            return RPAREN;
        }
        else if (t=='='){
            return EQ;
        }
        else{
            num=0;
            return t;
        }
    }
}
double GetIDVal(char* name) {
    for(int i = 0; i < IDpointer; i++) {
        if(strcmp(IDlist[i], name) == 0) {
            return IDval[i];
        }
    }
    return 0.0; // 未赋值的变量取0
}

void SetIDVal(char* name, double value) {
    for(int i = 0; i < IDpointer; i++) {
        if(strcmp(IDlist[i], name) == 0) {
            IDval[i] = value;
            return;
        }
    }
    strcpy(IDlist[IDpointer], name);
    IDval[IDpointer] = value;
    IDpointer++;
}

int main(void)
{
    yyin=stdin;
    do{
        //printf("parsing-------");
        yyparse();
    }while(!feof(yyin));
    return 0;
}
void yyerror(const char* s){
    fprintf(stderr,"Parse error: %s\n",s);
    exit(1);
}