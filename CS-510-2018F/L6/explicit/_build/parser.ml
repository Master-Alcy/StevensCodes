
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
  | MenhirState80
  | MenhirState77
  | MenhirState76
  | MenhirState75
  | MenhirState74
  | MenhirState72
  | MenhirState70
  | MenhirState68
  | MenhirState66
  | MenhirState64
  | MenhirState63
  | MenhirState62
  | MenhirState61
  | MenhirState60
  | MenhirState59
  | MenhirState58
  | MenhirState56
  | MenhirState55
  | MenhirState54
  | MenhirState53
  | MenhirState52
  | MenhirState51
  | MenhirState49
  | MenhirState48
  | MenhirState47
  | MenhirState45
  | MenhirState44
  | MenhirState43
  | MenhirState41
  | MenhirState39
  | MenhirState38
  | MenhirState33
  | MenhirState31
  | MenhirState28
  | MenhirState26
  | MenhirState24
  | MenhirState21
  | MenhirState15
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
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Ast.expr list)) = _v in
        let _v : (Ast.expr list) = 
# 144 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x )
# 127 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState41 ->
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

and _menhir_run39 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | DEBUG ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | DEREF ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | ID _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | IF ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
    | ISZERO ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | LET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | LETREC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | NEWREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState39
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39

and _menhir_run43 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | DEBUG ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | DEREF ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | ID _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | IF ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | ISZERO ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | LET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | LETREC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | NEWREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState43
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
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | DEBUG ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | DEREF ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | ID _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | IF ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
    | ISZERO ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | LET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | LETREC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState47
    | NEWREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState47
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

and _menhir_run45 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | DEBUG ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | DEREF ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | ID _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | IF ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
    | ISZERO ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | LET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | LETREC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | NEWREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState45
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState41 | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState38
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState38 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | DEBUG ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | DEREF ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | ID _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
            | IF ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | INT _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
            | ISZERO ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | LET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | LETREC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | NEWREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41)
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState38
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState38)
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 142 "parser.mly"
                                  ( Mul(e1,e2) )
# 378 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState44
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | MINUS | NEWREF | PLUS | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 140 "parser.mly"
                                 ( Add(e1,e2) )
# 397 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44)
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 143 "parser.mly"
                                    ( Div(e1,e2) )
# 412 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState48
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | MINUS | NEWREF | PLUS | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 141 "parser.mly"
                                  ( Sub(e1,e2) )
# 431 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48)
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState49 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 150 "parser.mly"
                                      ( DeRef(e) )
# 461 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49)
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState51 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | DEBUG ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | DEREF ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | ID _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
            | IF ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | INT _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState52 _v
            | ISZERO ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | LET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | LETREC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | NEWREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState52
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState52)
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51)
    | MenhirState52 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState53 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | DEBUG ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | DEREF ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | ID _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
            | IF ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | INT _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState54 _v
            | ISZERO ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | LET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | LETREC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | NEWREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState54
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState54)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53)
    | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | BEGIN | COMMA | DEBUG | DEREF | ELSE | END | EOF | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))), _), _, (e3 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 152 "parser.mly"
                                                      ( ITE(e1,e2,e3) )
# 604 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55)
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState56 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 148 "parser.mly"
                                       ( IsZero(e) )
# 634 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState56
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56)
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState58 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | DEBUG ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | DEREF ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | ID _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | IF ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | INT _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | ISZERO ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | LET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | LETREC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | NEWREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState59
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
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState58
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState58
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
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState60
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState60
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
# 144 "parser.mly"
                                                    ( Let(x,e1,e2) )
# 725 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState60)
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState61 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | DEBUG ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | DEREF ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | ID _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | IF ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | INT _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState62 _v
            | ISZERO ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | LET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | LETREC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | NEWREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState62
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState62)
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState61
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState61
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
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState63
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState63
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
# 145 "parser.mly"
                                                                               ( Letrec(x,y,e1,e2) )
# 820 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63)
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState64 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 157 "parser.mly"
                                      ( Sub(Int 0, e) )
# 850 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState64
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState64)
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | DEBUG ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | DEREF ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | ID _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | IF ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | INT _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
        | ISZERO ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | LET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | LETREC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | NEWREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | PROC ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState66 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 155 "parser.mly"
                               (e)
# 905 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | SET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | SETREF ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState66
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66)
    | MenhirState66 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState68 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 147 "parser.mly"
                                           ( App(e1,e2) )
# 940 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68)
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState70 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 149 "parser.mly"
                                       ( NewRef(e) )
# 972 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState70
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70)
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | RBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState72 in
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
# 146 "parser.mly"
                                                             ( Proc(x,e) )
