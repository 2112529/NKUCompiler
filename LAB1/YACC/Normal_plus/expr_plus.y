%{
/*********************************************
将所有的词法分析功能均放在 yylex 函数内实现，为 +、-、*、\、(、 ) 每个运算符及整数分别定义一个单词类别，在 yylex 内实现代码，能
识别这些单词，并将单词类别返回给词法分析程序。
实现功能更强的词法分析程序，可识别并忽略空格、制表符、回车等
空白符，能识别多位十进制整数。
YACC file
**********************************************/
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#ifndef YYSTYPE
#define YYSTYPE double
#endif
int yylex();
extern int yyparse();
FILE* yyin;
void yyerror(const char* s);
int num =0;
char numStr[50];
char postfix[1000];  // to store the postfix expression
int postfix_index = 0;  // current index in postfix
%}

//TODO:给每个符号定义一个单词类别
%token ADD MINUS
%token MUL DIV
%token LPAREN RPAREN
%token INTEGER

%left ADD MINUS
%left MUL DIV
%right UMINUS
        

%%


lines   :       lines expr ';' { printf("%f\n", $2); }
        |       lines ';'
        |
        ;
//TODO:完善表达式的规则
expr    :       expr ADD expr   { $$=$1+$3; }
        |       expr MINUS expr   { $$=$1-$3; }
        |       expr MUL expr   { $$=$1*$3; }
        |       expr DIV expr   { $$=$1/$3; }
        |       LPAREN expr RPAREN  { $$=$2; }
        |       MINUS expr %prec UMINUS   {$$=-$2;}
        |       NUMBER
        ;
//支持中缀转后缀表达式
// expr    :       expr ADD expr   { $$ = strcat($1, $3); postfix[postfix_index++] = '+'; postfix[postfix_index] = '\0'; }
//         |       expr MINUS expr { $$ = strcat($1, $3); postfix[postfix_index++] = '-'; postfix[postfix_index] = '\0'; }
//         |       expr MUL expr   { $$ = strcat($1, $3); postfix[postfix_index++] = '*'; postfix[postfix_index] = '\0'; }
//         |       expr DIV expr   { $$ = strcat($1, $3); postfix[postfix_index++] = '/'; postfix[postfix_index] = '\0'; }
//         |       LPAREN expr RPAREN  { $$ = $2; }
//         |       MINUS expr %prec UMINUS   { $$ = $2; postfix[postfix_index++] = 'u'; postfix[postfix_index] = '\0'; }  // using 'u' for unary minus
//         |       NUMBER  { $$ = $1; strcat(postfix, $1); postfix_index += strlen($1); }

//         ;

NUMBER  :       INTEGER          {$$=yylval;}
        ;

%%

// programs section

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
            yylval = num;
            return INTEGER;
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
        // else if(t==';'){
        //     return EOL;
        // }
        else{
            num=0;
            return t;
        }
    }
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