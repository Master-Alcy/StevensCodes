
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | UNTUPLE
    | TUPLE
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
    | INT of (
# 22 "parser.mly"
       (int)
# 29 "parser.ml"
  )
    | IN
    | IF
    | ID of (
# 23 "parser.mly"
       (string)
# 36 "parser.ml"
  )
    | EQUALS
    | EOF
    | END
    | ELSE
    | DIVIDED
    | DEREF
    | COMMA
    | BEGIN
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState100
  | MenhirState98
  | MenhirState97
  | MenhirState96
  | MenhirState94
  | MenhirState93
  | MenhirState87
  | MenhirState86
  | MenhirState85
  | MenhirState84
  | MenhirState82
  | MenhirState80
  | MenhirState78
  | MenhirState76
  | MenhirState74
  | MenhirState73
  | MenhirState72
  | MenhirState71
  | MenhirState70
  | MenhirState69
  | MenhirState68
  | MenhirState66
  | MenhirState65
  | MenhirState64
  | MenhirState63
  | MenhirState62
  | MenhirState61
  | MenhirState59
  | MenhirState58
  | MenhirState57
  | MenhirState55
  | MenhirState54
  | MenhirState53
  | MenhirState51
  | MenhirState49
  | MenhirState48
  | MenhirState43
  | MenhirState42
  | MenhirState39
  | MenhirState37
  | MenhirState35
  | MenhirState32
  | MenhirState26
  | MenhirState25
  | MenhirState24
  | MenhirState22
  | MenhirState17
  | MenhirState14
  | MenhirState12
  | MenhirState10
  | MenhirState4
  | MenhirState2
  | MenhirState0

# 8 "parser.mly"
  
open Ast

# 120 "parser.ml"

let rec _menhir_goto_separated_nonempty_list_COMMA_ID_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (string list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (string list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (
# 23 "parser.mly"
       (string)
# 132 "parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (string list) = 
# 231 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x :: xs )
# 138 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_ID_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (string list)) = _v in
        let _v : (string list) = 
# 144 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x )
# 148 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_ID__ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_separated_nonempty_list_COMMA_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Ast.expr list)) = _v in
        let _v : (Ast.expr list) = 
# 144 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x )
# 169 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState94 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Ast.expr list)) = _v in
        let ((_menhir_stack, _menhir_s, (x : (Ast.expr))), _) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr list) = 
# 231 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x :: xs )
# 181 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Ast.expr list)) = _v in
        let _v : (Ast.expr list) = 
# 144 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x )
# 197 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Ast.expr list)) = _v in
        let ((_menhir_stack, _menhir_s, (x : (Ast.expr))), _) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr list) = 
# 231 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x :: xs )
# 209 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run49 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | DEREF ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | ID _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | IF ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | INT _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | ISZERO ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | LET ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | LETREC ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | LPAREN ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | NEWREF ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | PROC ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | SET ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | SETREF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | TUPLE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49

and _menhir_run53 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | DEREF ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | ID _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | IF ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | INT _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
    | ISZERO ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | LET ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | LETREC ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | LPAREN ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | NEWREF ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | PROC ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | SET ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | SETREF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | TUPLE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState53
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53

and _menhir_run57 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | DEREF ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | ID _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | IF ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | INT _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | ISZERO ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | LET ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | LETREC ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | LPAREN ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | NEWREF ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | PROC ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | SET ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | SETREF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | TUPLE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57

and _menhir_run55 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | DEREF ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | ID _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | IF ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | INT _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | ISZERO ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | LET ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | LETREC ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | LPAREN ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | NEWREF ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | PROC ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | SET ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | SETREF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | TUPLE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55

and _menhir_goto_loption_separated_nonempty_list_COMMA_ID__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (string list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (xs0 : (string list)) = _v in
    let _v : (string list) = let ids =
      let xs = xs0 in
      
# 220 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( xs )
# 389 "parser.ml"
      
    in
    
# 169 "parser.mly"
                                       ( ids )
# 395 "parser.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQUALS ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | DEREF ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | ID _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | INT _v ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
            | ISZERO ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | LET ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | LETREC ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | LPAREN ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | NEWREF ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | PROC ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | SET ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | SETREF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | TUPLE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState10
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 462 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | COMMA ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4)
    | RPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (
# 23 "parser.mly"
       (string)
# 485 "parser.ml"
        ))) = _menhir_stack in
        let _v : (string list) = 
