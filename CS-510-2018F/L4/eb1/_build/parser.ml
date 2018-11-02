
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
    | INT of (
# 22 "parser.mly"
       (int)
# 27 "parser.ml"
  )
    | IN
    | IF
    | ID of (
# 23 "parser.mly"
       (string)
# 34 "parser.ml"
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
  | MenhirState79
  | MenhirState76
  | MenhirState75
  | MenhirState74
  | MenhirState73
  | MenhirState71
  | MenhirState69
  | MenhirState67
  | MenhirState65
  | MenhirState63
  | MenhirState62
  | MenhirState61
  | MenhirState60
  | MenhirState59
  | MenhirState58
  | MenhirState57
  | MenhirState55
  | MenhirState54
  | MenhirState53
  | MenhirState52
  | MenhirState51
  | MenhirState50
  | MenhirState48
  | MenhirState47
  | MenhirState46
  | MenhirState44
  | MenhirState43
  | MenhirState42
  | MenhirState40
  | MenhirState38
  | MenhirState37
  | MenhirState32
  | MenhirState30
  | MenhirState27
  | MenhirState25
  | MenhirState23
  | MenhirState20
  | MenhirState14
  | MenhirState13
  | MenhirState12
  | MenhirState10
  | MenhirState5
  | MenhirState2
  | MenhirState0

# 8 "parser.mly"
  
open Ast

# 110 "parser.ml"

let rec _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Ast.expr list)) = _v in
        let _v : (Ast.expr list) = 
# 144 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x )
# 127 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Ast.expr list)) = _v in
        let ((_menhir_stack, _menhir_s, (x : (Ast.expr))), _) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr list) = 
# 231 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x :: xs )
# 139 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run38 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | DEBUG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | DEREF ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | ID _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | IF ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState38 _v
    | ISZERO ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | LET ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | LETREC ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | NEWREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState38
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38

and _menhir_run42 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | DEBUG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | DEREF ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | ID _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | IF ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState42 _v
    | ISZERO ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | LET ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | LETREC ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | NEWREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState42
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState42

and _menhir_run46 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | DEBUG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | DEREF ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | ID _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | IF ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | ISZERO ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | LET ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | LETREC ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | NEWREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_run44 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | DEBUG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | DEREF ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | ID _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | IF ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | ISZERO ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | LET ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | LETREC ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | NEWREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState44
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

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState40 | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState37 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | DEBUG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | DEREF ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState40 _v
            | ISZERO ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | LET ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | LETREC ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | NEWREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState40
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState40)
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | END ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr list) = 
# 229 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [ x ] )
# 363 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37)
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 140 "parser.mly"
                                  ( Mul(e1,e2) )
# 378 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState43
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | MINUS | NEWREF | PLUS | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 138 "parser.mly"
                                 ( Add(e1,e2) )
# 397 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
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
# 141 "parser.mly"
                                    ( Div(e1,e2) )
# 412 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | MINUS | NEWREF | PLUS | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 139 "parser.mly"
                                  ( Sub(e1,e2) )
# 431 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47)
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState48 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 148 "parser.mly"
                                      ( DeRef(e) )
# 461 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48)
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState50 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | DEBUG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | DEREF ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | ISZERO ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | LET ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | LETREC ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | NEWREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51)
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState50
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState50)
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState52 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | DEBUG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | DEREF ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
            | ISZERO ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | LET ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | LETREC ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | NEWREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState53
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53)
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState52
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52)
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState54
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))), _), _, (e3 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 150 "parser.mly"
                                                      ( ITE(e1,e2,e3) )
# 604 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54)
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState55 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 146 "parser.mly"
                                       ( IsZero(e) )
# 634 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55)
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState57 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | DEBUG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | DEREF ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState58 _v
            | ISZERO ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | LET ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | LETREC ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState58
            | NEWREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState58
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
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState57
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
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState59
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 717 "parser.ml"
            ))), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 142 "parser.mly"
                                                    ( Let(x,e1,e2) )
# 725 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59)
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState60 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | DEBUG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | DEREF ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
            | ISZERO ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | LET ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | LETREC ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | NEWREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState61
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61)
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60)
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState62
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 806 "parser.ml"
            ))), (y : (
# 23 "parser.mly"
       (string)
# 810 "parser.ml"
            ))), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _8 = () in
            let _6 = () in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 143 "parser.mly"
                                                                               ( Letrec(x,y,e1,e2) )
# 820 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62)
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState63 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 155 "parser.mly"
                                      ( Sub(Int 0, e) )
# 850 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63)
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | DEBUG ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | DEREF ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
        | ISZERO ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | LET ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | LETREC ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | NEWREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | PROC ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState65 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 153 "parser.mly"
                               (e)
# 905 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | SET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | SETREF ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState65
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65)
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState67 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 145 "parser.mly"
                                           ( App(e1,e2) )
