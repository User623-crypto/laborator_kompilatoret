%%
%class lab1p2
%standalone
%line
%column

digit = [0-9]  //numrat nga 0 në 9
letter = [^\/\\\.\*\>\<\?\"\,\:\'\|{digit}\n] //të gjithë karakteret e alfabetit dhe karakteret speciale me përjashtim të '/', '\', ':', '*', '?', ' “ ','>', '<', ' | '.
id =({letter})([{letter} | {digit} ])*
protokoll = (http | https | ftp | nntp | gopher) //protokolli 
domain = ([A-Za-z0-9]{1,63}\.)+[A-Za-z]{2,6} // 10al.tos.com -> vlera e fundit duhet te jete 2-6 shkronja
ip = ({digit}{1,3}.){3}{digit}{1,3}
porta = :{digit}{1,4}
spiranca = #.{0,255}
vazhdimisiQuery = (&[a-zA-Z{digit}]{0,50}=[a-zA-Z{digit}]{0,50})*
query = \?([a-zA-Z{digit}]{0,50}=[a-zA-Z{digit}]{0,50}{vazhdimisiQuery}?)?
FileType = [a-zA-Z]{1,10} //Shtesa
FileName = {id}
PathName = {id}
GetReq = ((\/({PathName}\/)*{FileName})(\.{FileType})?)?
Numbers = [^a-zA-Z[0-9]/]+
Shtese = {Numbers}
%%
{protokoll}:\/\/({ip} | {domain}){porta}?{GetReq}{query}?{spiranca}? {
    System.out.printf("\n *** found match %s \n",yytext());
}

\n { /**/}
. {/**Cdo simbol tjeter nuk be asgje*/}