
module MenhirBasics = struct
  
  exception Error
  
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
    | INT of (
# 22 "parser.mly"
       (int)
# 27 "parser.ml"
  )
    | INSR
    | IN
    | IF
    | ID of (
# 23 "parser.mly"
       (string)
# 35 "parser.ml"
  )
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
  | MenhirState103
  | MenhirState101
  | MenhirState97
  | MenhirState93
  | MenhirState82
  | MenhirState76
  | MenhirState72
  | MenhirState70
  | MenhirState67
  | MenhirState65
  | MenhirState59
  | MenhirState55
  | MenhirState51
  | MenhirState48
  | MenhirState46
  | MenhirState44
  | MenhirState41
  | MenhirState39
  | MenhirState37
  | MenhirState35
  | MenhirState33
  | MenhirState30
  | MenhirState27
  | MenhirState26
  | MenhirState23
  | MenhirState21
  | MenhirState19
  | MenhirState16
  | MenhirState15
  | MenhirState14
  | MenhirState12
  | MenhirState10
  | MenhirState8
  | MenhirState6
  | MenhirState4
  | MenhirState2
  | MenhirState0

# 8 "parser.mly"
  
open Ast

# 106 "parser.ml"

let rec _menhir_run41 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ABS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | APPEND ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | CONS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | COUNT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | EMPTYLIST ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | HD ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | ID _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | IF ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | INSR ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | INT _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState41 _v
    | INTERSECTION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | ISZERO ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | LET ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | LPAREN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | NULL ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | REMOVEDUP ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | REMV ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | REPETITION ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | REPLACE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | REVERSE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | TL ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState41
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState41

and _menhir_run44 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ABS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | APPEND ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | CONS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | COUNT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | EMPTYLIST ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | HD ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | ID _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | IF ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | INSR ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | INT _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState44 _v
    | INTERSECTION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | ISZERO ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | LET ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | LPAREN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | NULL ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | REMOVEDUP ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | REMV ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | REPETITION ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | REPLACE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | REVERSE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | TL ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState44
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState44

and _menhir_run48 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ABS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | APPEND ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | CONS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | COUNT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | EMPTYLIST ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | HD ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | ID _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | IF ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | INSR ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | INT _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState48 _v
    | INTERSECTION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | ISZERO ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | LET ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | LPAREN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | NULL ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | REMOVEDUP ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | REMV ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | REPETITION ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | REPLACE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | REVERSE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | TL ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState48
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState48

and _menhir_run46 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ABS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | APPEND ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | CONS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | COUNT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | EMPTYLIST ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | HD ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | ID _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | IF ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | INSR ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | INT _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | INTERSECTION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | ISZERO ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | LET ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | LPAREN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | NULL ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | REMOVEDUP ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | REMV ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | REPETITION ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | REPLACE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | REVERSE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | TL ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState39 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 146 "parser.mly"
                                    ( Abs(e) )
# 342 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 142 "parser.mly"
                                  ( Mul(e1,e2) )
# 361 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | ELSE | EOF | IN | MINUS | PLUS | RPAREN | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 140 "parser.mly"
                                 ( Add(e1,e2) )
# 380 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 143 "parser.mly"
                                    ( Div(e1,e2) )
# 397 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | ELSE | EOF | IN | MINUS | PLUS | RPAREN | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 141 "parser.mly"
                                  ( Sub(e1,e2) )
# 416 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState37 ->
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
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | APPEND ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | CONS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | COUNT ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | EMPTYLIST ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | HD ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | INSR ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
            | INTERSECTION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | ISZERO ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | LET ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | LPAREN ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | NULL ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | REMOVEDUP ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | REMV ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | REPETITION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | REPLACE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | REVERSE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState51
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51)
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
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
# 152 "parser.mly"
                                                          ( Append(e1, e2) )
# 518 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState35 ->
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
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | APPEND ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | CONS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | COUNT ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | EMPTYLIST ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | HD ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | INSR ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
            | INTERSECTION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | ISZERO ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | LET ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | LPAREN ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | NULL ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | REMOVEDUP ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | REMV ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | REPETITION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | REPLACE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | REVERSE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState55
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55)
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
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
# 151 "parser.mly"
                                                        ( Cons(e1, e2) )
# 622 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
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
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ABS ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | APPEND ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | CONS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | COUNT ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | EMPTYLIST ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | HD ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | INSR ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
            | INTERSECTION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | ISZERO ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | LET ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | LPAREN ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | NULL ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | REMOVEDUP ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | REMV ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | REPETITION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | REPLACE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | REVERSE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState59
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59)
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
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
# 155 "parser.mly"
                                                         ( Count(e1, e2) )
# 726 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState30 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 148 "parser.mly"
                                   ( Hd(e) )
