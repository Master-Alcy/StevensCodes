(* The first section of the lexer definition, called the *header*,
   is the part that appears below between { and }.  It is code
   that will simply be copied literally into the generated lexer.ml. *)

{
open Parser

}

(* The second section of the lexer definition defines *identifiers*
   that will be used later in the definition.  Each identifier is
   a *regular expression*.  We won't go into details on how regular
   expressions work.

   Below, we define regular expressions for
     - whitespace (spaces and tabs),
     - digits (0 through 9)
     - integers (nonempty sequences of digits, optionally preceded by a minus sign)
     - letters (a through z, and A through Z), and
     - identifiers (nonempty sequences of letters).

   FYI, these aren't exactly the same as the OCaml definitions of integers and
   identifiers. *)

let white = [' ' '\t' '\n']+
let digit = ['0'-'9']
let int = digit+
let letter = ['a'-'z' 'A'-'Z']
let id = letter+

(* The final section of the lexer definition defines how to parse a character
   stream into a token stream.  Each of the rules below has the form
     | regexp { action }
   If the lexer sees the regular expression [regexp], it produces the token
   specified by the [action].  We won't go into details on how the actions
   work.  *)

rule read =
  parse
  | white    { read lexbuf }
  | "+"      { PLUS }
  | "-"      { MINUS }
  | "*"      { TIMES }
  | "/"      { DIVIDED }
  | "("      { LPAREN }
  | ")"      { RPAREN }
  | "{"      { LBRACE }
  | "}"      { RBRACE }
  | ";"      { SEMICOLON }
  | ":"      { COLON }
  | ","      { COMMA }
  | "<"      { LESS_THAN }
  | ">"      { GREATER_THAN }
  | "let"    { LET }
  | "="      { EQUALS }
  | "in"     { IN }
  | "proc"   { PROC }
  | "zero?"  { ISZERO }
  | "if"     { IF }
  | "then"   { THEN }
  | "else"   { ELSE }
  | "letrec" { LETREC }
  | "set"    { SET }
  | "begin"  { BEGIN }
  | "end"    { END }
  | "newref" { NEWREF }
  | "deref"  { DEREF }
  | "setref" { SETREF }
  | "debug"  { DEBUG }
  | "int"    { INTTYPE }
  | "bool"   { BOOLTYPE }
  | "unit"   { UNITTYPE }
  | "->"     { ARROW }
  | "ref"    { REFTYPE }
  (* unit *)
  | "unitE"  { UNIT }
  (* pair *)
  | "pair"   { PAIR }
  | "unpair" { UNPAIR }
  (* list *)
  | "emptylist" { EMPTYLIST }
  | "cons"      { CONS }
  | "null?"     { NULL_QUESTION }
  | "hd"       { HD }
  | "tl"       { TL }
  | "list"      { LISTTYPE }
  (* tree *)
  | "emptytree" { EMPTYTREE }
  | "node"      { NODE }
  | "nullT?"    { NULLT_QUESTION }
  | "getData"   { GETDATA }
  | "getLST"    { GETLST }
  | "getRST"    { GETRST }
  | "tree"      { TREETYPE }
  
  | id       { ID (Lexing.lexeme lexbuf) }
  | int      { INT (int_of_string (Lexing.lexeme lexbuf)) }
  | eof      { EOF }

(* And that's the end of the lexer definition. *)