# 229 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [ x ] )
# 490 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_ID_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (xs0 : (Ast.expr list)) = _v in
    let _v : (Ast.expr list) = let es =
      let xs = xs0 in
      
# 220 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( xs )
# 510 "parser.ml"
      
    in
    
# 166 "parser.mly"
                                        ( es )
# 516 "parser.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | RPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, (es : (Ast.expr list))) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _1 = () in
        let _v : (Ast.expr) = 
# 143 "parser.mly"
                                               ( Tuple(es) )
# 534 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState51 | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState48 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | DEREF ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | ID _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | INT _v ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | ISZERO ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | LET ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | LETREC ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | LPAREN ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | NEWREF ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | PROC ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | SET ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | SETREF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | TUPLE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51)
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | END ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr list) = 
# 229 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [ x ] )
# 608 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48)
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 141 "parser.mly"
                                  ( Mul(e1,e2) )
# 623 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | BEGIN | COMMA | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | MINUS | NEWREF | PLUS | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TUPLE | UNTUPLE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 139 "parser.mly"
                                 ( Add(e1,e2) )
# 642 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54)
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 142 "parser.mly"
                                    ( Div(e1,e2) )
# 657 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | BEGIN | COMMA | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | MINUS | NEWREF | PLUS | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TUPLE | UNTUPLE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 140 "parser.mly"
                                  ( Sub(e1,e2) )
# 676 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58)
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState59 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 152 "parser.mly"
                                      ( DeRef(e) )
# 706 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59)
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState61 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | DEREF ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | ID _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | INT _v ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | ISZERO ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | LET ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | LETREC ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | LPAREN ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | NEWREF ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | PROC ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | SET ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | SETREF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | TUPLE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62)
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61)
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState63 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | DEREF ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | ID _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | INT _v ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState64 _v
            | ISZERO ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | LET ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | LETREC ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | LPAREN ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | NEWREF ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | PROC ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | SET ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | SETREF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | TUPLE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState64
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63)
    | MenhirState64 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | BEGIN | COMMA | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TUPLE | UNTUPLE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))), _), _, (e3 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 154 "parser.mly"
                                                      ( ITE(e1,e2,e3) )
# 853 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65)
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState66 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 150 "parser.mly"
                                       ( IsZero(e) )
# 883 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66)
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState68 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | DEREF ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | ID _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | INT _v ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
            | ISZERO ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | LET ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | LETREC ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | LPAREN ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | NEWREF ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | PROC ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | SET ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | SETREF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | TUPLE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68)
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | BEGIN | COMMA | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TUPLE | UNTUPLE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 968 "parser.ml"
            ))), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 146 "parser.mly"
                                                    ( Let(x,e1,e2) )
# 976 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70)
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState71 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | DEREF ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | ID _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | INT _v ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
            | ISZERO ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | LET ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | LETREC ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | LPAREN ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | NEWREF ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | PROC ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | SET ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | SETREF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | TUPLE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71)
    | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | BEGIN | COMMA | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TUPLE | UNTUPLE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 1059 "parser.ml"
            ))), (y : (
# 23 "parser.mly"
       (string)
# 1063 "parser.ml"
            ))), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _8 = () in
            let _6 = () in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 147 "parser.mly"
                                                                               ( Letrec(x,y,e1,e2) )
# 1073 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73)
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState74 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 159 "parser.mly"
                                      ( Sub(Int 0, e) )
# 1103 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74)
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | DEREF ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | ID _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | IF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | INT _v ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | ISZERO ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | LET ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | LETREC ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | LPAREN ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | NEWREF ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | PROC ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState76 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 157 "parser.mly"
                               (e)
# 1156 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | SET ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | SETREF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | TUPLE ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76)
    | MenhirState76 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState78 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 149 "parser.mly"
                                           ( App(e1,e2) )
