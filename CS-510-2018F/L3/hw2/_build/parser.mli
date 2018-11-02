
(* The type of tokens. *)

type token = 
  | TL
  | TIMES
  | THEN
  | RPAREN
  | PLUS
  | NULL
  | MINUS
  | LPAREN
  | LET
  | ISZERO
  | INT of (int)
  | IN
  | IF
  | ID of (string)
  | HD
  | EQUALS
  | EOF
  | EMPTYLIST
  | ELSE
  | DIVIDED
  | CONS
  | COMMA
  | ABS

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr)
