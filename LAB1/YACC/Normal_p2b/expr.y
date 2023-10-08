%{
/*********************************************
YACC file
基础程序
Date:2023/9/19
forked SherryXiye
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


lines   :       lines expr ';' {  }
        |       lines ';'
        |
        ;

expr    :       expr ADD expr   { $$=$1+$3;printf("+"); }
        |       expr MINUS expr   { $$=$1-$3;printf("-"); }
        |       expr MUL expr   { $$=$1*$3;printf("*") ;}
        |       expr DIV expr   { $$=$1/$3; printf("/");}
        |       LPAREN expr RPAREN      {printf("("); $$=$2;printf(")");}
        |       MINUS expr %prec UMINUS   {printf("-");$$=-$2;}
        |       NUMBER
        ;
    
NUMBER  :       INTEGER          {$$=num;printf("%d",num);}
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
        yyparse();
    }while(!feof(yyin));
    return 0;
}
void yyerror(const char* s){
    fprintf(stderr,"Parse error: %s\n",s);
    exit(1);
}