# 1195 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78)
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState80 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 151 "parser.mly"
                                       ( NewRef(e) )
# 1227 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80)
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | RBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState82 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 1255 "parser.ml"
            ))), _, (e : (Ast.expr))) = _menhir_stack in
            let _7 = () in
            let _5 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 148 "parser.mly"
                                                             ( Proc(x,e) )
# 1265 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82)
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | BEGIN | COMMA | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TUPLE | UNTUPLE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 1292 "parser.ml"
            ))), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 155 "parser.mly"
                                    ( Set(x,e) )
# 1299 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84)
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState85 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState86
            | DEREF ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState86
            | ID _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState86
            | INT _v ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState86 _v
            | ISZERO ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState86
            | LET ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState86
            | LETREC ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState86
            | LPAREN ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState86
            | NEWREF ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState86
            | PROC ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState86
            | SET ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState86
            | SETREF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState86
            | TUPLE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState86
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState86
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState86)
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState85
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85)
    | MenhirState86 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState87 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 153 "parser.mly"
                                                          ( SetRef(e1,e2) )
# 1388 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87)
    | MenhirState94 | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState93 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | DEREF ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | ID _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | INT _v ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
            | ISZERO ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | LET ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | LETREC ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | LPAREN ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | NEWREF ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | PROC ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | SET ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | SETREF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | TUPLE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94)
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState93
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr list) = 
# 229 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [ x ] )
# 1457 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_COMMA_expr_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState93)
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState96 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | DEREF ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | ID _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | INT _v ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
            | ISZERO ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | LET ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | LETREC ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | LPAREN ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | NEWREF ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | PROC ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | SET ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | SETREF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | TUPLE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97)
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState96
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96)
    | MenhirState97 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState98
        | BEGIN | COMMA | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TUPLE | UNTUPLE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((((_menhir_stack, _menhir_s), _, (ids : (string list))), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _7 = () in
            let _5 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 145 "parser.mly"
                               ( LetTuple(ids,e1,e2) )
# 1546 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState100 in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 76 "parser.mly"
       (Ast.prog)
# 1569 "parser.ml"
            ) = 
# 108 "parser.mly"
                 ( AProg e )
# 1573 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 76 "parser.mly"
       (Ast.prog)
# 1580 "parser.ml"
            )) = _v in
            Obj.magic _1
        | MINUS ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | PLUS ->
            _menhir_run53 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | TIMES ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState100
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100)
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (xs0 : (Ast.expr list)) = _v in
    let _v : (Ast.expr list) = let es =
      let xs = xs0 in
      
# 220 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( xs )
# 1606 "parser.ml"
      
    in
    
# 163 "parser.mly"
                                            ( es )
# 1612 "parser.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_stack = Obj.magic _menhir_stack in
    assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | END ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _, (es : (Ast.expr list))) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : (Ast.expr) = 
# 156 "parser.mly"
                             ( BeginEnd(es) )
# 1629 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState98 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState97 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState96 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState94 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState93 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState87 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState86 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState85 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState84 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState80 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState76 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState74 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState73 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState71 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState68 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState66 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState64 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        raise _eRR

and _menhir_run1 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState2 in
            let _v : (string list) = 
# 142 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [] )
# 1873 "parser.ml"
             in
            _menhir_goto_loption_separated_nonempty_list_COMMA_ID__ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | DEREF ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | ID _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | IF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | INT _v ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | ISZERO ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LET ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LETREC ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LPAREN ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | NEWREF ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | PROC ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | SET ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | SETREF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | TUPLE ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState12 in
            let _v : (Ast.expr list) = 
