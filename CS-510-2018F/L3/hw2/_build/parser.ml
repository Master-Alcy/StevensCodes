
module MenhirBasics = struct
  
  exception Error
  
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
    | INT of (
# 22 "parser.mly"
       (int)
# 21 "parser.ml"
  )
    | IN
    | IF
    | ID of (
# 23 "parser.mly"
       (string)
# 28 "parser.ml"
  )
    | HD
    | EQUALS
    | EOF
    | EMPTYLIST
    | ELSE
    | DIVIDED
    | CONS
    | COMMA
    | ABS
  
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
  | MenhirState46
  | MenhirState41
  | MenhirState39
  | MenhirState33
  | MenhirState30
  | MenhirState28
  | MenhirState26
  | MenhirState23
  | MenhirState21
  | MenhirState19
  | MenhirState16
  | MenhirState13
  | MenhirState11
  | MenhirState9
  | MenhirState6
  | MenhirState5
  | MenhirState4
  | MenhirState2
  | MenhirState0

# 8 "parser.mly"
  
open Ast

# 79 "parser.ml"

let rec _menhir_run23 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ABS ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | CONS ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | EMPTYLIST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | HD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | ID _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | IF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | INT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
    | ISZERO ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | LPAREN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | NULL ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | TL ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run26 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ABS ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | CONS ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | EMPTYLIST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | HD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | ID _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | IF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | INT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
    | ISZERO ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | LPAREN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | NULL ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | TL ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState26
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState26

and _menhir_run30 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ABS ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | CONS ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | EMPTYLIST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | HD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | ID _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | IF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | INT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
    | ISZERO ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | LPAREN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | NULL ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | TL ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState30
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState30

and _menhir_run28 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ABS ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | CONS ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | EMPTYLIST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | HD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | ID _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | IF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | INT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState28 _v
    | ISZERO ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | LPAREN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | NULL ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | TL ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState28
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState28

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 137 "parser.mly"
                                    ( Abs(e) )
# 243 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 133 "parser.mly"
                                  ( Mul(e1,e2) )
# 262 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | ELSE | EOF | IN | MINUS | PLUS | RPAREN | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 131 "parser.mly"
                                 ( Add(e1,e2) )
# 281 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 134 "parser.mly"
                                    ( Div(e1,e2) )
# 298 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | ELSE | EOF | IN | MINUS | PLUS | RPAREN | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 132 "parser.mly"
                                  ( Sub(e1,e2) )
# 317 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ABS ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState33
            | CONS ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState33
            | EMPTYLIST ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState33
            | HD ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState33
            | ID _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
            | IF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState33
            | INT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
            | ISZERO ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState33
            | LET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState33
            | LPAREN ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState33
            | NULL ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState33
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState33
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33)
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 142 "parser.mly"
                                                        ( Cons(e1, e2) )
# 401 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 139 "parser.mly"
                                   ( Hd(e) )
# 434 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ABS ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | CONS ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | EMPTYLIST ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | HD ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | ID _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
            | IF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | INT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
            | ISZERO ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | LET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | LPAREN ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | NULL ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState39
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39)
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ABS ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | CONS ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | EMPTYLIST ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | HD ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | ID _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
            | IF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | INT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
            | ISZERO ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | LET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | LPAREN ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | NULL ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState41
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41)
        | MINUS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | ELSE | EOF | IN | RPAREN | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))), _, (e3 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 143 "parser.mly"
                                                      ( ITE(e1,e2,e3) )
# 571 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 136 "parser.mly"
                                       ( IsZero(e) )
# 602 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ABS ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | CONS ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | EMPTYLIST ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | HD ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | ID _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | IF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | INT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
            | ISZERO ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | LET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | LPAREN ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | NULL ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState46
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46)
        | MINUS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | ELSE | EOF | IN | RPAREN | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 683 "parser.ml"
            ))), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 135 "parser.mly"
                                                    ( Let(x,e1,e2) )
# 691 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 146 "parser.mly"
                                      ( Sub(Int 0, e) )
# 722 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 144 "parser.mly"
                               (e)
# 754 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 141 "parser.mly"
                                     ( Null(e) )
# 787 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState2 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 140 "parser.mly"
                                   ( Tl(e) )
# 820 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | DIVIDED ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 68 "parser.mly"
       (Ast.expr)
# 846 "parser.ml"
            ) = 
# 100 "parser.mly"
                    ( e )
# 850 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 68 "parser.mly"
       (Ast.expr)
# 857 "parser.ml"
            )) = _v in
            Obj.magic _1
        | MINUS ->
            _menhir_run30 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run26 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState33 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState28 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState13 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState11 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState9 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState5 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState4 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
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
        | ABS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | CONS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | EMPTYLIST ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | HD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | ID _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | IF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | INT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | ISZERO ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LPAREN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | NULL ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | TL ->
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
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ABS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | CONS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | EMPTYLIST ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | HD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | ID _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
        | IF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | INT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
        | ISZERO ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | LPAREN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | NULL ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | TL ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run5 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ABS ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | CONS ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | EMPTYLIST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | HD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | ID _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | IF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | INT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState5 _v
    | ISZERO ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | LPAREN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | MINUS ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState5 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ABS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | CONS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | EMPTYLIST ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | HD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | ID _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | IF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | INT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | ISZERO ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | LPAREN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | NULL ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | TL ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6)
    | NULL ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | TL ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState5
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            | ABS ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | CONS ->
                _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | EMPTYLIST ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | HD ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | ID _v ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
            | IF ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | INT _v ->
                _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState9 _v
            | ISZERO ->
                _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | LET ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | LPAREN ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | NULL ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState9
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState9
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
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
        | ABS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | CONS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | EMPTYLIST ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | HD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | ID _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | IF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | INT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState11 _v
        | ISZERO ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | LPAREN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | NULL ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | TL ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState11
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState11)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run12 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 22 "parser.mly"
       (int)
# 1221 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (i : (
# 22 "parser.mly"
       (int)
# 1229 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 129 "parser.mly"
              ( Int i )
# 1234 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run13 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ABS ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | CONS ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | EMPTYLIST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | HD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | ID _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | IF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | INT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState13 _v
    | ISZERO ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | LPAREN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | NULL ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | TL ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState13
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState13

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 1276 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (x : (
# 23 "parser.mly"
       (string)
# 1284 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 130 "parser.mly"
             ( Var x )
# 1289 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

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
        | ABS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | CONS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | EMPTYLIST ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | HD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | ID _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
        | IF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | INT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
        | ISZERO ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | LPAREN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | NULL ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | TL ->
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
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.expr) = 
# 138 "parser.mly"
                ( EmptyList )
# 1347 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

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
        | ABS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | CONS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | EMPTYLIST ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | HD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | ID _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
        | IF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | INT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
        | ISZERO ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | LPAREN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | NULL ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | TL ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState19
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
        | ABS ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | CONS ->
            _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | EMPTYLIST ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | HD ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | ID _v ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | IF ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | INT _v ->
            _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | ISZERO ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | LET ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | LPAREN ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | NULL ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | TL ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

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
# 68 "parser.mly"
       (Ast.expr)
# 1458 "parser.ml"
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
    | ABS ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | CONS ->
        _menhir_run18 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EMPTYLIST ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | HD ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ID _v ->
        _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run12 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | ISZERO ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LET ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LPAREN ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NULL ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | TL ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 233 "/home/alcy/.opam/system/lib/menhir/standard.mly"
  

# 1504 "parser.ml"
