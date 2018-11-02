
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | TIMES
    | THEN
    | SETREF
    | SET
    | SEMICOLON
    | RPAREN
    | RBRACE
    | RANGLE
    | PROC
    | PLUS
    | NEWREF
    | MINUS
    | LPAREN
    | LETREC
    | LET
    | LBRACE
    | LANGLE
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
    | DEBUG
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
  | MenhirState87
  | MenhirState84
  | MenhirState83
  | MenhirState82
  | MenhirState81
  | MenhirState79
  | MenhirState77
  | MenhirState75
  | MenhirState73
  | MenhirState71
  | MenhirState70
  | MenhirState69
  | MenhirState68
  | MenhirState67
  | MenhirState66
  | MenhirState65
  | MenhirState61
  | MenhirState60
  | MenhirState59
  | MenhirState58
  | MenhirState57
  | MenhirState56
  | MenhirState54
  | MenhirState53
  | MenhirState52
  | MenhirState50
  | MenhirState49
  | MenhirState48
  | MenhirState46
  | MenhirState44
  | MenhirState43
  | MenhirState38
  | MenhirState36
  | MenhirState33
  | MenhirState31
  | MenhirState29
  | MenhirState28
  | MenhirState25
  | MenhirState19
  | MenhirState18
  | MenhirState17
  | MenhirState15
  | MenhirState9
  | MenhirState7
  | MenhirState5
  | MenhirState2
  | MenhirState0

# 8 "parser.mly"
  
open Ast

# 115 "parser.ml"

let rec _menhir_goto_separated_nonempty_list_COMMA_ID_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (string list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (string list)) = _v in
        let (_menhir_stack, _menhir_s, (x : (
# 23 "parser.mly"
       (string)
# 127 "parser.ml"
        ))) = _menhir_stack in
        let _2 = () in
        let _v : (string list) = 
# 231 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x :: xs )
# 133 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_ID_ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (string list)) = _v in
        let _v : (string list) = 
# 144 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x )
# 143 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_COMMA_ID__ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState29 | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Ast.expr list)) = _v in
        let _v : (Ast.expr list) = 
# 144 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x )
# 164 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Ast.expr list)) = _v in
        let ((_menhir_stack, _menhir_s, (x : (Ast.expr))), _) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr list) = 
# 231 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x :: xs )
# 176 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run44 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | DEBUG ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | DEREF ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | ID _v ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | IF ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | INT _v ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | ISZERO ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | LANGLE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | LPAREN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | NEWREF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44

and _menhir_run48 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | DEBUG ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | DEREF ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | ID _v ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | IF ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | INT _v ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | ISZERO ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | LANGLE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | LPAREN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | NEWREF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48

and _menhir_run52 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | DEBUG ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | DEREF ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | ID _v ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
    | IF ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | INT _v ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
    | ISZERO ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | LANGLE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | LPAREN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | NEWREF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState52
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52

and _menhir_run50 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | DEBUG ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | DEREF ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | ID _v ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | IF ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | INT _v ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState50 _v
    | ISZERO ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | LANGLE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | LPAREN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | NEWREF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState50
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50

and _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (xs0 : (Ast.expr list)) = _v in
    let _v : (Ast.expr list) = let es =
      let xs = xs0 in
      
# 220 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( xs )
# 356 "parser.ml"
      
    in
    
# 163 "parser.mly"
                                            ( es )
# 362 "parser.ml"
     in
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | END ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (es : (Ast.expr list))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 155 "parser.mly"
                             ( BeginEnd(es) )
# 381 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | RANGLE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (es : (Ast.expr list))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 159 "parser.mly"
                                 ( Tuple(es) )
# 405 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_goto_loption_separated_nonempty_list_COMMA_ID__ : _menhir_env -> 'ttv_tail -> _menhir_state -> (string list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = Obj.magic _menhir_stack in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (xs0 : (string list)) = _v in
    let _v : (string list) = let ids =
      let xs = xs0 in
      
# 220 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( xs )
# 427 "parser.ml"
      
    in
    
# 166 "parser.mly"
                                       ( ids )
# 433 "parser.ml"
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
        | LBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | DEBUG ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | DEREF ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | ID _v ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
            | IF ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | INT _v ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
            | ISZERO ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | LANGLE ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | LPAREN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | NEWREF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15)
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

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 500 "parser.ml"
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
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9)
    | RPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, (x : (
# 23 "parser.mly"
       (string)
# 523 "parser.ml"
        ))) = _menhir_stack in
        let _v : (string list) = 