# 940 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState67
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67)
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState69 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 147 "parser.mly"
                                       ( NewRef(e) )
# 972 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState69
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69)
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | RBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState71 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 1000 "parser.ml"
            ))), _, (e : (Ast.expr))) = _menhir_stack in
            let _7 = () in
            let _5 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 144 "parser.mly"
                                                             ( Proc(x,e) )
# 1010 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71)
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState73
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 1037 "parser.ml"
            ))), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 151 "parser.mly"
                                    ( Set(x,e) )
# 1044 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73)
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState74 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | DEBUG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | DEREF ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
            | ISZERO ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | LET ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | LETREC ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | NEWREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState75
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75)
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74)
    | MenhirState75 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState76 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 149 "parser.mly"
                                                          ( SetRef(e1,e2) )
# 1131 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState79 in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 75 "parser.mly"
       (Ast.prog)
# 1156 "parser.ml"
            ) = 
# 107 "parser.mly"
                 ( AProg e )
# 1160 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 75 "parser.mly"
       (Ast.prog)
# 1167 "parser.ml"
            )) = _v in
            Obj.magic _1
        | MINUS ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | PLUS ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | TIMES ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState79
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState79)
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
# 1193 "parser.ml"
      
    in
    
# 160 "parser.mly"
                                            ( es )
# 1199 "parser.ml"
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
# 152 "parser.mly"
                             ( BeginEnd(es) )
# 1216 "parser.ml"
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
    | MenhirState79 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState76 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState75 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState74 ->
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
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState62 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState61 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
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
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState52 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState50 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
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
    | MenhirState42 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState40 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState37 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState32 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState25 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState20 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState10 ->
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
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | DEBUG ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | DEREF ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | ISZERO ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LET ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LETREC ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | NEWREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState2
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
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | DEBUG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | DEREF ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
            | ISZERO ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | LET ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | LETREC ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | NEWREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState5
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
                        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | DEBUG ->
                        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | DEREF ->
                        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | ID _v ->
                        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
                    | IF ->
                        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | INT _v ->
                        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
                    | ISZERO ->
                        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | LET ->
                        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | LETREC ->
                        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | LPAREN ->
                        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | NEWREF ->
                        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | PROC ->
                        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | SET ->
                        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | SETREF ->
                        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10)
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
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | DEBUG ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | DEREF ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | ISZERO ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LET ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LETREC ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | NEWREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | PROC ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | SET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | SETREF ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState12
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
    | BEGIN ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | DEBUG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | DEREF ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | ID _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | IF ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | ISZERO ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | LET ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | LETREC ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | MINUS ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState13 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | DEBUG ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | DEREF ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | ISZERO ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | LET ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | LETREC ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | NEWREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState14
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
    | NEWREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

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
                            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState20
                        | DEBUG ->
                            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState20
                        | DEREF ->
                            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState20
                        | ID _v ->
                            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
                        | IF ->
                            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState20
                        | INT _v ->
                            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState20 _v
                        | ISZERO ->
                            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState20
                        | LET ->
                            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState20
                        | LETREC ->
                            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState20
                        | LPAREN ->
                            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState20
                        | NEWREF ->
                            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState20
                        | PROC ->
                            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState20
                        | SET ->
                            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState20
                        | SETREF ->
                            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState20
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState20)
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

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | DEBUG ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | DEREF ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | INT _v ->
                _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
            | ISZERO ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | LET ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | LETREC ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | NEWREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState23
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23)
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

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | DEBUG ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | DEREF ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState25 _v
        | ISZERO ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | LET ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | LETREC ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState25
        | NEWREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState25
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
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run26 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 22 "parser.mly"
       (int)
# 1940 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (i : (
# 22 "parser.mly"
       (int)
# 1948 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 136 "parser.mly"
              ( Int i )
# 1953 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | DEBUG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | DEREF ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | ID _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | IF ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | ISZERO ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | LET ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | LETREC ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | NEWREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 1999 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (x : (
# 23 "parser.mly"
       (string)
# 2007 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 137 "parser.mly"
             ( Var x )
# 2012 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

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
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | DEBUG ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | DEREF ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | INT _v ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | ISZERO ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | LET ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | LETREC ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | NEWREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState30
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

and _menhir_run31 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.expr) = 
# 156 "parser.mly"
            ( Debug )
# 2074 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run32 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | DEBUG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | DEREF ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | ID _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | IF ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState32 _v
    | ISZERO ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | LET ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | LETREC ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | NEWREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState32
    | END ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState32 in
        let _v : (Ast.expr list) = 
# 142 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [] )
# 2118 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState32

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
# 75 "parser.mly"
       (Ast.prog)
# 2141 "parser.ml"
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
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DEBUG ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DEREF ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ID _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run26 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | ISZERO ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LET ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LETREC ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NEWREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState0
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
  

# 2191 "parser.ml"
