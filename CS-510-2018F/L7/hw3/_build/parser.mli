
(* The type of tokens. *)

type token = 
  | UNPAIR
  | UNITTYPE
  | UNIT
  | TREETYPE
  | TL
  | TIMES
  | THEN
  | SETREF
  | SET
  | SEMICOLON
  | RPAREN
  | REFTYPE
  | RBRACE
  | PROC
  | PLUS
  | PAIR
  | NULL_QUESTION
  | NULLT_QUESTION
  | NODE
  | NEWREF
  | MINUS
  | LPAREN
  | LISTTYPE
  | LETREC
  | LET
  | LESS_THAN
  | LBRACE
  | ISZERO
  | INTTYPE
  | INT of (int)
  | IN
  | IF
  | ID of (string)
  | HD
  | GREATER_THAN
  | GETRST
  | GETLST
  | GETDATA
  | EQUALS
  | EOF
  | END
  | EMPTYTREE
  | EMPTYLIST
  | ELSE
  | DIVIDED
  | DEREF
  | DEBUG
  | CONS
  | COMMA
  | COLON
  | BOOLTYPE
  | BEGIN
  | ARROW

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.prog)
