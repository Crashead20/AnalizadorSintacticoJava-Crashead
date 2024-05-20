package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,]+
%{
    public String lexeme;
%}
%%
int {lexeme=yytext(); return Int;}
if {lexeme=yytext(); return If;}
else {lexeme=yytext(); return Else;}
while {lexeme=yytext(); return While;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"\n" {lexeme=yytext(); return Linea;}
"=" {lexeme=yytext(); return Igual;}
"+" {lexeme=yytext(); return Suma;}
"-" {lexeme=yytext(); return Resta;}
"*" {lexeme=yytext(); return Multiplicacion;}
"/" {lexeme=yytext(); return Division;}
"(" {lexeme=yytext(); return Parentesis_a;}
")" {lexeme=yytext(); return Parentesis_c;}
"{" {lexeme=yytext(); return Llave_a;}
"}" {lexeme=yytext(); return Llave_c;}
"main" {lexeme=yytext(); return Main;}
";" {lexeme=yytext(); return P_coma;}
"\"" {lexeme=yytext(); return ComillaDoble;}
"." {lexeme=yytext(); return Punto;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}