# 142 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [] )
# 1934 "parser.ml"
             in
            _menhir_goto_loption_separated_nonempty_list_COMMA_expr__ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | DEREF ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | ID _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | IF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | INT _v ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | ISZERO ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | LET ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | LETREC ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | LPAREN ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | NEWREF ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | PROC ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | SET ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | SETREF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | TUPLE ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQUALS ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | DEREF ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | ID _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | INT _v ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
            | ISZERO ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | LET ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | LETREC ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | LPAREN ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | NEWREF ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | PROC ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | SET ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | SETREF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | TUPLE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState17
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run18 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ID _v ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | RPAREN ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | LBRACE ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | BEGIN ->
                        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState22
                    | DEREF ->
                        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState22
                    | ID _v ->
                        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
                    | IF ->
                        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState22
                    | INT _v ->
                        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState22 _v
                    | ISZERO ->
                        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState22
                    | LET ->
                        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState22
                    | LETREC ->
                        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState22
                    | LPAREN ->
                        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState22
                    | NEWREF ->
                        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState22
                    | PROC ->
                        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState22
                    | SET ->
                        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState22
                    | SETREF ->
                        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState22
                    | TUPLE ->
                        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState22
                    | UNTUPLE ->
                        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState22
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run23 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | DEREF ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | ID _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | IF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | INT _v ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
        | ISZERO ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | LET ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | LETREC ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | LPAREN ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | NEWREF ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | PROC ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | SET ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | SETREF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | TUPLE ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState24
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | DEREF ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | ID _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | IF ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | INT _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
    | ISZERO ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | LET ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | LETREC ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | LPAREN ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | MINUS ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState25 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | DEREF ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | ID _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | IF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | INT _v ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | ISZERO ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | LET ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | LETREC ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | LPAREN ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | NEWREF ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | PROC ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | SET ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | SETREF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | TUPLE ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26)
    | NEWREF ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | PROC ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | SET ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | SETREF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | TUPLE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState25
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | LPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ID _v ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | RPAREN ->
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    (match _tok with
                    | EQUALS ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | BEGIN ->
                            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                        | DEREF ->
                            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                        | ID _v ->
                            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
                        | IF ->
                            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                        | INT _v ->
                            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
                        | ISZERO ->
                            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                        | LET ->
                            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                        | LETREC ->
                            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                        | LPAREN ->
                            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                        | NEWREF ->
                            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                        | PROC ->
                            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                        | SET ->
                            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                        | SETREF ->
                            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                        | TUPLE ->
                            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                        | UNTUPLE ->
                            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState32
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run33 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ID _v ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | EQUALS ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | DEREF ->
                _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | ID _v ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | IF ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | INT _v ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
            | ISZERO ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | LET ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | LETREC ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | LPAREN ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | NEWREF ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | PROC ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | SET ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | SETREF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | TUPLE ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | UNTUPLE ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState35
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | DEREF ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | ID _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | IF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | INT _v ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | ISZERO ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | LET ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | LETREC ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | LPAREN ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | NEWREF ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | PROC ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | SET ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | SETREF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | TUPLE ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 22 "parser.mly"
       (int)
# 2501 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (i : (
# 22 "parser.mly"
       (int)
# 2509 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 137 "parser.mly"
              ( Int i )
# 2514 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | DEREF ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | ID _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | IF ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | INT _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | ISZERO ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | LET ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | LETREC ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | LPAREN ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | NEWREF ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | PROC ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | SET ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | SETREF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | TUPLE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 2562 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (x : (
# 23 "parser.mly"
       (string)
# 2570 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 138 "parser.mly"
             ( Var x )
# 2575 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | DEREF ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | ID _v ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | IF ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | INT _v ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
        | ISZERO ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | LET ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | LETREC ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | LPAREN ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | NEWREF ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | PROC ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | SET ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | SETREF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | TUPLE ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | UNTUPLE ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run43 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | DEREF ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | ID _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | IF ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | INT _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | ISZERO ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | LET ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | LETREC ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | LPAREN ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | NEWREF ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | PROC ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | SET ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | SETREF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | TUPLE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | END ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState43 in
        let _v : (Ast.expr list) = 
# 142 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [] )
# 2673 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and prog : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 76 "parser.mly"
       (Ast.prog)
# 2696 "parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env = let _tok = Obj.magic () in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    } in
    Obj.magic (let _menhir_stack = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DEREF ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ID _v ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | ISZERO ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LET ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LETREC ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LPAREN ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NEWREF ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PROC ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SET ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SETREF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | TUPLE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | UNTUPLE ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 233 "/home/alcy/.opam/system/lib/menhir/standard.mly"
  

# 2748 "parser.ml"
