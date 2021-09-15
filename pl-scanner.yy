%{ 
//name, ID; 

#include "tokens.h"
# undef yywrap
# define yywrap() 1



#undef YY_DECL
#define YY_DECL int yylex()
YY_DECL;


// Code run each time a pattern is matched.
#undef  YY_USER_ACTION  
# define YY_USER_ACTION  {}



%}

%option yylineno
%option noyywrap 

DIGIT [0-9] 
ALPHA [a-zA-Z]

%%

\/\/.*$   
[ \t]+						
[\n]+							

";"  {return ';';}

"="  {return OP_ASSIGN;}
"+" {return OP_ADD;}
"-" {return OP_SUB;}
"*" {return OP_MUL;}
"/" {return OP_DIV;}
"<" {return OP_LT;}
">" {return OP_GT;}
"<=" {return OP_LEQ;}
">=" {return OP_GEQ;}
"==" {return OP_EQ;}
"~=" {return OP_DIFF;}
"++" {return OP_PLUSPLUS;}
"+=" {return OP_ADDINC;}


"MAIN" {return K_MAIN;}

{DIGIT}+ {return L_INTEGER;}

"[@][a-z][a-z0-9_]" {return T_ID;}

<<EOF>>	{ return T_EOF ; }

.	{ printf("Unexpected character\n"); exit (1); }

%%