# 759 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ABS ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | APPEND ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | CONS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | COUNT ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | EMPTYLIST ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | HD ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | INSR ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState65 _v
            | INTERSECTION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | ISZERO ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | LET ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | LPAREN ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | NULL ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | REMOVEDUP ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | REMV ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | REPETITION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | REPLACE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | REVERSE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState65
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState65)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ABS ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | APPEND ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | CONS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | COUNT ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | EMPTYLIST ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | HD ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | INSR ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState67 _v
            | INTERSECTION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | ISZERO ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | LET ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | LPAREN ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | NULL ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | REMOVEDUP ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | REMV ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | REPETITION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | REPLACE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | REVERSE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState67
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState67)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | ELSE | EOF | IN | RPAREN | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))), _, (e3 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 161 "parser.mly"
                                                      ( ITE(e1,e2,e3) )
# 932 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState26 ->
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
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | APPEND ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | CONS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | COUNT ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | EMPTYLIST ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | HD ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | INSR ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState70 _v
            | INTERSECTION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | ISZERO ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | LET ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | LPAREN ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | NULL ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | REMOVEDUP ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | REMV ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | REPETITION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | REPLACE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | REVERSE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState70
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState70)
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState70 ->
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
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | APPEND ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | CONS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | COUNT ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | EMPTYLIST ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | HD ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | INSR ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState72 _v
            | INTERSECTION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | ISZERO ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | LET ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | LPAREN ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | NULL ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | REMOVEDUP ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | REMV ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | REPETITION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | REPLACE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | REVERSE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState72
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState72)
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState72 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))), _, (e3 : (Ast.expr))) = _menhir_stack in
            let _8 = () in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 153 "parser.mly"
                                                                          ( Insr(e1, e2, e3) )
# 1105 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState23 ->
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
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | APPEND ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | CONS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | COUNT ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | EMPTYLIST ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | HD ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | INSR ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
            | INTERSECTION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | ISZERO ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | LET ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | LPAREN ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | NULL ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | REMOVEDUP ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | REMV ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | REPETITION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | REPLACE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | REVERSE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState76
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76)
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState76 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
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
# 160 "parser.mly"
                                                                ( Intersection(e1, e2) )
# 1209 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 145 "parser.mly"
                                       ( IsZero(e) )
# 1242 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
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
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ABS ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | APPEND ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | CONS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | COUNT ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | EMPTYLIST ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | HD ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | INSR ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
            | INTERSECTION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | ISZERO ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | LET ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | LPAREN ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | NULL ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | REMOVEDUP ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | REMV ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | REPETITION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | REPLACE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | REVERSE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState82
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | COMMA | ELSE | EOF | IN | RPAREN | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 1341 "parser.ml"
            ))), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 144 "parser.mly"
                                                    ( Let(x,e1,e2) )
# 1349 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
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
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 164 "parser.mly"
                                      ( Sub(Int 0, e) )
# 1380 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 162 "parser.mly"
                               (e)
# 1412 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState14 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 150 "parser.mly"
                                     ( Null(e) )
# 1445 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 159 "parser.mly"
                                          ( Remove_dup(e) )
# 1478 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState10 ->
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
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | APPEND ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | CONS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | COUNT ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | EMPTYLIST ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | HD ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | INSR ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState93 _v
            | INTERSECTION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | ISZERO ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | LET ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | LPAREN ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | NULL ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | REMOVEDUP ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | REMV ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | REPETITION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | REPLACE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | REVERSE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState93
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState93)
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState93 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
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
# 154 "parser.mly"
                                                        ( Remv(e1, e2) )
# 1582 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState8 ->
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
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | APPEND ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | CONS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | COUNT ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | EMPTYLIST ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | HD ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | INSR ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState97 _v
            | INTERSECTION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | ISZERO ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | LET ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | LPAREN ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | NULL ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | REMOVEDUP ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | REMV ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | REPETITION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | REPLACE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | REVERSE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState97
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97)
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState97 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
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
# 158 "parser.mly"
                                                              ( Repetition(e1, e2) )
# 1686 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
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
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | ABS ->
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | APPEND ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | CONS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | COUNT ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | EMPTYLIST ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | HD ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | INSR ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
            | INTERSECTION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | ISZERO ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | LET ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | LPAREN ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | NULL ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | REMOVEDUP ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | REMV ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | REPETITION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | REPLACE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | REVERSE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState101
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101)
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState101 ->
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
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | APPEND ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | CONS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | COUNT ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | EMPTYLIST ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | HD ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | INSR ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
            | INTERSECTION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | ISZERO ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | LET ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | LPAREN ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | NULL ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | REMOVEDUP ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | REMV ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | REPETITION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | REPLACE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | REVERSE ->
                _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | TL ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103)
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState103 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))), _, (e3 : (Ast.expr))) = _menhir_stack in
            let _8 = () in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 157 "parser.mly"
                                                                             ( Replace(e1,e2,e3) )