# 229 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [ x ] )
# 528 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_COMMA_ID_ _menhir_env _menhir_stack _menhir_s _v
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
    | MenhirState29 | MenhirState46 | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState43 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | DEBUG ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | DEREF ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | ID _v ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | IF ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | INT _v ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | ISZERO ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | LANGLE ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | LPAREN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | NEWREF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46)
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | END | RANGLE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr list) = 
# 229 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [ x ] )
# 602 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43)
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 143 "parser.mly"
                                  ( Mul(e1,e2) )
# 617 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LET | LETREC | LPAREN | MINUS | NEWREF | PLUS | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 141 "parser.mly"
                                 ( Add(e1,e2) )
# 636 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49)
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 144 "parser.mly"
                                    ( Div(e1,e2) )
# 651 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState52 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LET | LETREC | LPAREN | MINUS | NEWREF | PLUS | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 142 "parser.mly"
                                  ( Sub(e1,e2) )
# 670 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53)
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState54 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 151 "parser.mly"
                                      ( DeRef(e) )
# 700 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54)
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState56 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | DEBUG ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | DEREF ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | ID _v ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
            | IF ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | INT _v ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
            | ISZERO ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | LANGLE ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | LPAREN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | NEWREF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState57
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57)
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56)
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState58 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | DEBUG ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | DEREF ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | ID _v ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | IF ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | INT _v ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | ISZERO ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | LANGLE ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | LPAREN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | NEWREF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59)
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58)
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LET | LETREC | LPAREN | NEWREF | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))), _), _, (e3 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 153 "parser.mly"
                                                      ( ITE(e1,e2,e3) )
# 847 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60)
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState61 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 149 "parser.mly"
                                       ( IsZero(e) )
# 877 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61)
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState65 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | DEBUG ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | DEREF ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | ID _v ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
            | IF ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | INT _v ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
            | ISZERO ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | LANGLE ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | LPAREN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | NEWREF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66)
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65)
    | MenhirState66 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LET | LETREC | LPAREN | NEWREF | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 962 "parser.ml"
            ))), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 145 "parser.mly"
                                                    ( Let(x,e1,e2) )
# 970 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67)
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState68 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | DEBUG ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | DEREF ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | ID _v ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
            | IF ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | INT _v ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
            | ISZERO ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | LANGLE ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | LPAREN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | NEWREF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69)
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState68
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
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LET | LETREC | LPAREN | NEWREF | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 1053 "parser.ml"
            ))), (y : (
# 23 "parser.mly"
       (string)
# 1057 "parser.ml"
            ))), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _8 = () in
            let _6 = () in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 146 "parser.mly"
                                                                               ( Letrec(x,y,e1,e2) )
# 1067 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70)
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState71 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 158 "parser.mly"
                                      ( Sub(Int 0, e) )
# 1097 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71)
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | DEBUG ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | DEREF ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | ID _v ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
        | IF ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | INT _v ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
        | ISZERO ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | LANGLE ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | LET ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | LETREC ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | LPAREN ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | NEWREF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | PROC ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState73 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 156 "parser.mly"
                               (e)
# 1154 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | SET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | SETREF ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73)
    | MenhirState73 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState75 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 148 "parser.mly"
                                           ( App(e1,e2) )
# 1189 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75)
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState77 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 150 "parser.mly"
                                       ( NewRef(e) )
# 1221 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77)
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | RBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState79 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (xs : (string list))), _, (e : (Ast.expr))) = _menhir_stack in
            let _7 = () in
            let _5 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 147 "parser.mly"
                                                                       ( Proc(xs,e) )
# 1255 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79)
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LANGLE | LET | LETREC | LPAREN | NEWREF | PROC | RANGLE | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 1282 "parser.ml"
            ))), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 154 "parser.mly"
                                    ( Set(x,e) )
# 1289 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81)
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState82 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | DEBUG ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | DEREF ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | ID _v ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
            | IF ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | INT _v ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
            | ISZERO ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | LANGLE ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | LPAREN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | NEWREF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState83
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83)
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82)
    | MenhirState83 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState84 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 152 "parser.mly"
                                                          ( SetRef(e1,e2) )
# 1378 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState84
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState84)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState87 in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 77 "parser.mly"
       (Ast.prog)
# 1403 "parser.ml"
            ) = 
# 109 "parser.mly"
                 ( AProg e )
# 1407 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 77 "parser.mly"
       (Ast.prog)
