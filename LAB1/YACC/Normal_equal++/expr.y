%{
/*********************************************
本文件主要解决的问题就是实现id识别以及赋值功能的实现,仅支持单次赋值运算
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
char id [20];
char idlist [20][20];


%}

//TODO:给每个符号定义一个单词类别
%token ADD MINUS
%token MUL DIV
%token LPAREN RPAREN
%token  EQ
%token ID
%token INTEGER

%left ADD MINUS
%left MUL DIV
%right UMINUS
        

%%


lines   :       lines expr ';' { printf("%f\n", $2); }
        |       lines ';'
        |
        ;

LEFTVARIABLE EQUAL expr {$$=$3;idval[equalid[equalnum-1]]=$3;equalnum-=1;}
//TODO:完善表达式的规则
expr    :       expr ADD expr   { $$=$1+$3; }
        |       expr MINUS expr   { $$=$1-$3; }
        |       expr MUL expr   { $$=$1*$3; }
        |       expr DIV expr   { $$=$1/$3; }
        |       LPAREN expr RPAREN  { $$=$2; }
        |       MINUS expr %prec UMINUS   {$$=-$2;}
        |       ID EQ expr  { $$=$3;idval[equalid[equalnum-1]]=$3;equalnum-=1; }
        |       ID  { $$=num; }
        |       NUMBER
        ;

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
        }
        else if(('a'<=t&&t<='z')||('A'<=t&&t<='Z')||t=='_'){
            id[0]='\0';
            while(isdigit(t) || isalpha(t)){
                char temp[2] = {t,'\0'};
                strcat(id,temp);
                t = getchar();
            }
            for(idnow = 1;idnow<=idnum;idnow++){
                if(strcmp(idlist[idnow],strval)==0){
                    break;
                }
            }
            strcpy(idlist[idnow],id);
            


            ungetc(t,stdin);
            return ID;

        }
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
        else if(t=='<'){
            return LT;
        }
        else if(t=='>'){
            return GT;
        }
        else if(t=='!'){
            return NE;
        }
        else if(t=='&'){
            return AND;
        }
        else if(t=='|'){
            return OR;
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