
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
    | PROC
    | PLUS
    | NEWREF
    | MINUS
    | LPAREN
    | LETREC
    | LET
    | LBRACE
    | ISZERO
    | INTTYPE
    | INT of (
# 22 "parser.mly"
       (int)
# 28 "parser.ml"
  )
    | IN
    | IF
    | ID of (
# 23 "parser.mly"
       (string)
# 35 "parser.ml"
  )
    | FUNCTIONTYPE
    | EQUALS
    | EOF
    | END
    | ELSE
    | DIVIDED
    | DEREF
    | DEBUG
    | COMMA
    | COLON
    | BOOLTYPE
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
  | MenhirState86
  | MenhirState83
  | MenhirState82
  | MenhirState81
  | MenhirState80
  | MenhirState78
  | MenhirState76
  | MenhirState74
  | MenhirState72
  | MenhirState70
  | MenhirState68
  | MenhirState67
  | MenhirState66
  | MenhirState65
  | MenhirState64
  | MenhirState63
  | MenhirState62
  | MenhirState60
  | MenhirState59
  | MenhirState58
  | MenhirState57
  | MenhirState56
  | MenhirState55
  | MenhirState53
  | MenhirState52
  | MenhirState51
  | MenhirState49
  | MenhirState48
  | MenhirState47
  | MenhirState45
  | MenhirState43
  | MenhirState42
  | MenhirState37
  | MenhirState35
  | MenhirState32
  | MenhirState30
  | MenhirState28
  | MenhirState25
  | MenhirState19
  | MenhirState17
  | MenhirState16
  | MenhirState14
  | MenhirState9
  | MenhirState5
  | MenhirState2
  | MenhirState0

# 8 "parser.mly"
  
open Ast

# 116 "parser.ml"

let rec _menhir_run78 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.texpr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLTYPE ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | INTTYPE ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState78
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78

and _menhir_goto_texpr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.texpr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | FUNCTIONTYPE ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
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
                    _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState14
                | DEBUG ->
                    _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState14
                | DEREF ->
                    _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState14
                | ID _v ->
                    _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
                | IF ->
                    _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState14
                | INT _v ->
                    _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
                | ISZERO ->
                    _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState14
                | LET ->
                    _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState14
                | LETREC ->
                    _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState14
                | LPAREN ->
                    _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState14
                | NEWREF ->
                    _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState14
                | PROC ->
                    _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState14
                | SET ->
                    _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState14
                | SETREF ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState14
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState14)
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | FUNCTIONTYPE ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (t1 : (Ast.texpr))), _, (t2 : (Ast.texpr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.texpr) = 
# 142 "parser.mly"
                                          ( FuncType(t1,t2) )
# 211 "parser.ml"
             in
            _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        _menhir_fail ()

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Ast.expr list)) = _v in
        let _v : (Ast.expr list) = 
# 144 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x )
# 238 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Ast.expr list)) = _v in
        let ((_menhir_stack, _menhir_s, (x : (Ast.expr))), _) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr list) = 
# 231 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x :: xs )
# 250 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run43 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | DEBUG ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | DEREF ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | ID _v ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | IF ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | INT _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | ISZERO ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | LPAREN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | NEWREF ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43

and _menhir_run47 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | DEBUG ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | DEREF ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | ID _v ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | IF ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | INT _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | ISZERO ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | LPAREN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | NEWREF ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47

and _menhir_run51 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | DEBUG ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | DEREF ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | ID _v ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | IF ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | INT _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
    | ISZERO ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | LPAREN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | NEWREF ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState51
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51

and _menhir_run49 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | DEBUG ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | DEREF ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | ID _v ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | IF ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | INT _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | ISZERO ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | LPAREN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | NEWREF ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.texpr) = 
# 140 "parser.mly"
            ( IntType )
# 420 "parser.ml"
     in
    _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run11 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.texpr) = 
# 141 "parser.mly"
              ( BoolType )