# 1010 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState72
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72)
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState74
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState74
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
# 153 "parser.mly"
                                    ( Set(x,e) )
# 1044 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState74)
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState75 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | DEBUG ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | DEREF ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | ID _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
            | IF ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | INT _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
            | ISZERO ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | LET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | LETREC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | NEWREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76)
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState75
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75)
    | MenhirState76 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState77 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 151 "parser.mly"
                                                          ( SetRef(e1,e2) )
# 1131 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState77
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState77)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run45 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState80 in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 76 "parser.mly"
       (Ast.prog)
# 1156 "parser.ml"
            ) = 
# 108 "parser.mly"
                 ( AProg e )
# 1160 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 76 "parser.mly"
       (Ast.prog)
# 1167 "parser.ml"
            )) = _v in
            Obj.magic _1
        | MINUS ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | PLUS ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | TIMES ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80)
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
    
# 162 "parser.mly"
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
# 154 "parser.mly"
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
    | MenhirState80 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState77 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState76 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState75 ->
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
    | MenhirState66 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState64 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
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
    | MenhirState56 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState54 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState52 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
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
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState43 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState38 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
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
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | DEBUG ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | DEREF ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | ID _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | IF ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | INT _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | ISZERO ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LETREC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState2
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
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | DEBUG ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | DEREF ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | ID _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
            | IF ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | INT _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
            | ISZERO ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | LET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState5
            | LETREC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState5
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
                        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | DEBUG ->
                        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | DEREF ->
                        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | ID _v ->
                        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
                    | IF ->
                        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | INT _v ->
                        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
                    | ISZERO ->
                        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | LET ->
                        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState10
                    | LETREC ->
                        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState10
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
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | DEBUG ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | DEREF ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | ID _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | IF ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | INT _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | ISZERO ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LETREC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState12
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
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | DEBUG ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | DEREF ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | ID _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | IF ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | ISZERO ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | LET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | LETREC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState13
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
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | DEBUG ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | DEREF ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | ID _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | IF ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | INT _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
        | ISZERO ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | LET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | LETREC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState15
        | NEWREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState15
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
    | NEWREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | RPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState13 in
        let _menhir_env = _menhir_discard _menhir_env in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        let _2 = () in
        let _1 = () in
        let _v : (Ast.expr) = 
# 158 "parser.mly"
                     ( Unit )
# 1731 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run16 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
                            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState21
                        | DEBUG ->
                            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState21
                        | DEREF ->
                            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState21
                        | ID _v ->
                            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
                        | IF ->
                            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState21
                        | INT _v ->
                            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
                        | ISZERO ->
                            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState21
                        | LET ->
                            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState21
                        | LETREC ->
                            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState21
                        | LPAREN ->
                            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState21
                        | NEWREF ->
                            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState21
                        | PROC ->
                            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState21
                        | SET ->
                            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState21
                        | SETREF ->
                            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState21
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21)
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

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
                _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | DEBUG ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | DEREF ->
                _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | ID _v ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
            | IF ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | INT _v ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState24 _v
            | ISZERO ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | LET ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | LETREC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | LPAREN ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | NEWREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | PROC ->
                _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | SET ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | SETREF ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState24
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24)
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

and _menhir_run25 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | DEBUG ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | DEREF ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | ID _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | IF ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | INT _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | ISZERO ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | LET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | LETREC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | NEWREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | PROC ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | SET ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | SETREF ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 22 "parser.mly"
       (int)
# 1954 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (i : (
# 22 "parser.mly"
       (int)
# 1962 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 137 "parser.mly"
              ( Int i )
# 1967 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | DEBUG ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | DEREF ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | ID _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | IF ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | ISZERO ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | LET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | LETREC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | NEWREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28

and _menhir_run29 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 2013 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (x : (
# 23 "parser.mly"
       (string)
# 2021 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 138 "parser.mly"
             ( Var x )
# 2026 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

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
            _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | DEBUG ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | DEREF ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | ID _v ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | IF ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | INT _v ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
        | ISZERO ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | LET ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | LETREC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | LPAREN ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState31
        | NEWREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState31
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

and _menhir_run32 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.expr) = 
# 139 "parser.mly"
            ( Debug )
# 2088 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run33 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | DEBUG ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | DEREF ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | ID _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | IF ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
    | ISZERO ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | LET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | LETREC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | LPAREN ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | NEWREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | PROC ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | SET ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | SETREF ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState33
    | END ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState33 in
        let _v : (Ast.expr list) = 
# 142 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [] )
# 2132 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33

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
# 2155 "parser.ml"
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
        _menhir_run33 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DEBUG ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DEREF ->
        _menhir_run30 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ID _v ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | ISZERO ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LET ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LETREC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState0
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
  

# 2205 "parser.ml"
