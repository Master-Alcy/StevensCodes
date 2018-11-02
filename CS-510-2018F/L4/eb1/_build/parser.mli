
(* The type of tokens. *)

type token = 
  | TIMES
  | THEN
  | SETREF
  | SET
  | SEMICOLON
  | RPAREN
  | RBRACE
  | PROC
  | PLUS
  | NEWREF
  | MINUS
  | LPAREN
  | LETREC
  | LET
  | LBRACE
  | ISZERO
  | INT of (int)
  | IN
  | IF
  | ID of (string)
  | EQUALS
  | EOF
  | END
  | ELSE
  | DIVIDED
  | DEREF
  | DEBUG
  | COMMA
  | BEGIN

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val prog: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.prog)