# 432 "parser.ml"
     in
    _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState45 | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState42 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | DEBUG ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | DEREF ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | ID _v ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
            | IF ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | INT _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
            | ISZERO ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | LPAREN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | NEWREF ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState45
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45)
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState42
        | END ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr list) = 
# 229 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [ x ] )
# 498 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42)
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 150 "parser.mly"
                                  ( Mul(e1,e2) )
# 513 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | MINUS | NEWREF | PLUS | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 148 "parser.mly"
                                 ( Add(e1,e2) )
# 532 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
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
# 151 "parser.mly"
                                    ( Div(e1,e2) )
# 547 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | MINUS | NEWREF | PLUS | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 149 "parser.mly"
                                  ( Sub(e1,e2) )
# 566 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52)
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState53 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 158 "parser.mly"
                                      ( DeRef(e) )
# 596 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53)
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState55 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | DEBUG ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | DEREF ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | ID _v ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
            | IF ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | INT _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
            | ISZERO ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | LPAREN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | NEWREF ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState56
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56)
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55)
    | MenhirState56 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState57 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | DEBUG ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | DEREF ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | ID _v ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
            | IF ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | INT _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
            | ISZERO ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | LPAREN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | NEWREF ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58)
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57)
    | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))), _), _, (e3 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 160 "parser.mly"
                                                      ( ITE(e1,e2,e3) )
# 739 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59)
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState60 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 156 "parser.mly"
                                       ( IsZero(e) )
# 769 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60)
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState62 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | DEBUG ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | DEREF ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | ID _v ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | IF ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | INT _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
            | ISZERO ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | LPAREN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | NEWREF ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState63
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63)
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62)
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 852 "parser.ml"
            ))), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 152 "parser.mly"
                                                    ( Let(x,e1,e2) )
# 860 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64)
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState65 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | DEBUG ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | DEREF ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | ID _v ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
            | IF ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | INT _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
            | ISZERO ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | LPAREN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState66
            | NEWREF ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState66
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
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState65
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
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 941 "parser.ml"
            ))), (y : (
# 23 "parser.mly"
       (string)
# 945 "parser.ml"
            ))), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _8 = () in
            let _6 = () in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 153 "parser.mly"
                                                                               ( Letrec(x,y,e1,e2) )
# 955 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67)
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState68 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 165 "parser.mly"
                                      ( Sub(Int 0, e) )
# 985 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68)
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | DEBUG ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | DEREF ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | ID _v ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
        | IF ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | INT _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
        | ISZERO ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | LET ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | LETREC ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | LPAREN ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | NEWREF ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | PROC ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState70 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 163 "parser.mly"
                               (e)
# 1040 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | SET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | SETREF ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70)
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState72 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 155 "parser.mly"
                                           ( App(e1,e2) )
# 1075 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72)
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState74 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 157 "parser.mly"
                                       ( NewRef(e) )
# 1107 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74)
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | RBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState76 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 1135 "parser.ml"
            ))), _, (tType : (Ast.texpr))), _, (e : (Ast.expr))) = _menhir_stack in
            let _9 = () in
            let _7 = () in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 154 "parser.mly"
                                                                                   ( Proc(x,tType,e) )
# 1146 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76)
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 1173 "parser.ml"
            ))), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 161 "parser.mly"
                                    ( Set(x,e) )
# 1180 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80)
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState81 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | DEBUG ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | DEREF ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | ID _v ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
            | IF ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | INT _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
            | ISZERO ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | LPAREN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | NEWREF ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82)
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState81
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState81)
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState83 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 159 "parser.mly"
                                                          ( SetRef(e1,e2) )
# 1267 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState83
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run49 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState86 in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 79 "parser.mly"
       (Ast.prog)
# 1292 "parser.ml"
            ) = 
# 111 "parser.mly"
                 ( AProg e )
# 1296 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 79 "parser.mly"
       (Ast.prog)
