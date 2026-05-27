import java_cup.runtime.*;

%%

%class scanner
%unicode
%cup

WHITESPACE  = [ \t\n\r]+
DIGIT       = [0-9]+
LETTER      = [A-Za-z]
ID          = {LETTER} ({LETTER}|[0-9]|_)*
FLOAT       = {DIGIT} "." {DIGIT}+
STRING      = \" [^\"]* \"
COMMENT_LINE  = "//" [^\n]*
COMMENT_BLOCK = "/*" [^*]* "*"+ ([^/*] [^*]* "*"+)* "/"

%%

<YYINITIAL> {
    {WHITESPACE}    { /* ignora */ }
    {COMMENT_LINE}  { /* ignora comentario de linha */ }
    {COMMENT_BLOCK} { /* ignora comentario de bloco */ }

    // Palavras-chave
    "int"           { return new Symbol(sym.KW_INT); }
    "float"         { return new Symbol(sym.KW_FLOAT); }
    "string"        { return new Symbol(sym.KW_STRING); }
    "void"          { return new Symbol(sym.KW_VOID); }
    "if"            { return new Symbol(sym.KW_IF); }
    "else"          { return new Symbol(sym.KW_ELSE); }
    "while"         { return new Symbol(sym.KW_WHILE); }
    "return"        { return new Symbol(sym.KW_RETURN); }
    "print"         { return new Symbol(sym.KW_PRINT); }

    // Literais
    {FLOAT}         { return new Symbol(sym.FLOAT_LIT, Double.parseDouble(yytext())); }
    {DIGIT}         { return new Symbol(sym.INT_LIT,   Integer.parseInt(yytext())); }
    {STRING}        { return new Symbol(sym.STR_LIT,   yytext()); }
    {ID}            { return new Symbol(sym.ID,         yytext()); }

    // Operadores aritméticos
    "+"             { return new Symbol(sym.PLUS); }
    "-"             { return new Symbol(sym.MINUS); }
    "*"             { return new Symbol(sym.TIMES); }
    "/"             { return new Symbol(sym.DIV); }

    // Operadores relacionais
    "=="            { return new Symbol(sym.EQ); }
    "!="            { return new Symbol(sym.NEQ); }
    "<="            { return new Symbol(sym.LE); }
    ">="            { return new Symbol(sym.GE); }
    "<"             { return new Symbol(sym.LT); }
    ">"             { return new Symbol(sym.GT); }

    // Atribuição
    "="             { return new Symbol(sym.ASSIGN); }

    // Delimitadores
    ";"             { return new Symbol(sym.SEMI); }
    ","             { return new Symbol(sym.COMMA); }
    "("             { return new Symbol(sym.LPAREN); }
    ")"             { return new Symbol(sym.RPAREN); }
    "{"             { return new Symbol(sym.LBRACE); }
    "}"             { return new Symbol(sym.RBRACE); }

    .               { System.err.println("Caractere invalido: " + yytext()); }
}
