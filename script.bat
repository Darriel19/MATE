cd C:\Users\Z77P_D3\Desktop\compiladorMATE
bison -d sintaxis.y
flex mate.l
gcc lex.yy.c sintaxis.tab.c -o analizador
analizador.exe
cmd /k