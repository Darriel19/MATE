%{
#include <stdio.h>
extern int yylex();
extern char *yytext;
void yyerror(char *);
%}

%token TKN_ENTERO
%token TKN_REAL
%token TKN_MAS
%token TKN_RES
%token TKN_POR
%token TKN_DIV
%token TKN_PAA
%token TKN_PAC
%token TKN_COA
%token TKN_COC
%token TKN_LLA
%token TKN_LLC

/*reglas de gramatica*/
%%

expresion: TKN_ENTERO|TKN_REAL {$$=$1;}
           |expresion TKN_MAS expresion {$$=$1+$3;}
	   |expresion TKN_RES expresion {$$=$1-$3;}
           |expresion TKN_POR expresion {$$=$1*$3;}
           |expresion TKN_DIV expresion {$$=$1%$3;}

	   |TKN_PAA expresion TKN_PAC {$$=$2;}
	   |TKN_COA expresion TKN_COC {$$=$2;}
	   |TKN_LLA expresion TKN_LLC {$$=$2;}
	   ;     	
%%
void yyerror(char*s)
{
printf("error %s", s);
}

/*codigo usuario*/
void main()
{
	extern FILE *yyin;

	yyin = fopen("entrada.txt", "r");
	yyparse();
}