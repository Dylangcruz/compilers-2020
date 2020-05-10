(* File lexer.mll *)
{
open Parser        (* The type token is defined in parser.mli *)
exception Eof
}
rule token = parse
  [' ' '\t']     { token lexbuf }     (* skip blanks *)
| ['\n' ]        { EOL }
| ['0'-'9']+ as lxm { INT(int_of_string lxm) }
| '+'            { PLUS }
| '-'            { MINUS }
| '*'            { TIMES }
| '/'            { DIV }
| '('            { LPAREN }
| ')'            { RPAREN }
| "print"        { PRINT }
| '='            { ASSIGN }
| ','            { COMMA }
| ['a'-'z' 'A'-'Z']+ as lxm { ID lxm }
| eof            { EOF }