# 1303 "parser.ml"
            )) = _v in
            Obj.magic _1
        | MINUS ->
            _menhir_run51 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | PLUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | TIMES ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState86
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState86)
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
# 1329 "parser.ml"
      
    in
    
# 170 "parser.mly"
                                            ( es )
# 1335 "parser.ml"
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
# 162 "parser.mly"
                             ( BeginEnd(es) )
# 1352 "parser.ml"
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
    | MenhirState86 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState83 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState81 ->
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
    | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState70 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
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
    | MenhirState64 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState60 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState56 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState52 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
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
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState35 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState30 ->
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
    | MenhirState17 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
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
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | DEBUG ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | DEREF ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | ID _v ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | IF ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | INT _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | ISZERO ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LET ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LETREC ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LPAREN ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | NEWREF ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState2
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
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | DEBUG ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | DEREF ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | ID _v ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
            | IF ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | INT _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
            | ISZERO ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | LPAREN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | NEWREF ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState5
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
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COLON ->
                let _menhir_stack = Obj.magic _menhir_stack in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                (match _tok with
                | BOOLTYPE ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState9
                | INTTYPE ->
                    _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState9
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState9)
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

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | DEBUG ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | DEREF ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | ID _v ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
        | IF ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | INT _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
        | ISZERO ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | LET ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | LETREC ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | LPAREN ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | NEWREF ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | PROC ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | SET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | SETREF ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | DEBUG ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | DEREF ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | ID _v ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | IF ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | INT _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState17 _v
    | ISZERO ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | LPAREN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | MINUS ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState17 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | DEBUG ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | DEREF ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | ID _v ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
        | IF ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | INT _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
        | ISZERO ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LET ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LETREC ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LPAREN ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | NEWREF ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState19
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
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | RPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState17 in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (Ast.expr) = 
# 166 "parser.mly"
                     ( Unit )
# 1840 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState17
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState17

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
                            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | DEBUG ->
                            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | DEREF ->
                            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | ID _v ->
                            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
                        | IF ->
                            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | INT _v ->
                            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
                        | ISZERO ->
                            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | LET ->
                            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | LETREC ->
                            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | LPAREN ->
                            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState25
                        | NEWREF ->
                            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState25
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
                _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | DEBUG ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | DEREF ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | ID _v ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
            | IF ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | INT _v ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
            | ISZERO ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | LET ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | LETREC ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | LPAREN ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState28
            | NEWREF ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState28
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
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | DEBUG ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | DEREF ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | ID _v ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | IF ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | INT _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | ISZERO ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | LET ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | LETREC ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | LPAREN ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | NEWREF ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | PROC ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | SET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | SETREF ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 22 "parser.mly"
       (int)
# 2063 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (i : (
# 22 "parser.mly"
       (int)
# 2071 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 145 "parser.mly"
              ( Int i )
# 2076 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run32 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | DEBUG ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | DEREF ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | ID _v ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | IF ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | INT _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | ISZERO ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | LPAREN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | NEWREF ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32

and _menhir_run33 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 2122 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (x : (
# 23 "parser.mly"
       (string)
# 2130 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 146 "parser.mly"
             ( Var x )
# 2135 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run34 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | DEBUG ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | DEREF ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | ID _v ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
        | IF ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | INT _v ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
        | ISZERO ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | LET ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | LETREC ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | LPAREN ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | NEWREF ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | PROC ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | SET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | SETREF ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.expr) = 
# 147 "parser.mly"
            ( Debug )
# 2197 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run37 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | DEBUG ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | DEREF ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | ID _v ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | IF ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | INT _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
    | ISZERO ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | LPAREN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | NEWREF ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState37
    | END ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState37 in
        let _v : (Ast.expr list) = 
# 142 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [] )
# 2241 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37

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
# 79 "parser.mly"
       (Ast.prog)
# 2264 "parser.ml"
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
        _menhir_run37 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DEBUG ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DEREF ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ID _v ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | ISZERO ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LET ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LETREC ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LPAREN ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NEWREF ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState0
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
  

# 2314 "parser.ml"
