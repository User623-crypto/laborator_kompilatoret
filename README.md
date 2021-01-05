# laborator_kompilatoret

#Rregullat bazë të jflex

/*User code   --> Packages to import java.util.* */
%%

/*Options and declerations --> Put the java code and macro definitions */
/**Macro definitions
int yychar -> the number of characters processed since the start of the input
int yyline -> the number of line breaks proccessed since the start
int yycolumn -> number of char processed since the start of the current line
String yytext() -> returns the text matched by the current regex
int yylength() -> length of the string extracted
int yystate() -> returns the current state
void  yybegin (int lexicalState) -> sets the current state
*/
/**Directives
%class <classname> -> public class name
%implements <interface> 
%extends <classname> 
%public -> makes the class public
%standalone -> creates a main function i the generated class that expects the name of an input on the command line and than runs the scanner on this input file
%char -> activate yychar tells the program you will use this keyword
%column -> activate yycolumn
%line -> activate yyline

Formati i kodit:
%{
    <Code>
%}
Ndersa
%init{
    <Code> //inicializon variablat me nje vlere Si pune konstruktori
%init
*/

/*Macro definition***
attach names to regular expression for clarity
form: macroidentifier = regex
example: Whitespace = [\t\n]+   -> we can use {Whitespace}
Letter = [a-zA-Z]
*/
%%

/*Lexical Rules --> Rules and actions associated witht them*/

/**Kompilimi
 jflex test.jflex  -> gjeneron supozojm test.java
 javac classname.java -> gjeneron sup test.class
 java class input.txt -> pra java test input.txt
**/
