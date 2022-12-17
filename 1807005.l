%{

#include<stdio.h>
#include<string.h>
#include<math.h>
#include "1807005.tab.h"
    void yyerror(char *);
%}

%%
"var"[ ]*                         {return INIT;}
[+-]?[0-9]+                         {yylval.variable.ival = atoi(yytext);
                                     return INT;}

[+-]?[0-9]*[.][0-9]+                {yylval.variable.fval = atof(yytext);
                                     return FLOAT;}

["].*["]                            {yytext++;int l=strlen(yytext);
                                    yylval.variable.st=yytext;
                                    yylval.variable.st[l-1]='\0';
                                    return STRING;}
"="                               {return *yytext;}
"+"                               {return *yytext;}
"-"                               {return *yytext;}
"*"                               {return *yytext;}
"/"                               {return *yytext;}
"%"                               {return *yytext;}
"("                               {return *yytext;}
")"                               {return *yytext;}
"{"                               {return *yytext;}
"}"                               {return *yytext;}
"["                               {return *yytext;}
"]"                               {return *yytext;}
","                               {return *yytext;}
":"                               {return *yytext;}
"!"                               {return *yytext;}
"++"                              {return INC;}
"--"                              {return DEC;}
">"                               {return *yytext;}
"<"                               {return *yytext;}
">="                              {return GEQ;}
"<="                              {return LEQ;}
"=="                              {return EQ;}
"!="                              {return NEQ;}
[f][-][>][a-zA-Z0-9]+             {return FUN;}
"@"                               {return *yytext;}
[#][a-z<>.h]+                     {return HEAD;}
[/]{2}.*                          {return CMT;}
[@][a-zA-Z0-9]+                   {yylval.variable.str = yytext;
                                    return AN;}
[ ;\t\n]                           {}
"stop"                            {return STOP;}
"keepgoing"                       {return GOING;}
"feedback"                        {return RET;}
"!?"                              {return VOID;}
"bf->FLOOR"                       {return FLOOR;}
"bf->CEIL"                        {return CEIL;}
"bf->ABS"                         {return ABS;}
"inum"                            {return INTT;}
"fnum"                            {return FL;}
"charry"                          {return STT;}
"bf->SIN"                         {return SINE;}
"bf->COS"                         {return COS;}
"bf->TAN"                         {return TAN;}
"bf->POW"                         {return POW;}
"bf->LN"                          {return LN;}
"bf->PRIME"                       {return PRIME;}
"outputi"                         {return OUTPUTI;}
"outputf"                         {return OUTPUTF;}
"outputs"                         {return OUTPUTS;}
"pfa"                             {return PFA;}
"inputi"                          {return INPUTI;}
"inputf"                          {return INPUTF;}
"endl"                            {return END;}
"bf->LEN"                         {return LEN;}
"bf->CMP"                         {return CMP;}
"bf->CAT"                         {return CAT;}
"bf->CPY"                         {return CPY;}
"bf->GCD"                         {return GCD;}
"bf->MIN"                         {return MIN;}
"bf->MAX"                         {return MAX;}
"fi"                              {return IF;}
"fie"                             {return ELIF;}
"fin"                             {return ELSE;}
"floop"                           {return FOR;}
"wloop"                           {return WHILE;}
"loop"                            {return LOOP;}
"sinit"                           {return SW;}
"opt"                             {return CA;}
"dd"                              {return DF;}
"do"                              {return DO;}
"LETSGO"                          {return MAIN;}
"@!".*"!@"                        {printf("This is a Comment\n");}
[a-zA-Z][a-zA-Z0-9]*              {yylval.variable.str = yytext;
                                    return ID;}
.                                 {printf("Unknown character.\n");}
%%
int yywrap(void) {
    return 1;
}
