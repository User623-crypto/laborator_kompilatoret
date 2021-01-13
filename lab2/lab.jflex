import java.util.*;
%%
%class lab
%standalone
%line
%column


NormalTag = (html | body | head | ul | li | a | table | tr | td | p | h1 | h2)
SelfClosingTag = (br)
SpecialTag = (hr | img)
limit = [^\>] //Mund te kete cfare te doje por jo mbyllje per startingTag
limitB = [^\\\>]  // mund te kete cfate to doje por jo mbyllje per closingTag
VNormalTag = <{NormalTag}{limit}*>
BNormalTag = <\/{NormalTag}>
VSelfClosing = <{SelfClosingTag}\/>
VSpecialTag = <{SpecialTag}{limit}*>

%{
    ArrayList<String> tags = new ArrayList<>();
    ArrayList<Integer> nr = new ArrayList<>();
    Stack<String> stack = new Stack<String>();
   
    public  void insertIntoMap(String valueToBeChecked,ArrayList<String>tags,ArrayList<Integer>nr)
    {
        boolean keyIsPresent = false;

        for (int i = 0; i < tags.size(); i++) {
            if (tags.get(i).equals(valueToBeChecked)) {
                keyIsPresent = true;
                int a = nr.get(i);
                nr.set(i,a+1);
                break;
            }
        }
        if (!keyIsPresent) {
            tags.add(valueToBeChecked);
            nr.add(1);
        }
    }
    public  boolean checkTags(String startTag,String endTag)
    {
        char[] start = startTag.toCharArray();
        char[] end = endTag.toCharArray();
        int k=0;
        for (int i = 0; i < endTag.length()-1; i++) {
            if(i==1) i++;

            if (start[k]!=end[i])
                return false;

            k++;
        }
        return  true;
    }
%}

%eof{


int sum = 0;
for(int i=0;i<tags.size();i++)
{
    sum += nr.get(i);
    System.out.println("Tag:"+tags.get(i)+" sasia:"+nr.get(i));
}
System.out.println("Total:"+sum);
%eof}

%%
{VNormalTag} {
    System.out.printf("\n *** found match %s \n",yytext());

    stack.push(yytext());
    
}

{VSelfClosing} {
    System.out.printf("\n *** found match %s \n",yytext());
    insertIntoMap(yytext(),tags,nr);
}
{VSpecialTag} { 
    System.out.printf("\n *** found match %s \n",yytext());
    String ata = yytext();
    if(ata.length()>=4)
        ata = "<img>";
    insertIntoMap(ata,tags,nr);
}

{BNormalTag} {
    System.out.printf("\n *** found match %s \n",yytext());
    String end = yytext();
    String start ="";
    while(!stack.isEmpty())
    {
         start = stack.peek();
        if(checkTags(start,end))
        {
            insertIntoMap(end,tags,nr);
            break;
        }
        stack.pop();
    }
    
}

//\n { /**/}
//. {/**Cdo simbol tjeter nuk be asgje*/}