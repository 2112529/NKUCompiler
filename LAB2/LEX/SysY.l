%option noyywrap

%top{
#include<math.h>
#include<stack>
#include<map>
#include<string>
#include<variant>
#include<iostream>
#include<fstream>
#include<string>
}

%{
int chars=0,words=0,lines=0;
int current_column = 0;
const int N =10000;
int arrnum=0;
std::string idtable[N];//存储全部的符号
int idnum = 0;
enum Context {
    NONE,
    DECLARATION
} currentContext = NONE;
// 符号表项结构
struct SymbolTableEntry {
    std::string word;            // 单词
    std::string lexeme;          // 词素
    int line_number;             // 行号
    int column_number;           // 列号
    std::string * ptr ;//符号表指针
   // SymbolTableEntry* attribute;  // 属性
    // 在此可以添加其他属性，如类型、值等。
};
struct output{
    std::string word;            // 单词
    std::string lexeme;          // 词素
    int line_number;             // 行号
    int column_number;           // 列号
    std::variant<float,SymbolTableEntry*,std::string*,char*,int> attribute;  // 属性
}arr[N];

// 符号表类
class SymbolTable {
public:
    SymbolTable() = default; 
    SymbolTable(const SymbolTable& other) : table(other.table) {}
    // 插入一个新的词素及其符号表项
    void insert(std::string lexeme, SymbolTableEntry entry) {
        table[lexeme] = entry;
    }

    // 查询词素，返回其符号表项
    SymbolTableEntry* lookup(std::string lexeme) {
        if (table.find(lexeme) != table.end()) {
            return &table[lexeme];
        }
        return nullptr;
    }
public:
    using iterator = std::map<std::string, SymbolTableEntry>::iterator;
    using const_iterator = std::map<std::string, SymbolTableEntry>::const_iterator;

    const_iterator begin() const {
        return table.begin();
    }

    const_iterator end() const {
        return table.end();
    }

private:
    std::map<std::string, SymbolTableEntry> table;  // 符号表的内部数据结构
};

// 使用栈来管理作用域，栈顶是当前的符号表
std::stack<SymbolTable> symbolTableStack;



void printSymbolTable(const SymbolTable& table, FILE* out) {
    for (SymbolTable::const_iterator it = table.begin(); it != table.end(); ++it) {
        fprintf(out, "Lexeme: %s\n", it->first.c_str()); // it->first 是词素
        // 打印其他属性...
    }
}



struct Myset
{
    char *type;
    char *content;
    int value;
}Myset[100];
int Myset_index=0;
%}


IF      if
ELSE    else
WHILE   while
RETURN  return
ID      [a-zA-Z_][a-zA-Z0-9_]*

NUM     [0-9]+(\.[0-9]+)?([eE][-+]?[0-9]+)?


DEC     [1-9][0-9]*|0
OCT     0[0-7]+
HEX     0[xX][0-9a-fA-F]+

FLO   [0-9]*\.[0-9]+([eE][-+]?[0-9]+)?

ALIGNAS     alignas
ALIGNOF     alignof
ASM         asm
AUTO        auto
BOOL        bool
BREAK       break
CASE        case
CATCH       catch
CHAR        char
CHAR8_T     char8_t    
CHAR16_T    char16_t
CHAR32_T    char32_t
CLASS       class
CONST       const
CONSTEXPR   constexpr
CONST_CAST  const_cast
CONTINUE    continue
DECLTYPE    decltype
DEFAULT     default
DELETE      delete
DO          do
DOUBLE      double
DYNAMIC_CAST dynamic_cast
ENUM        enum
EXPLICIT    explicit
EXPORT      export   
EXTERN      extern
FALSE       false
FLOAT       float
FOR         for
FRIEND      friend
GOTO        goto
INLINE      inline
INT         int
LONG        long
MUTABLE     mutable
NAMESPACE   namespace
NEW         new
NOEXCEPT    noexcept
NULLPTR     nullptr
OPERATOR    operator
PRIVATE     private
PROTECTED   protected
PUBLIC      public
REGISTER    register  
REINTERPRET_CAST reinterpret_cast
REQUIRES    requires  
SHORT       short
SIGNED      signed
SIZEOF      sizeof
STATIC      static
STATIC_ASSERT static_assert
STATIC_CAST  static_cast
STRUCT      struct
SWITCH      switch
TEMPLATE    template
THIS        this
THREAD_LOCAL thread_local
THROW       throw
TRUE        true
TRY         try
TYPEDEF     typedef
TYPEID      typeid
TYPENAME    typename
UNION       union
UNSIGNED    unsigned
USING       using
VIRTUAL     virtual
VOID        void
VOLATILE    volatile



