%%
%class lab1
%standalone
%line
%column

digit = [0-9]  //numrat nga 0 në 9
letter = [^\/\\\.\*\>\<\?\"\,\:\'\|{digit}\n] //të gjithë karakteret e alfabetit dhe karakteret speciale me përjashtim të '/', '\', ':', '*', '?', ' “ ','>', '<', ' | '.
id =({letter})([{letter} | {digit} ])*
FileType = {id}
FileName = {id}
PathName = {id}
Drive = {letter}
PathFileName = ({Drive}:)?(\\)?({PathName}\\)*{FileName}(\.{FileType})?

%%
{PathFileName} {
    System.out.printf("\n *** found match %s \n",yytext());
}

\n { /**/}
. {/**Cdo simbol tjeter nuk be asgje*/}