# 1414 "parser.ml"
            )) = _v in
            Obj.magic _1
        | MINUS ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | PLUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | TIMES ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState87
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState87)
    | _ ->
        _menhir_fail ()

and _menhir_reduce26 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : (Ast.expr list) = 
# 142 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [] )
# 1435 "parser.ml"
     in
    _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ _menhir_env _menhir_stack _menhir_s _v

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState87 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState84 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState83 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState81 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState79 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState77 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState75 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState73 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
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
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState66 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState60 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState56 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState52 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState36 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState29 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState18 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
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
        | BEGIN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | DEBUG ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | DEREF ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | ID _v ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | IF ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | INT _v ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | ISZERO ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LANGLE ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LET ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LETREC ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LPAREN ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | NEWREF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | PROC ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | SET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | SETREF ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState2
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

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | DEBUG ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | DEREF ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | ID _v ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
            | IF ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | INT _v ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
            | ISZERO ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | LANGLE ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | LPAREN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | NEWREF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5)
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

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState7 in
            let _v : (string list) = 
# 142 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [] )
# 1765 "parser.ml"
             in
            _menhir_goto_loption_separated_nonempty_list_COMMA_ID__ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | DEBUG ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | DEREF ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | ID _v ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
        | IF ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | INT _v ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
        | ISZERO ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | LANGLE ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | LET ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | LETREC ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | LPAREN ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | NEWREF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | PROC ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | SET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | SETREF ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState17
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17)
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
    | BEGIN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | DEBUG ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | DEREF ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | ID _v ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | IF ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | INT _v ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState18 _v
    | ISZERO ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | LANGLE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | LPAREN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | MINUS ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState18 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | DEBUG ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | DEREF ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | ID _v ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
        | IF ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | INT _v ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
        | ISZERO ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LANGLE ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LET ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LETREC ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LPAREN ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | NEWREF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | PROC ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | SET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | SETREF ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19)
    | NEWREF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState18
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState18

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
                            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | DEBUG ->
                            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | DEREF ->
                            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | ID _v ->
                            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
                        | IF ->
                            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | INT _v ->
                            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
                        | ISZERO ->
                            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | LANGLE ->
                            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | LET ->
                            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | LETREC ->
                            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | LPAREN ->
                            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | NEWREF ->
                            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | PROC ->
                            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | SET ->
                            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | SETREF ->
                            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState25)
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

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | DEBUG ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | DEREF ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | ID _v ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
            | IF ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | INT _v ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
            | ISZERO ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | LANGLE ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | LPAREN ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | NEWREF ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28)
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

and _menhir_run29 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | DEBUG ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | DEREF ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | ID _v ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | IF ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | INT _v ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState29 _v
    | ISZERO ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | LANGLE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | LPAREN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | NEWREF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | RANGLE ->
        _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack) MenhirState29
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState29

and _menhir_run30 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | DEBUG ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | DEREF ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | ID _v ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | IF ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | INT _v ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | ISZERO ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | LANGLE ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | LET ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | LETREC ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | LPAREN ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | NEWREF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | PROC ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | SET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | SETREF ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run32 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 22 "parser.mly"
       (int)
# 2173 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (i : (
# 22 "parser.mly"
       (int)
# 2181 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 138 "parser.mly"
              ( Int i )
# 2186 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run33 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | DEBUG ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | DEREF ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | ID _v ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | IF ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | INT _v ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | ISZERO ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | LANGLE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | LPAREN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | NEWREF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33

and _menhir_run34 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 2234 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (x : (
# 23 "parser.mly"
       (string)
# 2242 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 139 "parser.mly"
             ( Var x )
# 2247 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run35 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | DEBUG ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | DEREF ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | ID _v ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
        | IF ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | INT _v ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState36 _v
        | ISZERO ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | LANGLE ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | LET ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | LETREC ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | LPAREN ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | NEWREF ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | PROC ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | SET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | SETREF ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState36
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState36)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.expr) = 
# 140 "parser.mly"
            ( Debug )
# 2311 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | DEBUG ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | DEREF ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | ID _v ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | IF ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | INT _v ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | ISZERO ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | LANGLE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | LPAREN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | NEWREF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | END ->
        _menhir_reduce26 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38

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
# 77 "parser.mly"
       (Ast.prog)
# 2373 "parser.ml"
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
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DEBUG ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DEREF ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ID _v ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | ISZERO ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LANGLE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LPAREN ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NEWREF ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 233 "/home/alcy/.opam/system/lib/menhir/standard.mly"
  

# 2425 "parser.ml"