EQ      ==
NEQ     !=
LT      <
LE      <=
GT      >
GE      >=

ASSIGN           "="
PLUSASSIGN       "+="
MINUSASSIGN      "-="
MULTASSIGN       "*="
DIVASSIGN        "/="
MODASSIGN        "%="
ANDASSIGN        "&="
ORASSIGN         "|="
XORASSIGN        "^="
LSHIFTASSIGN     "<<="
RSHIFTASSIGN     ">>="
INCREMENT        "++"
DECREMENT        "--"
BITAND           "&"
BITOR            "|"
BITXOR           "^"
BITNOT           "~"
MODULO           "%"
LSHIFT           "<<"
RSHIFT           ">>"
LOGAND           "&&"
LOGOR            "||"
NOT              "!"





onelinecommentbegin "//"
onelinecommentelement "."
onelinecommentend "\n"
%x ONELINECOMMENT
commentbegin "/*"
commentelement .|\n
commentend "*/"
%x COMMENT


%%
{ALIGNOF} { 
    fprintf(yyout, "TOKEN: ALIGNOF, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    current_column += strlen(yytext);
    arr[arrnum].word="ALIGNOF";
    arr[arrnum].lexeme=yytext;
    arr[arrnum].column_number=current_column;
    arr[arrnum].line_number=lines;
    arrnum++;
}
{ASM}         {
    fprintf(yyout, "TOKEN: ASM, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    current_column += strlen(yytext);
    arr[arrnum].word="ASM";
    arr[arrnum].lexeme=yytext;
    arr[arrnum].column_number=current_column;
    arr[arrnum].line_number=lines;
    arrnum++;
}
{AUTO}        {
    fprintf(yyout, "TOKEN: AUTO, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    current_column += strlen(yytext);
    arr[arrnum].word="AUTO";
    arr[arrnum].lexeme=yytext;
    arr[arrnum].column_number=current_column;
    arr[arrnum].line_number=lines;
    arrnum++;
}

{BOOL}        {
    currentContext = DECLARATION;
    fprintf(yyout, "TOKEN: BOOL, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    arr[arrnum].word="BOOL";
    arr[arrnum].lexeme=yytext;
    arr[arrnum].column_number=current_column;
    arr[arrnum].line_number=lines;
    current_column += strlen(yytext);
    arrnum++;
}

{BREAK}       {
    fprintf(yyout, "TOKEN: BREAK, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    arr[arrnum].word="BREAK";
    arr[arrnum].lexeme=yytext;
    arr[arrnum].column_number=current_column;
    arr[arrnum].line_number=lines;
    current_column += strlen(yytext);
    arrnum++;
}

{CASE}        {
    fprintf(yyout, "TOKEN: CASE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    arr[arrnum].word="CASE";
    arr[arrnum].lexeme=yytext;
    arr[arrnum].column_number=current_column;
    arr[arrnum].line_number=lines;
    current_column += strlen(yytext);
    arrnum++;
}

{CATCH}       {
    fprintf(yyout, "TOKEN: CATCH, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    arr[arrnum].word="CATCH";
    arr[arrnum].lexeme=yytext;
    arr[arrnum].column_number=current_column;
    arr[arrnum].line_number=lines;
    current_column += strlen(yytext);
    arrnum++;
}

{CHAR}        {
    currentContext = DECLARATION;
    fprintf(yyout, "TOKEN: CHAR, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    arr[arrnum].word="CHAR";
    arr[arrnum].lexeme=yytext;
    arr[arrnum].column_number=current_column;
    arr[arrnum].line_number=lines;
    current_column += strlen(yytext);
    arrnum++;
}

{CHAR8_T}     {
    currentContext = DECLARATION;
    fprintf(yyout, "TOKEN: CHAR8_T, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    arr[arrnum].word="CHAR8_T";
    arr[arrnum].lexeme=yytext;
    arr[arrnum].column_number=current_column;
    arr[arrnum].line_number=lines;
    current_column += strlen(yytext);
    arrnum++;
}

{CHAR16_T}    {
    currentContext = DECLARATION;
    fprintf(yyout, "TOKEN: CHAR16_T, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    arr[arrnum].word="CHAR16_T";
    arr[arrnum].lexeme=yytext;
    arr[arrnum].column_number=current_column;
    arr[arrnum].line_number=lines;
    current_column += strlen(yytext);
    arrnum++;
}

{CHAR32_T}    {
    currentContext = DECLARATION;
    fprintf(yyout, "TOKEN: CHAR32_T, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    arr[arrnum].word="CHAR32_T";
    arr[arrnum].lexeme=yytext;
    arr[arrnum].column_number=current_column;
    arr[arrnum].line_number=lines;
    current_column += strlen(yytext);
    arrnum++;
}
{CLASS}       {
    fprintf(yyout, "TOKEN: CLASS, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    current_column += strlen(yytext);
    arr[arrnum].word = "CLASS";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
}

{CONST}       {
    fprintf(yyout, "TOKEN: CONST, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    current_column += strlen(yytext);
    arr[arrnum].word = "CONST";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
}

{CONSTEXPR}   {
    fprintf(yyout, "TOKEN: CONSTEXPR, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    current_column += strlen(yytext);
    arr[arrnum].word = "CONSTEXPR";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
}

{CONST_CAST}  {
    fprintf(yyout, "TOKEN: CONST_CAST, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    current_column += strlen(yytext);
    arr[arrnum].word = "CONST_CAST";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
}

{CONTINUE}    {
    fprintf(yyout, "TOKEN: CONTINUE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    current_column += strlen(yytext);
    arr[arrnum].word = "CONTINUE";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
}

{DECLTYPE}    {
    fprintf(yyout, "TOKEN: DECLTYPE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    current_column += strlen(yytext);
    arr[arrnum].word = "DECLTYPE";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
}

{DEFAULT}     {
    fprintf(yyout, "TOKEN: DEFAULT, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 

    arr[arrnum].word = "DEFAULT";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
        current_column += strlen(yytext);
}

{DELETE}      {
    fprintf(yyout, "TOKEN: DELETE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 

    arr[arrnum].word = "DELETE";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
        current_column += strlen(yytext);
}

{DO}          {
    fprintf(yyout, "TOKEN: DO, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    
    arr[arrnum].word = "DO";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
    current_column += strlen(yytext);
}

{DOUBLE}      {
    currentContext = DECLARATION;
    fprintf(yyout, "TOKEN: DOUBLE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 
    
    arr[arrnum].word = "DOUBLE";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
    current_column += strlen(yytext);
}

{DYNAMIC_CAST} {
    fprintf(yyout, "TOKEN: DYNAMIC_CAST, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); 

    arr[arrnum].word = "DYNAMIC_CAST";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
        current_column += strlen(yytext);
}




{ELSE}        {fprintf(yyout, "TOKEN: ELSE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{ENUM}        {fprintf(yyout, "TOKEN: ENUM, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{EXPLICIT}    {fprintf(yyout, "TOKEN: EXPLICIT, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{EXPORT}      {fprintf(yyout, "TOKEN: EXPORT, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{EXTERN}      {fprintf(yyout, "TOKEN: EXTERN, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{FALSE}       {fprintf(yyout, "TOKEN: FALSE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{FLOAT}       {currentContext = DECLARATION;fprintf(yyout, "TOKEN: FLOAT, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{FOR}         {fprintf(yyout, "TOKEN: FOR, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{FRIEND}      {fprintf(yyout, "TOKEN: FRIEND, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{GOTO}        {fprintf(yyout, "TOKEN: GOTO, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{IF}          {
    
    arr[arrnum].word = "IF";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
    fprintf(yyout, "TOKEN: IF, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);
    current_column += strlen(yytext);
    }
{INLINE}      {fprintf(yyout, "TOKEN: INLINE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{INT}         {
   
    arr[arrnum].word = "INT";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
    currentContext = DECLARATION;fprintf(yyout, "TOKEN: INT, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);
    current_column += strlen(yytext);
    }
{LONG}        {currentContext = DECLARATION;fprintf(yyout, "TOKEN: LONG, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{MUTABLE}     {fprintf(yyout, "TOKEN: MUTABLE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{NAMESPACE}   {fprintf(yyout, "TOKEN: NAMESPACE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{NEW}         {fprintf(yyout, "TOKEN: NEW, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{NOEXCEPT}    {fprintf(yyout, "TOKEN: NOEXCEPT, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{NULLPTR}     {fprintf(yyout, "TOKEN: NULLPTR, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{OPERATOR}    {fprintf(yyout, "TOKEN: OPERATOR, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{PRIVATE}     {fprintf(yyout, "TOKEN: PRIVATE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{PROTECTED}   {fprintf(yyout, "TOKEN: PROTECTED, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{PUBLIC}      {fprintf(yyout, "TOKEN: PUBLIC, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{REGISTER}    {fprintf(yyout, "TOKEN: REGISTER, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{REINTERPRET_CAST} {fprintf(yyout, "TOKEN: REINTERPRET_CAST, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{REQUIRES}    {fprintf(yyout, "TOKEN: REQUIRES, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{RETURN}      {
    arr[arrnum].word = "RETURN";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
    fprintf(yyout, "TOKEN: RETURN, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{SHORT}       {currentContext = DECLARATION;fprintf(yyout, "TOKEN: SHORT, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{SIGNED}      {fprintf(yyout, "TOKEN: SIGNED, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{SIZEOF}      {fprintf(yyout, "TOKEN: SIZEOF, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{STATIC}      {fprintf(yyout, "TOKEN: STATIC, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{STATIC_ASSERT} {fprintf(yyout, "TOKEN: STATIC_ASSERT, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{STATIC_CAST} {fprintf(yyout, "TOKEN: STATIC_CAST, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{STRUCT}      {fprintf(yyout, "TOKEN: STRUCT, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{SWITCH}      {fprintf(yyout, "TOKEN: SWITCH, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{TEMPLATE}    {fprintf(yyout, "TOKEN: TEMPLATE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{THIS}        {fprintf(yyout, "TOKEN: THIS, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{THREAD_LOCAL} {fprintf(yyout, "TOKEN: THREAD_LOCAL, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{THROW}       {fprintf(yyout, "TOKEN: THROW, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{TRUE}        {fprintf(yyout, "TOKEN: TRUE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{TRY}         {fprintf(yyout, "TOKEN: TRY, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{TYPEDEF}     {fprintf(yyout, "TOKEN: TYPEDEF, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{TYPEID}      {fprintf(yyout, "TOKEN: TYPEID, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{TYPENAME}    {fprintf(yyout, "TOKEN: TYPENAME, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{UNION}       {fprintf(yyout, "TOKEN: UNION, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{UNSIGNED}    {fprintf(yyout, "TOKEN: UNSIGNED, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{USING}       {fprintf(yyout, "TOKEN: USING, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{VIRTUAL}     {fprintf(yyout, "TOKEN: VIRTUAL, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{VOID}        {fprintf(yyout, "TOKEN: VOID, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{VOLATILE}    {fprintf(yyout, "TOKEN: VOLATILE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}
{WHILE}       {fprintf(yyout, "TOKEN: WHILE, LEXEME: %s, ATTRIBUTE: Keyword\n", yytext); current_column += strlen(yytext);}



{ASSIGN}          { fprintf(yyout, "TOKEN: ASSIGN, LEXEME: %s, ATTRIBUTE: Assignment Operator\n", yytext); current_column += strlen(yytext); }
{PLUSASSIGN}      { fprintf(yyout, "TOKEN: PLUSASSIGN, LEXEME: %s, ATTRIBUTE: Plus Assignment Operator\n", yytext); current_column += strlen(yytext); }
{MINUSASSIGN}     { fprintf(yyout, "TOKEN: MINUSASSIGN, LEXEME: %s, ATTRIBUTE: Minus Assignment Operator\n", yytext); current_column += strlen(yytext); }
{MULTASSIGN}      { fprintf(yyout, "TOKEN: MULTASSIGN, LEXEME: %s, ATTRIBUTE: Multiplication Assignment Operator\n", yytext); current_column += strlen(yytext); }
{DIVASSIGN}       { fprintf(yyout, "TOKEN: DIVASSIGN, LEXEME: %s, ATTRIBUTE: Division Assignment Operator\n", yytext); current_column += strlen(yytext); }
{MODASSIGN}       { fprintf(yyout, "TOKEN: MODASSIGN, LEXEME: %s, ATTRIBUTE: Modulo Assignment Operator\n", yytext); current_column += strlen(yytext); }
{ANDASSIGN}       { fprintf(yyout, "TOKEN: ANDASSIGN, LEXEME: %s, ATTRIBUTE: And Assignment Operator\n", yytext); current_column += strlen(yytext); }
{ORASSIGN}        { fprintf(yyout, "TOKEN: ORASSIGN, LEXEME: %s, ATTRIBUTE: Or Assignment Operator\n", yytext); current_column += strlen(yytext); }
{XORASSIGN}       { fprintf(yyout, "TOKEN: XORASSIGN, LEXEME: %s, ATTRIBUTE: Xor Assignment Operator\n", yytext); current_column += strlen(yytext); }
{LSHIFTASSIGN}    { fprintf(yyout, "TOKEN: LSHIFTASSIGN, LEXEME: %s, ATTRIBUTE: Left Shift Assignment Operator\n", yytext); current_column += strlen(yytext); }
{RSHIFTASSIGN}    { fprintf(yyout, "TOKEN: RSHIFTASSIGN, LEXEME: %s, ATTRIBUTE: Right Shift Assignment Operator\n", yytext); current_column += strlen(yytext); }
{INCREMENT}       { fprintf(yyout, "TOKEN: INCREMENT, LEXEME: %s, ATTRIBUTE: Increment Operator\n", yytext); current_column += strlen(yytext); }
{DECREMENT}       { fprintf(yyout, "TOKEN: DECREMENT, LEXEME: %s, ATTRIBUTE: Decrement Operator\n", yytext); current_column += strlen(yytext); }
{BITAND}          { fprintf(yyout, "TOKEN: BITAND, LEXEME: %s, ATTRIBUTE: Bitwise And Operator\n", yytext); current_column += strlen(yytext); }
{BITOR}           { fprintf(yyout, "TOKEN: BITOR, LEXEME: %s, ATTRIBUTE: Bitwise Or Operator\n", yytext); current_column += strlen(yytext); }
{BITXOR}          { fprintf(yyout, "TOKEN: BITXOR, LEXEME: %s, ATTRIBUTE: Bitwise Xor Operator\n", yytext); current_column += strlen(yytext); }
{BITNOT}          { fprintf(yyout, "TOKEN: BITNOT, LEXEME: %s, ATTRIBUTE: Bitwise Not Operator\n", yytext); current_column += strlen(yytext); }
{MODULO}          { fprintf(yyout, "TOKEN: MODULO, LEXEME: %s, ATTRIBUTE: Modulo Operator\n", yytext); current_column += strlen(yytext); }
{LSHIFT}          { fprintf(yyout, "TOKEN: LSHIFT, LEXEME: %s, ATTRIBUTE: Left Shift Operator\n", yytext); current_column += strlen(yytext); }
{RSHIFT}          { fprintf(yyout, "TOKEN: RSHIFT, LEXEME: %s, ATTRIBUTE: Right Shift Operator\n", yytext); current_column += strlen(yytext); }
{LOGAND}          { fprintf(yyout, "TOKEN: LOGAND, LEXEME: %s, ATTRIBUTE: Logical And Operator\n", yytext); current_column += strlen(yytext); }
{LOGOR}           { fprintf(yyout, "TOKEN: LOGOR, LEXEME: %s, ATTRIBUTE: Logical Or Operator\n", yytext); current_column += strlen(yytext); }
{NOT}             { fprintf(yyout, "TOKEN: NOT, LEXEME: %s, ATTRIBUTE: Not Operator\n", yytext); current_column += strlen(yytext); }


{EQ}    { fprintf(yyout, "TOKEN: EQ, LEXEME: %s, ATTRIBUTE: Equality Operator\n", yytext); current_column += strlen(yytext);}
{NEQ}   { fprintf(yyout, "TOKEN: NEQ, LEXEME: %s, ATTRIBUTE: Not Equal Operator\n", yytext);current_column += strlen(yytext); }
{LT}    { 
    arr[arrnum].word = "LT";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
    fprintf(yyout, "TOKEN: LT, LEXEME: %s, ATTRIBUTE: Less Than Operator\n", yytext);current_column += strlen(yytext); }
{LE}    { fprintf(yyout, "TOKEN: LE, LEXEME: %s, ATTRIBUTE: Less Than or Equal Operator\n", yytext);current_column += strlen(yytext); }
{GT}    { fprintf(yyout, "TOKEN: GT, LEXEME: %s, ATTRIBUTE: Greater Than Operator\n", yytext);current_column += strlen(yytext); }
{GE}    { fprintf(yyout, "TOKEN: GE, LEXEME: %s, ATTRIBUTE: Greater Than or Equal Operator\n", yytext); current_column += strlen(yytext);}

{DEC} {
    int value = strtol(yytext, NULL, 10);
    arr[arrnum].word = "DEC";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arr[arrnum].attribute=value;
    arrnum++;
    fprintf(yyout, "TOKEN: INT_CONST, LEXEME: %s, ATTRIBUTE: %d\n", yytext, value);
    words++;
    chars += strlen(yytext);
    current_column += strlen(yytext);
}

{OCT} {
    int value = strtol(yytext, NULL, 8);
    fprintf(yyout, "TOKEN: OCT_CONST, LEXEME: %s, ATTRIBUTE: %d\n", yytext, value);
    words++;
    chars += strlen(yytext);
    current_column += strlen(yytext);
}

{HEX} {
    int value = strtol(yytext, NULL, 16);
    fprintf(yyout, "TOKEN: HEX_CONST, LEXEME: %s, ATTRIBUTE: %d\n", yytext, value);
    words++;
    chars += strlen(yytext);
    current_column += strlen(yytext);
}

{FLO} {
    float value = atof(yytext);
    fprintf(yyout, "TOKEN: FLOAT_CONST, LEXEME: %s, ATTRIBUTE: %f\n", yytext, value);
    words++;
    chars += strlen(yytext);
    current_column += strlen(yytext);
}


{ID}    {

    if(symbolTableStack.empty()){
        SymbolTable newTable;
        symbolTableStack.push(newTable);
    }
    
    SymbolTableEntry* entry = nullptr;
    if (!symbolTableStack.empty()) {
        entry = symbolTableStack.top().lookup(yytext);  // 查找当前符号表中的词素
    }
    std::string * ptr;
    int flag = 0;
    for(int i=0;i<idnum;i++){
        if(idtable[i]==yytext){
            ptr=&(idtable[i]);
            flag = 1;
        }
    }
    if(flag == 0){
        idtable[idnum] = yytext;
        idnum++;
        ptr = &(idtable[idnum-1]);
    }
    SymbolTableEntry newEntry;
    if (!entry) {
        // 如果词素不存在，创建新的符号表项并插入

        newEntry.word = yytext;           // 单词也被设置为yytext
        newEntry.lexeme = yytext;
        newEntry.line_number = yylineno;  // 使用yylineno来获取当前的行号
        newEntry.column_number = current_column;
        newEntry.ptr=ptr;
        entry = &newEntry;
      //  fprintf(yyout,"newonecreated\n");
        if (!symbolTableStack.empty()) {
            symbolTableStack.top().insert(yytext, newEntry);
        }
    }
    arr[arrnum].word="ID";
    arr[arrnum].lexeme=yytext;
    arr[arrnum].column_number=current_column;
    arr[arrnum].line_number=lines;
    arr[arrnum].attribute=ptr;
    arrnum++;
    fprintf(yyout, "TOKEN: ID, LEXEME: %s, column_number:%d,ATTRIBUTE: %p \n", yytext,current_column,ptr);
    words++;
    current_column += strlen(yytext);
    chars += strlen(yytext);
}


{onelinecommentbegin}.*\n { BEGIN(INITIAL); }


{commentbegin} {BEGIN COMMENT;}
<COMMENT>{commentelement} {}
<COMMENT>{commentend} {BEGIN INITIAL;}


"{"     {
    SymbolTable newTable;
    symbolTableStack.push(newTable);
    fprintf(yyout, "TOKEN: LBRACE, LEXEME: %s, ATTRIBUTE: Left Brace\n", yytext);
    current_column += strlen(yytext);
}

"}"     {
    if (!symbolTableStack.empty()) {
        symbolTableStack.pop();
    }
    fprintf(yyout, "TOKEN: RBRACE, LEXEME: %s, ATTRIBUTE: Right Brace\n", yytext);
    current_column += strlen(yytext);
}
";"     { 
    arr[arrnum].word = "SEMICOLON";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
    currentContext = NONE;fprintf(yyout, "TOKEN: SEMICOLON, LEXEME: %s, ATTRIBUTE: Semicolon\n", yytext);
    current_column += strlen(yytext); }
"("     {
    arr[arrnum].word = "LPAREN";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
    currentContext = NONE; fprintf(yyout, "TOKEN: LPAREN, LEXEME: %s, ATTRIBUTE: Left Parenthesis\n", yytext); 
    current_column += strlen(yytext);}
")"     { 
    arr[arrnum].word = "RPAREN";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
    fprintf(yyout, "TOKEN: RPAREN, LEXEME: %s, ATTRIBUTE: Right Parenthesis\n", yytext); 
    current_column += strlen(yytext);}
"+"     { 
    arr[arrnum].word = "PLUS";
    arr[arrnum].lexeme = yytext;
    arr[arrnum].column_number = current_column;
    arr[arrnum].line_number = lines;
    arrnum++;
    fprintf(yyout, "TOKEN: PLUS, LEXEME: %s, ATTRIBUTE: Addition Operator\n", yytext); 
    current_column += strlen(yytext);}
"-"     { fprintf(yyout, "TOKEN: MINUS, LEXEME: %s, ATTRIBUTE: Subtraction Operator\n", yytext); current_column += strlen(yytext);}
"*"     { fprintf(yyout, "TOKEN: MULT, LEXEME: %s, ATTRIBUTE: Multiplication Operator\n", yytext);current_column += strlen(yytext); }
"/"     { fprintf(yyout, "TOKEN: DIV, LEXEME: %s, ATTRIBUTE: Division Operator\n", yytext);current_column += strlen(yytext); }

\n      { lines++; current_column = 0; }  // 在这里重置列计数器
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
    fprintf(yyout, "------------------\n");
    fprintf(yyout, "Symbol Table:\n");
    fprintf(yyout, "------------------\n");

    while (!symbolTableStack.empty()) {
        const auto& currentTable = symbolTableStack.top(); // 获取栈顶的符号表
        // 用一个函数输出当前符号表的内容
        // 为了实现这个函数，你可能需要提供对符号表内部数据结构的访问（例如通过友元或公共方法）
        printSymbolTable(currentTable, yyout);

        symbolTableStack.pop(); // 弹出栈顶的符号表
    }

    fprintf(yyout, "------------------\n");
    fprintf(yyout, "Stats:\n");
    fprintf(yyout, "%8d%8d%8d\n", lines, words, chars);
    for(int i=0;i<arrnum;i++){
            fprintf(yyout,"id%d:%s %s %d %d %p\n",i,arr[i].word.c_str(),arr[i].lexeme.c_str(),arr[i].column_number,arr[i].line_number,arr[i].attribute);
    }

    return 0;
}