%{ 

#include "tokens.h"
# undef yywrap
# define yywrap() 1



#undef YY_DECL
#define YY_DECL int yylex()
YY_DECL;


// Code to run each time a pattern is matched.
#undef  YY_USER_ACTION  
# define YY_USER_ACTION  {}

//a                   { return T_A;}
//b                 { return T_B;}


%}

%option yylineno
%option noyywrap 

DIGIT [0-9] 
ALPHA [a-zA-Z]

%%


\/\/.*$           { printf ("comment ignored"); }
[ \t]+						{ printf ("WS or tab\n"); }
[\n]+							
a+b+(ab|ba)     { return T_APBP_AB;}
(aa|bb)+            { return T_AABBP;}
(ab)+            { return T_ABP;}
a(a|b)+            { return T_A_ABP;}

<<EOF>>						{ return T_EOF ; }
.									{ printf ("Unexpected character\n"); exit (1); }





%%


