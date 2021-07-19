%option noyywrap

%{
#include<stdlib.h>
#include<stdio.h>
#include "sintaxis.tab.h"

%}
digito [0-9]
entero {digito}+
real {entero}\.{digito}+
%%
{entero} {yylval= atoi(yytext); return (TKN_ENTERO);}
{real} {yylval= atoi(yytext); return (TKN_REAL);}
"+" { return (TKN_MAS); }
"-" { return (TKN_RES); }
"*" { return (TKN_POR); }
"/" { return (TKN_DIV); }
"(" { return (TKN_PAA); }
")" { return (TKN_PAC); }
"[" { return (TKN_COA); }
"]" { return (TKN_COC); }
"{" { return (TKN_LLA); }
"}" { return (TKN_LLC); }

"\n"
"\t"
" "
. { printf("error lexico\n"); }
%%