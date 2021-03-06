(* File lexer.mll *)
{
open Parser        (* The type token is defined in parser.mli *)
open Int64
exception Eof
}
rule token = parse
  [' ' '\t']     { token lexbuf }     (* skip blanks *)
| ['\n' ]        { EOL }
| ['0'-'9']+ as lxm { INT64(Int64.of_string lxm) }
| '+'            { PLUS }
| '-'            { MINUS }
| '*'            { TIMES }
| "and"          { AND }
| "or"           { OR }
| '<'            { LESS }
| "<="           { LESSEQ }
| '>'            { GREATER }
| ">="           { GREATEREQ }
| "=="           { EQUAL }
| "!="           { NOTEQ }
| '('            { LPAREN }
| ')'            { RPAREN }
| '='            { ASSIGN }
| ','            { COMMA }
| "if"           { IF }
| "else"         { ELSE }
| "let"          { LET }
| "add1"         { ADD1 }
| "sub1"         { SUB1 }
| "not"          { NOT }
| "in"           { IN }
| "def"          { DEF }
| ':'            { COLON }
| ['a'-'z' 'A'-'Z']+ as lxm { ID lxm }
| eof            { EOF }
