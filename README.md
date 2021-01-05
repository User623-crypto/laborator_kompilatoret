# laborator_kompilatoret

#Rregullat bazë të jflex

Inicializon librarite <br/>
/*User code   --> Packages to import java.util.* */ <br/>
%% <br/>

Incializon  perkufizimet regular expressio etj<br/>
/*Options and declerations --> Put the java code and macro definitions */<br/>
/**Macro definitions<br/>
int yychar -> the number of characters processed since the start of the input<br/>
int yyline -> the number of line breaks proccessed since the start<br/>
int yycolumn -> number of char processed since the start of the current line<br/>
String yytext() -> returns the text matched by the current regex<br/>
int yylength() -> length of the string extracted<br/>
int yystate() -> returns the current state<br/>
void  yybegin (int lexicalState) -> sets the current state<br/>
*/<br/>
/**Directives<br/>
%class <classname> -> public class name<br/>
%implements <interface> <br/>
%extends <classname> <br/>
%public -> makes the class public<br/>
%standalone -> creates a main function i the generated class that expects the name of an input on the command line and than runs the scanner on this input file<br/>
%char -> activate yychar tells the program you will use this keyword<br/>
%column -> activate yycolumn<br/>
%line -> activate yyline<br/>
<br/>
Formati i kodit:<br/>
%{<br/>
    Code<br/>
%}<br/>
Ndersa<br/>
%init{<br/>
    Code //inicializon variablat me nje vlere Si pune konstruktori<br/>
%init<br/>
*/<br/>
<br/>
/*Macro definition***<br/>
attach names to regular expression for clarity<br/>
form: macroidentifier = regex<br/>
example: Whitespace = [\t\n]+   -> we can use {Whitespace}<br/>
Letter = [a-zA-Z]<br/>
*/<br/>
%%<br/>
## Skanimi leksik Regex pastaj Action {[0-9]} {System.out.println("Dgit")}<br/>
/*Lexical Rules --> Rules and actions associated witht them*/<br/>
<br/>
/**Kompilimi<br/>
 jflex test.jflex  -> gjeneron supozojm test.java<br/>
 javac classname.java -> gjeneron sup test.class<br/>
 java class input.txt -> pra java test input.txt<br/>
**/<br/>
<br/>
