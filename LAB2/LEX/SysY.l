%option noyywrap

%top{
#include<math.h>
}

%{
int chars=0,words=0,lines=0;
struct Myset
{
    char *type;
    char *content;
    int value;
}Myset[100];
int Myset_index=0;
%}

ID      [a-zA-Z_][a-zA-Z0-9_]*
NUM     [0-9]+
IF      if
ELSE    else
WHILE   while
RETURN  return
EQ      ==
NEQ     !=
LT      <
LE      <=
GT      >
GE      >=

%%

{ID}    {
            fprintf(yyout, "TOKEN: ID, LEXEME: %s, ATTRIBUTE: Identifier\n", yytext);
            words++;
            chars += strlen(yytext);
        }
{NUM}   {
            fprintf(yyout, "TOKEN: NUM, LEXEME: %s, ATTRIBUTE: Numeric Constant\n", yytext);
            words++;
            chars += strlen(yytext);
        }
{IF}    { fprintf(yyout, "TOKEN: IF, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); }
{ELSE}  { fprintf(yyout, "TOKEN: ELSE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); }
{WHILE} { fprintf(yyout, "TOKEN: WHILE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); }
{RETURN} { fprintf(yyout, "TOKEN: RETURN, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); }
{EQ}    { fprintf(yyout, "TOKEN: EQ, LEXEME: %s, ATTRIBUTE: Equality Operator\n", yytext); }
{NEQ}   { fprintf(yyout, "TOKEN: NEQ, LEXEME: %s, ATTRIBUTE: Not Equal Operator\n", yytext); }
{LT}    { fprintf(yyout, "TOKEN: LT, LEXEME: %s, ATTRIBUTE: Less Than Operator\n", yytext); }
{LE}    { fprintf(yyout, "TOKEN: LE, LEXEME: %s, ATTRIBUTE: Less Than or Equal Operator\n", yytext); }
{GT}    { fprintf(yyout, "TOKEN: GT, LEXEME: %s, ATTRIBUTE: Greater Than Operator\n", yytext); }
{GE}    { fprintf(yyout, "TOKEN: GE, LEXEME: %s, ATTRIBUTE: Greater Than or Equal Operator\n", yytext); }

"{"     { fprintf(yyout, "TOKEN: LBRACE, LEXEME: %s, ATTRIBUTE: Left Brace\n", yytext); }
"}"     { fprintf(yyout, "TOKEN: RBRACE, LEXEME: %s, ATTRIBUTE: Right Brace\n", yytext); }
";"     { fprintf(yyout, "TOKEN: SEMICOLON, LEXEME: %s, ATTRIBUTE: Semicolon\n", yytext); }
"("     { fprintf(yyout, "TOKEN: LPAREN, LEXEME: %s, ATTRIBUTE: Left Parenthesis\n", yytext); }
")"     { fprintf(yyout, "TOKEN: RPAREN, LEXEME: %s, ATTRIBUTE: Right Parenthesis\n", yytext); }
"+"     { fprintf(yyout, "TOKEN: PLUS, LEXEME: %s, ATTRIBUTE: Addition Operator\n", yytext); }
"-"     { fprintf(yyout, "TOKEN: MINUS, LEXEME: %s, ATTRIBUTE: Subtraction Operator\n", yytext); }
"*"     { fprintf(yyout, "TOKEN: MULT, LEXEME: %s, ATTRIBUTE: Multiplication Operator\n", yytext); }
"/"     { fprintf(yyout, "TOKEN: DIV, LEXEME: %s, ATTRIBUTE: Division Operator\n", yytext); }

\n      { lines++; }
.       { chars++; }

%%

int main(int argc,char **argv){
        if(argc>1){
            yyin=fopen(argv[1],"r");
            if(argc>2){ 
                yyout=fopen(argv[2],"w");
            }
        }
    yylex();
    fprintf(yyout,"%8d%8d%8d\n",lines,words,chars);
    return 0;
    }
