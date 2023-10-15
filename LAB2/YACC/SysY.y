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
        |       lines ID EQ expr ';' { SetIDVal($2, $4); printf("%f\n", $4); free($2); }
        |       lines ';'
        |       { $$ = 0; }
        ;
//TODO:完善表达式的规则
expr    :       expr ADD expr   { $$=$1+$3; }
        |       expr MINUS expr   { $$=$1-$3; }
        |       expr MUL expr   { $$=$1*$3; }
        |       expr DIV expr   { $$=$1/$3; }
        |       LPAREN expr RPAREN  { $$=$2; }
        |       MINUS expr %prec UMINUS   {$$=-$2;}
        |       ID { $$ = GetIDVal($1); free($1); }
        |       INTEGER { $$ = $1; }
        ;


%%

// programs section

int yylex()
{
    char t;
    while(1){
        t=fgetc(yyin);
        if(t==' '||t=='\t'||t=='\n'){
            
        }else if('0'<=t&&t<='9'){
            // printf("num process");
            //TODO:解析多位数字返回数字类型
            //yylval=0;
            num =0;
            while('0'<=t&&t<='9'){
                num=num*10+t-'0';
                t=fgetc(yyin);
            }
            ungetc(t,yyin);
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
                t=fgetc(yyin);
            }
            ungetc(t,yyin);
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
    return 0.0; 
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

int main(int argc, char *argv[])
{
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Cannot open file");
        return 1;
    }
    yyin = file;
    do {
        yyparse();
    } while (!feof(yyin));
    fclose(file);
    return 0;
}
void yyerror(const char* s){
    fprintf(stderr,"Parse error: %s\n",s);
    exit(1);
}