# 1861 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
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
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 156 "parser.mly"
                                        ( Reverse(e) )
# 1894 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
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
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 149 "parser.mly"
                                   ( Tl(e) )
# 1927 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
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
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack)
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 77 "parser.mly"
       (Ast.expr)
# 1953 "parser.ml"
            ) = 
# 109 "parser.mly"
                    ( e )
# 1957 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 77 "parser.mly"
       (Ast.expr)
# 1964 "parser.ml"
            )) = _v in
            Obj.magic _1
        | MINUS ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack)
        | PLUS ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState103 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState101 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState97 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState93 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState76 ->
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
    | MenhirState67 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState65 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState59 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState48 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState46 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState44 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState41 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
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
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState33 ->
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
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState21 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState16 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
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
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState8 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState6 ->
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
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState2
        | REVERSE ->
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
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState4 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | REVERSE ->
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
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ABS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState6 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | REVERSE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | TL ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState6
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState6)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState8 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | REVERSE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | TL ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState8
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState8)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | REVERSE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | TL ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState10)
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
        | ABS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | REVERSE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | TL ->
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
    | LPAREN ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ABS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState14 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | REVERSE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState14
        | TL ->
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
    | ABS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | APPEND ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | CONS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | COUNT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | EMPTYLIST ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | HD ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | ID _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | IF ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | INSR ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | INT _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
    | INTERSECTION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | ISZERO ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | LET ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | LPAREN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | MINUS ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState15 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ABS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState16 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | REVERSE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | TL ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState16
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState16)
    | NULL ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | REMOVEDUP ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | REMV ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | REPETITION ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | REPLACE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | REVERSE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | TL ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState15
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15

and _menhir_run17 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
                _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | APPEND ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | CONS ->
                _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | COUNT ->
                _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | EMPTYLIST ->
                _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | HD ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | ID _v ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | IF ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | INSR ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | INT _v ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState19 _v
            | INTERSECTION ->
                _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | ISZERO ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | LET ->
                _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | LPAREN ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | NULL ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | REMOVEDUP ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | REMV ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | REPETITION ->
                _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | REPLACE ->
                _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | REVERSE ->
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
            let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
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
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState21
        | REVERSE ->
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

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState23 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | REVERSE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | TL ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 22 "parser.mly"
       (int)
# 2892 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (i : (
# 22 "parser.mly"
       (int)
# 2900 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 138 "parser.mly"
              ( Int i )
# 2905 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

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
        | ABS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState26 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | REVERSE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | TL ->
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

and _menhir_run27 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | ABS ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | APPEND ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | CONS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | COUNT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | EMPTYLIST ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | HD ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | ID _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | IF ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | INSR ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | INT _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState27 _v
    | INTERSECTION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | ISZERO ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | LET ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | LPAREN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | NULL ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | REMOVEDUP ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | REMV ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | REPETITION ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | REPLACE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | REVERSE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | TL ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 3029 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (x : (
# 23 "parser.mly"
       (string)
# 3037 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 139 "parser.mly"
             ( Var x )
# 3042 "parser.ml"
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
        | ABS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState30 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | REVERSE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState30
        | TL ->
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
# 147 "parser.mly"
                ( EmptyList )
# 3118 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run32 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState33 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | REVERSE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | TL ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState33
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState33)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

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
        | ABS ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | REVERSE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState35
        | TL ->
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
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | REVERSE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | TL ->
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

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | APPEND ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | CONS ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | COUNT ->
            _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | EMPTYLIST ->
            _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | HD ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | ID _v ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | IF ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | INSR ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | INT _v ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState39 _v
        | INTERSECTION ->
            _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | ISZERO ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | LET ->
            _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | LPAREN ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | NULL ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | REMOVEDUP ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | REMV ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | REPETITION ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | REPLACE ->
            _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | REVERSE ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | TL ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState39
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState39)
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
# 77 "parser.mly"
       (Ast.expr)
# 3393 "parser.ml"
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
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | APPEND ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | CONS ->
        _menhir_run34 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | COUNT ->
        _menhir_run32 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EMPTYLIST ->
        _menhir_run31 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | HD ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ID _v ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INSR ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | INTERSECTION ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ISZERO ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LET ->
        _menhir_run17 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LPAREN ->
        _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NULL ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | REMOVEDUP ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | REMV ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | REPETITION ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | REPLACE ->
        _menhir_run5 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | REVERSE ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | TL ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 233 "/home/alcy/.opam/system/lib/menhir/standard.mly"
  

# 3457 "parser.ml"
