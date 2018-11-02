
(* The type of tokens. *)

type token = 
  | TL
  | TIMES
  | THEN
  | RPAREN
  | REVERSE
  | REPLACE
  | REPETITION
  | REMV
  | REMOVEDUP
  | PLUS
  | NULL
  | MINUS
  | LPAREN
  | LET
  | ISZERO
  | INTERSECTION
  | INT of (int)
  | INSR
  | IN
  | IF
  | ID of (string)
  | HD
  | EQUALS
  | EOF
  | EMPTYLIST
  | ELSE
  | DIVIDED
  | COUNT
  | CONS
  | COMMA
  | APPEND
  | ABS

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.expr)
