variable [A-Za-z_]+[A-Za-z_0-9]*
Assignment {variable}[ ]*"<<"[ ]*({variable}|[0-9]+|[0-9]+[.][0-9]+|['].[']|["].*["])
Condition (=|!|<|>)"("({variable}|([0-9]+[.]*[0-9]*)),({variable}|([0-9]+[.]*[0-9]*))")"
post ("+"|-)"("({variable}|([0-9]+[.]*[0-9]*)),("+"|-)")"
pre ("+"|-)"("("+"|-),({variable}|([0-9]+[.]*[0-9]*))")"
%%
"dep"[ ]+[A-Za-z0-9_.]+"\n" {printf("Dependency\n");}
"var"[ ]+{variable}[:]"inum"[ ]*"<<"[ ]*[0-9]+"\n" {printf("Integer\n");}
"var"[ ]+{variable}[:]"lnum"[ ]*"<<"[ ]*[0-9]+"\n" {printf("Long\n");}
"var"[ ]+{variable}[:]"fnum"[ ]*"<<"[ ]*[0-9]+[.][0-9]+"\n" {printf("Float\n");}
"var"[ ]+{variable}[:]"dnum"[ ]*"<<"[ ]*[0-9]+[.][0-9]+"\n" {printf("Double\n");}
"var"[ ]+{variable}[:]"boolean"[ ]*"<<"[ ]*(true|false)"\n" {printf("Boolean\n");}
"var"[ ]+{variable}[:]"character"[ ]*"<<"[ ]*['].[']"\n" {printf("Character\n");}
"var"[ ]+{variable}[:]"charry"[ ]*"<<"[ ]*["].*["]"\n" {printf("String\n");}
"lock ""var"[ ]+{variable}[:]"inum"[ ]*"<<"[ ]*[0-9]+"\n" {printf("Static Integer\n");}
"lock ""var"[ ]+{variable}[:]"lnum"[ ]*"<<"[ ]*[0-9]+"\n" {printf("Static Long\n");}
"lock ""var"[ ]+{variable}[:]"fnum"[ ]*"<<"[ ]*[0-9]+[.][0-9]+"\n" {printf("Static Float\n");}
"lock ""var"[ ]+{variable}[:]"dnum"[ ]*"<<"[ ]*[0-9]+[.][0-9]+"\n" {printf("Static Double\n");}
"lock ""var"[ ]+{variable}[:]"boolean"[ ]*"<<"[ ]*(true|false)"\n" {printf("Static Boolean\n");}
"lock ""var"[ ]+{variable}[:]"character"[ ]*"<<"[ ]*['].[']"\n" {printf("Static Character\n");}
"lock ""var"[ ]+{variable}[:]"charry"[ ]*"<<"[ ]*["].*["]"\n" {printf("Static String\n");}
"input("{variable}")" {printf("Input\n");}
"output("{variable}")" {printf("Output\n");}
{variable}[ ]*"<<"[ ]*"+("({variable}|([0-9]+[.]*[0-9]*)),({variable}|([0-9]+[.]*[0-9]*))")""\n" {printf("Summation\n");}
{variable}[ ]*"<<"[ ]*"-("({variable}|([0-9]+[.]*[0-9]*)),({variable}|([0-9]+[.]*[0-9]*))")""\n" {printf("Subtraction\n");}
{variable}[ ]*"<<"[ ]*"*("({variable}|([0-9]+[.]*[0-9]*)),({variable}|([0-9]+[.]*[0-9]*))")""\n" {printf("Multiplication\n");}
{variable}[ ]*"<<"[ ]*"/("({variable}|([0-9]+[.]*[0-9]*)),({variable}|([0-9]+[.]*[0-9]*))")""\n" {printf("Division\n");}
{variable}[ ]*"<<"[ ]*"%("({variable}|([0-9]+[.]*[0-9]*)),({variable}|([0-9]+[.]*[0-9]*))")""\n" {printf("Modulus\n");}
"=("({variable}|([0-9]+[.]*[0-9]*)),({variable}|([0-9]+[.]*[0-9]*))")""\n" {printf("Equal\n");}
"!("({variable}|([0-9]+[.]*[0-9]*)),({variable}|([0-9]+[.]*[0-9]*))")""\n" {printf("Not Equal\n");}
"<("({variable}|([0-9]+[.]*[0-9]*)),({variable}|([0-9]+[.]*[0-9]*))")""\n" {printf("Smaller Then\n");}
">("({variable}|([0-9]+[.]*[0-9]*)),({variable}|([0-9]+[.]*[0-9]*))")""\n" {printf("Greater Then\n");}
"+("({variable}|([0-9]+[.]*[0-9]*)),"+)""\n" {printf("Post Increment\n");}
"+(+",({variable}|([0-9]+[.]*[0-9]*))")""\n" {printf("Pre Increment\n");}
"-("({variable}|([0-9]+[.]*[0-9]*)),"-)""\n" {printf("Post Decrement\n");}
"-(-",({variable}|([0-9]+[.]*[0-9]*))")""\n" {printf("Pre Decrement\n");}
{variable}[ ]*"<<"[ ]*({variable}|[0-9]+|[0-9]+[.][0-9]+|['].[']|["].*["])"\n" {printf("Assignment\n");}
"floop""["[ ]*{Assignment}[ ]*,[ ]*{Condition}[ ]*,[ ]*({post}|{pre})[ ]*"]"[ ]*[\n]*"{"[ ]*[\n]*.*[ ]*[\n]*"}""\n" {printf("For Loop\n");}
"wloop""["[ ]*{Condition}[ ]*"]"[ ]*[\n]*"{"[ ]*[\n]*.*[ ]*[\n]*"}""\n"  {printf("While Loop\n");}
"do"[ ]*[\n]*"{"[ ]*[\n]*.*[ ]*[\n]*"}"[\n]""wloop""["[ ]*{Condition}[ ]*"]""\n" {printf("Do While Loop\n");}
("fi""["[ ]*{Condition}[ ]*"]"[ ]*[\n]*"{"[ ]*[\n]*.*[ ]*[\n]*"}""\n")("fie""["[ ]*{Condition}[ ]*"]"[ ]*[\n]*"{"[ ]*[\n]*.*[ ]*[\n]*"}""\n")*("fin"[ ]*[\n]*"{"[ ]*[\n]*.*[ ]*[\n]*"}""\n")* {printf("If Else\n");}
"sinit["[ ]*{Condition}[ ]*"]""\n" {printf("Switch\n");}
"opt[".*"]:" {printf("Switch Case\n");}
"dd:" {printf("Switch Default\n");}
[!?] {printf("Void\n");}
[!!] {printf("Null\n");}
"feedback" {printf("return\n");}
"stop" {printf("break\n");}
"keepgoing" {printf("continue\n");}
({variable}|inum|lnum|fnum|dnum|boolean|character|charry|"!?")" f-> "{variable}"("({variable},)*"):"[ ]*[\n]*"{"[ ]*[\n]*.*[ ]*[\n]*"}""\n")*"\n" {printf("Function\n");}
"structprint"[ ]*[\n]*"{"[ ]*[\n]*.*[ ]*[\n]*"}""\n" {printf("Struct\n");}
"blueprint"[ ]*[\n]*"{"[ ]*[\n]*.*[ ]*[\n]*"}""\n" {printf("Class\n");}
"All" {printf("Public\n");}
"None" {printf("Private\n");}
"Some" {printf("Protected\n");}
"@!".*"!@" {printf("Comment");}
.+ {printf("SYNTAX ERROR");}
%%
int yywrap(){
	return 1;
}

int main(){
	yyin = freopen("Input.txt","r",stdin);
	yyout = freopen("Output.txt","w",stdout);
	yylex();
	return 0;
}
