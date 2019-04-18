
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | UNPAIR
    | UNITTYPE
    | UNIT
    | TREETYPE
    | TL
    | TIMES
    | THEN
    | SETREF
    | SET
    | SEMICOLON
    | RPAREN
    | REFTYPE
    | RBRACE
    | PROC
    | PLUS
    | PAIR
    | NULL_QUESTION
    | NULLT_QUESTION
    | NODE
    | NEWREF
    | MINUS
    | LPAREN
    | LISTTYPE
    | LETREC
    | LET
    | LESS_THAN
    | LBRACE
    | ISZERO
    | INTTYPE
    | INT of (
# 22 "parser.mly"
       (int)
# 40 "parser.ml"
  )
    | IN
    | IF
    | ID of (
# 23 "parser.mly"
       (string)
# 47 "parser.ml"
  )
    | HD
    | GREATER_THAN
    | GETRST
    | GETLST
    | GETDATA
    | EQUALS
    | EOF
    | END
    | EMPTYTREE
    | EMPTYLIST
    | ELSE
    | DIVIDED
    | DEREF
    | DEBUG
    | CONS
    | COMMA
    | COLON
    | BOOLTYPE
    | BEGIN
    | ARROW
  
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
  | MenhirState170
  | MenhirState168
  | MenhirState167
  | MenhirState166
  | MenhirState164
  | MenhirState162
  | MenhirState161
  | MenhirState160
  | MenhirState159
  | MenhirState157
  | MenhirState155
  | MenhirState154
  | MenhirState153
  | MenhirState151
  | MenhirState149
  | MenhirState147
  | MenhirState146
  | MenhirState145
  | MenhirState144
  | MenhirState143
  | MenhirState141
  | MenhirState139
  | MenhirState137
  | MenhirState135
  | MenhirState134
  | MenhirState133
  | MenhirState132
  | MenhirState131
  | MenhirState130
  | MenhirState129
  | MenhirState127
  | MenhirState126
  | MenhirState125
  | MenhirState124
  | MenhirState123
  | MenhirState122
  | MenhirState120
  | MenhirState118
  | MenhirState116
  | MenhirState114
  | MenhirState112
  | MenhirState110
  | MenhirState109
  | MenhirState108
  | MenhirState107
  | MenhirState106
  | MenhirState104
  | MenhirState103
  | MenhirState102
  | MenhirState100
  | MenhirState98
  | MenhirState97
  | MenhirState92
  | MenhirState91
  | MenhirState88
  | MenhirState85
  | MenhirState83
  | MenhirState82
  | MenhirState80
  | MenhirState78
  | MenhirState76
  | MenhirState73
  | MenhirState71
  | MenhirState69
  | MenhirState66
  | MenhirState63
  | MenhirState58
  | MenhirState57
  | MenhirState56
  | MenhirState55
  | MenhirState53
  | MenhirState51
  | MenhirState49
  | MenhirState47
  | MenhirState45
  | MenhirState34
  | MenhirState31
  | MenhirState27
  | MenhirState26
  | MenhirState24
  | MenhirState23
  | MenhirState22
  | MenhirState19
  | MenhirState15
  | MenhirState12
  | MenhirState10
  | MenhirState7
  | MenhirState0

# 8 "parser.mly"
  
open Ast

# 178 "parser.ml"

let rec _menhir_run34 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.texpr) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLTYPE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | INTTYPE ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | LESS_THAN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | LISTTYPE ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | LPAREN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | REFTYPE ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | TREETYPE ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | UNITTYPE ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState34
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34

and _menhir_goto_texpr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.texpr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | TIMES ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BOOLTYPE ->
                _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | INTTYPE ->
                _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | LESS_THAN ->
                _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | LISTTYPE ->
                _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | LPAREN ->
                _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | REFTYPE ->
                _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | TREETYPE ->
                _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | UNITTYPE ->
                _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState31
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | GREATER_THAN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (t1 : (Ast.texpr))), _, (t2 : (Ast.texpr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.texpr) = 
# 216 "parser.mly"
                                                             ( PairType(t1, t2) )
# 266 "parser.ml"
             in
            _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | BEGIN | COMMA | CONS | DEBUG | DEREF | DIVIDED | ELSE | EMPTYLIST | EMPTYTREE | END | EOF | GETDATA | GETLST | GETRST | GREATER_THAN | HD | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | MINUS | NEWREF | NODE | NULLT_QUESTION | NULL_QUESTION | PAIR | PLUS | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TIMES | TL | UNIT | UNPAIR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s, (t1 : (Ast.texpr))), _, (t2 : (Ast.texpr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.texpr) = 
# 210 "parser.mly"
                                    ( FuncType(t1,t2) )
# 289 "parser.ml"
             in
            _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v
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
        | ARROW ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (t : (Ast.texpr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.texpr) = 
# 218 "parser.mly"
                                          ( ListType(t) )
# 316 "parser.ml"
             in
            _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (t1 : (Ast.texpr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.texpr) = 
# 211 "parser.mly"
                                 ( t1 )
# 342 "parser.ml"
             in
            _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v
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
        | ARROW ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | BEGIN | COMMA | CONS | DEBUG | DEREF | DIVIDED | ELSE | EMPTYLIST | EMPTYTREE | END | EOF | GETDATA | GETLST | GETRST | GREATER_THAN | HD | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | MINUS | NEWREF | NODE | NULLT_QUESTION | NULL_QUESTION | PAIR | PLUS | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TIMES | TL | UNIT | UNPAIR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (t1 : (Ast.texpr))) = _menhir_stack in
            let _1 = () in
            let _v : (Ast.texpr) = 
# 212 "parser.mly"
                          ( RefType(t1) )
# 365 "parser.ml"
             in
            _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (t : (Ast.texpr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.texpr) = 
# 220 "parser.mly"
                                          ( TreeType(t) )
# 392 "parser.ml"
             in
            _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v
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
        | ARROW ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
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
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | CONS ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | DEBUG ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | DEREF ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | EMPTYLIST ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | EMPTYTREE ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | GETDATA ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | GETLST ->
                    _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | GETRST ->
                    _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | HD ->
                    _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | ID _v ->
                    _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
                | IF ->
                    _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | INT _v ->
                    _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
                | ISZERO ->
                    _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | LET ->
                    _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | LETREC ->
                    _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | LPAREN ->
                    _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | NEWREF ->
                    _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | NODE ->
                    _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | NULLT_QUESTION ->
                    _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | NULL_QUESTION ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | PAIR ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | PROC ->
                    _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | SET ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | SETREF ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | TL ->
                    _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | UNIT ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | UNPAIR ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState45
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45)
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
    | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
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
                    | COLON ->
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let _menhir_env = _menhir_discard _menhir_env in
                        let _tok = _menhir_env._menhir_token in
                        (match _tok with
                        | BOOLTYPE ->
                            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                        | INTTYPE ->
                            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                        | LESS_THAN ->
                            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                        | LISTTYPE ->
                            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                        | LPAREN ->
                            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                        | REFTYPE ->
                            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                        | TREETYPE ->
                            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                        | UNITTYPE ->
                            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState63
                        | _ ->
                            assert (not _menhir_env._menhir_error);
                            _menhir_env._menhir_error <- true;
                            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let _menhir_stack = Obj.magic _menhir_stack in
                        let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let _menhir_stack = Obj.magic _menhir_stack in
                    let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let _menhir_stack = Obj.magic _menhir_stack in
                let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
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
                    _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | CONS ->
                    _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | DEBUG ->
                    _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | DEREF ->
                    _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | EMPTYLIST ->
                    _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | EMPTYTREE ->
                    _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | GETDATA ->
                    _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | GETLST ->
                    _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | GETRST ->
                    _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | HD ->
                    _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | ID _v ->
                    _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
                | IF ->
                    _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | INT _v ->
                    _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState66 _v
                | ISZERO ->
                    _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | LET ->
                    _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | LETREC ->
                    _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | LPAREN ->
                    _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | NEWREF ->
                    _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | NODE ->
                    _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | NULLT_QUESTION ->
                    _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | NULL_QUESTION ->
                    _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | PAIR ->
                    _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | PROC ->
                    _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | SET ->
                    _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | SETREF ->
                    _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | TL ->
                    _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | UNIT ->
                    _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | UNPAIR ->
                    _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState66
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState66)
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
    | MenhirState83 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | BEGIN | COMMA | CONS | DEBUG | DEREF | DIVIDED | ELSE | EMPTYLIST | EMPTYTREE | END | EOF | GETDATA | GETLST | GETRST | HD | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | MINUS | NEWREF | NODE | NULLT_QUESTION | NULL_QUESTION | PAIR | PLUS | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TIMES | TL | UNIT | UNPAIR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (t : (Ast.texpr))) = _menhir_stack in
            let _1 = () in
            let _v : (Ast.expr) = 
# 196 "parser.mly"
                           ( EmptyTree(t) )
# 666 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | MenhirState85 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | ARROW ->
            _menhir_run34 _menhir_env (Obj.magic _menhir_stack)
        | BEGIN | COMMA | CONS | DEBUG | DEREF | DIVIDED | ELSE | EMPTYLIST | EMPTYTREE | END | EOF | GETDATA | GETLST | GETRST | HD | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | MINUS | NEWREF | NODE | NULLT_QUESTION | NULL_QUESTION | PAIR | PLUS | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TIMES | TL | UNIT | UNPAIR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (t : (Ast.texpr))) = _menhir_stack in
            let _1 = () in
            let _v : (Ast.expr) = 
# 190 "parser.mly"
                           ( EmptyList(t) )
# 689 "parser.ml"
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

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr list) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState92 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (x : (Ast.expr list)) = _v in
        let _v : (Ast.expr list) = 
# 144 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x )
# 716 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ _menhir_env _menhir_stack _menhir_s _v
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (xs : (Ast.expr list)) = _v in
        let ((_menhir_stack, _menhir_s, (x : (Ast.expr))), _) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr list) = 
# 231 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( x :: xs )
# 728 "parser.ml"
         in
        _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        _menhir_fail ()

and _menhir_run98 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | CONS ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | EMPTYLIST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | EMPTYTREE ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | GETDATA ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | GETLST ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | GETRST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | HD ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | ID _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
    | IF ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | INT _v ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState98 _v
    | ISZERO ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | LET ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | LETREC ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | LPAREN ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | NEWREF ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | NODE ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | NULLT_QUESTION ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | NULL_QUESTION ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | PAIR ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | PROC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | SET ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | SETREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | TL ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | UNIT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | UNPAIR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState98
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState98

and _menhir_run102 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | CONS ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | EMPTYLIST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | EMPTYTREE ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | GETDATA ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | GETLST ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | GETRST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | HD ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | ID _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | IF ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | INT _v ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState102 _v
    | ISZERO ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | LET ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | LETREC ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | LPAREN ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | NEWREF ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | NODE ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | NULLT_QUESTION ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | NULL_QUESTION ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | PAIR ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | PROC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | SET ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | SETREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | TL ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | UNIT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | UNPAIR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState102
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState102

and _menhir_run106 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | CONS ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | EMPTYLIST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | EMPTYTREE ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | GETDATA ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | GETLST ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | GETRST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | HD ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | ID _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | IF ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | INT _v ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState106 _v
    | ISZERO ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | LET ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | LETREC ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | LPAREN ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | NEWREF ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | NODE ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | NULLT_QUESTION ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | NULL_QUESTION ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | PAIR ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | PROC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | SET ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | SETREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | TL ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | UNIT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | UNPAIR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState106
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState106

and _menhir_run104 : _menhir_env -> 'ttv_tail * _menhir_state * (Ast.expr) -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | CONS ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | EMPTYLIST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | EMPTYTREE ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | GETDATA ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | GETLST ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | GETRST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | HD ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | ID _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | IF ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | INT _v ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState104 _v
    | ISZERO ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | LET ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | LETREC ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | LPAREN ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | NEWREF ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | NODE ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | NULLT_QUESTION ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | NULL_QUESTION ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | PAIR ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | PROC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | SET ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | SETREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | TL ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | UNIT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | UNPAIR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState104
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState104

and _menhir_run20 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.texpr) = 
# 214 "parser.mly"
               ( UnitType )
# 1010 "parser.ml"
     in
    _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run21 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
        | BOOLTYPE ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | INTTYPE ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | LESS_THAN ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | LISTTYPE ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | LPAREN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | REFTYPE ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | TREETYPE ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | UNITTYPE ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22)
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
    | BOOLTYPE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | INTTYPE ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | LESS_THAN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | LISTTYPE ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | LPAREN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | REFTYPE ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | TREETYPE ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | UNITTYPE ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState23
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23

and _menhir_run24 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLTYPE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | INTTYPE ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | LESS_THAN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | LISTTYPE ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | LPAREN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | REFTYPE ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | TREETYPE ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | UNITTYPE ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState24
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState24

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
        | BOOLTYPE ->
            _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | INTTYPE ->
            _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | LESS_THAN ->
            _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | LISTTYPE ->
            _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | LPAREN ->
            _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | REFTYPE ->
            _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | TREETYPE ->
            _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState26
        | UNITTYPE ->
            _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState26
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
    | BOOLTYPE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | INTTYPE ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | LESS_THAN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | LISTTYPE ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | LPAREN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | REFTYPE ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | TREETYPE ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | UNITTYPE ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState27
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState27

and _menhir_run28 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.texpr) = 
# 208 "parser.mly"
              ( IntType )
# 1179 "parser.ml"
     in
    _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run29 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.texpr) = 
# 209 "parser.mly"
               ( BoolType )
# 1191 "parser.ml"
     in
    _menhir_goto_texpr _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> (Ast.expr) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState100 | MenhirState92 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | SEMICOLON ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState97 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | CONS ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | EMPTYLIST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | EMPTYTREE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | GETDATA ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | GETLST ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | GETRST ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | HD ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | ID _v ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
            | IF ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | INT _v ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState100 _v
            | ISZERO ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | LET ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | LETREC ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | LPAREN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | NEWREF ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | NODE ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | NULLT_QUESTION ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | NULL_QUESTION ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | PAIR ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | PROC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | SET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | SETREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | TL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | UNIT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | UNPAIR ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState100
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState100)
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState97
        | END ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (x : (Ast.expr))) = _menhir_stack in
            let _v : (Ast.expr list) = 
# 229 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [ x ] )
# 1285 "parser.ml"
             in
            _menhir_goto_separated_nonempty_list_SEMICOLON_expr_ _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState97)
    | MenhirState98 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 169 "parser.mly"
                                  ( Mul(e1,e2) )
# 1300 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState102 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState103
        | BEGIN | COMMA | CONS | DEBUG | DEREF | ELSE | EMPTYLIST | EMPTYTREE | END | EOF | GETDATA | GETLST | GETRST | HD | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | MINUS | NEWREF | NODE | NULLT_QUESTION | NULL_QUESTION | PAIR | PLUS | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TL | UNIT | UNPAIR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 167 "parser.mly"
                                 ( Add(e1,e2) )
# 1319 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103)
    | MenhirState104 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
        let _2 = () in
        let _v : (Ast.expr) = 
# 170 "parser.mly"
                                    ( Div(e1,e2) )
# 1334 "parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
    | MenhirState106 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState107
        | BEGIN | COMMA | CONS | DEBUG | DEREF | ELSE | EMPTYLIST | EMPTYTREE | END | EOF | GETDATA | GETLST | GETRST | HD | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | MINUS | NEWREF | NODE | NULLT_QUESTION | NULL_QUESTION | PAIR | PLUS | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TL | UNIT | UNPAIR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (Ast.expr) = 
# 168 "parser.mly"
                                  ( Sub(e1,e2) )
# 1353 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState107)
    | MenhirState91 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState108 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | CONS ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | EMPTYLIST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | EMPTYTREE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | GETDATA ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | GETLST ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | GETRST ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | HD ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | ID _v ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
            | IF ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | INT _v ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState109 _v
            | ISZERO ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | LET ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | LETREC ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | LPAREN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | NEWREF ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | NODE ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | NULLT_QUESTION ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | NULL_QUESTION ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | PAIR ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | PROC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | SET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | SETREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | TL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | UNIT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | UNPAIR ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState109
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState109)
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState108
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108)
    | MenhirState109 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState110 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 191 "parser.mly"
                                                        ( Cons(e1, e2) )
# 1468 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState110
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState110)
    | MenhirState88 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState112 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 177 "parser.mly"
                                      ( DeRef(e) )
# 1500 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState112
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState112)
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState114 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 199 "parser.mly"
                                        ( GetData(e) )
# 1532 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState114
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState114)
    | MenhirState80 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState116 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 200 "parser.mly"
                                       ( GetLST(e) )
# 1564 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState116
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState116)
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState118
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState118
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState118
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState118 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 201 "parser.mly"
                                       ( GetRST(e) )
# 1596 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState118
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState118)
    | MenhirState76 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState120 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 193 "parser.mly"
                                   ( Hd(e) )
# 1628 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState120
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState120)
    | MenhirState73 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | THEN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState122 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | CONS ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | EMPTYLIST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | EMPTYTREE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | GETDATA ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | GETLST ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | GETRST ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | HD ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | ID _v ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
            | IF ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | INT _v ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState123 _v
            | ISZERO ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | LET ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | LETREC ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | LPAREN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | NEWREF ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | NODE ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | NULLT_QUESTION ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | NULL_QUESTION ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | PAIR ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | PROC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | SET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | SETREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | TL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | UNIT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | UNPAIR ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState123
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState123)
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState122
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122)
    | MenhirState123 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | ELSE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState124 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | CONS ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | EMPTYLIST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | EMPTYTREE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | GETDATA ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | GETLST ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | GETRST ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | HD ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | ID _v ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
            | IF ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | INT _v ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState125 _v
            | ISZERO ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | LET ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | LETREC ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | LPAREN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | NEWREF ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | NODE ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | NULLT_QUESTION ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | NULL_QUESTION ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | PAIR ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | PROC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | SET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | SETREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | TL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | UNIT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | UNPAIR ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState125
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState125)
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState124
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState124)
    | MenhirState125 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState126
        | BEGIN | COMMA | CONS | DEBUG | DEREF | ELSE | EMPTYLIST | EMPTYTREE | END | EOF | GETDATA | GETLST | GETRST | HD | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | NODE | NULLT_QUESTION | NULL_QUESTION | PAIR | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TL | UNIT | UNPAIR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))), _), _, (e3 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 179 "parser.mly"
                                                      ( ITE(e1,e2,e3) )
# 1827 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState126)
    | MenhirState71 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState127
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState127
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState127
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState127 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 175 "parser.mly"
                                       ( IsZero(e) )
# 1857 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState127
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState127)
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState129 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | CONS ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | EMPTYLIST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | EMPTYTREE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | GETDATA ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | GETLST ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | GETRST ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | HD ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | ID _v ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
            | IF ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | INT _v ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState130 _v
            | ISZERO ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | LET ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | LETREC ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | LPAREN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | NEWREF ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | NODE ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | NULLT_QUESTION ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | NULL_QUESTION ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | PAIR ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | PROC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | SET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | SETREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | TL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | UNIT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | UNPAIR ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState130
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState130)
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState129
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState129)
    | MenhirState130 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState131
        | BEGIN | COMMA | CONS | DEBUG | DEREF | ELSE | EMPTYLIST | EMPTYTREE | END | EOF | GETDATA | GETLST | GETRST | HD | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | NODE | NULLT_QUESTION | NULL_QUESTION | PAIR | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TL | UNIT | UNPAIR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 1968 "parser.ml"
            ))), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 171 "parser.mly"
                                                    ( Let(x,e1,e2) )
# 1976 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState131)
    | MenhirState66 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState132 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | CONS ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | EMPTYLIST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | EMPTYTREE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | GETDATA ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | GETLST ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | GETRST ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | HD ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | ID _v ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
            | IF ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | INT _v ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState133 _v
            | ISZERO ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | LET ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | LETREC ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | LPAREN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | NEWREF ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | NODE ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | NULLT_QUESTION ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | NULL_QUESTION ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | PAIR ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | PROC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | SET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | SETREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | TL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | UNIT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | UNPAIR ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState133
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState133)
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState132
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState132)
    | MenhirState133 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState134
        | BEGIN | COMMA | CONS | DEBUG | DEREF | ELSE | EMPTYLIST | EMPTYTREE | END | EOF | GETDATA | GETLST | GETRST | HD | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | NODE | NULLT_QUESTION | NULL_QUESTION | PAIR | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TL | UNIT | UNPAIR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((((_menhir_stack, _menhir_s), _, (tr : (Ast.texpr))), (x : (
# 23 "parser.mly"
       (string)
# 2085 "parser.ml"
            ))), (y : (
# 23 "parser.mly"
       (string)
# 2089 "parser.ml"
            ))), _, (targ : (Ast.texpr))), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _11 = () in
            let _9 = () in
            let _8 = () in
            let _6 = () in
            let _4 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 172 "parser.mly"
                                                                                                            ( Letrec(tr,x,y,targ,e1,e2) )
# 2100 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState134)
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState135 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 183 "parser.mly"
                                      ( Sub(Int 0, e) )
# 2130 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState135
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState135)
    | MenhirState56 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState137 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState137 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState137 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 182 "parser.mly"
                               (e)
# 2207 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | UNPAIR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState137
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState137)
    | MenhirState137 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState139
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState139
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState139
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState139 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 174 "parser.mly"
                                           ( App(e1,e2) )
# 2248 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState139
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState139)
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState141 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 176 "parser.mly"
                                       ( NewRef(e) )
# 2280 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState141
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState141)
    | MenhirState53 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState143 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | CONS ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | EMPTYLIST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | EMPTYTREE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | GETDATA ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | GETLST ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | GETRST ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | HD ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | ID _v ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _v
            | IF ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | INT _v ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState144 _v
            | ISZERO ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | LET ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | LETREC ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | LPAREN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | NEWREF ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | NODE ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | NULLT_QUESTION ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | NULL_QUESTION ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | PAIR ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | PROC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | SET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | SETREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | TL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | UNIT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | UNPAIR ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState144
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState144)
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState143
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState143)
    | MenhirState144 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState145 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | CONS ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | EMPTYLIST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | EMPTYTREE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | GETDATA ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | GETLST ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | GETRST ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | HD ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | ID _v ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
            | IF ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | INT _v ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState146 _v
            | ISZERO ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | LET ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | LETREC ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | LPAREN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | NEWREF ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | NODE ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | NULLT_QUESTION ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | NULL_QUESTION ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | PAIR ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | PROC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | SET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | SETREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | TL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | UNIT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | UNPAIR ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState146
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState146)
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState145
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState145)
    | MenhirState146 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState147 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))), _), _, (e3 : (Ast.expr))) = _menhir_stack in
            let _8 = () in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 197 "parser.mly"
                                                                          ( Node(e1, e2, e3) )
# 2482 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState147
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState147)
    | MenhirState51 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState149 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 198 "parser.mly"
                                               ( NullT(e) )
# 2514 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState149
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState149)
    | MenhirState49 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState151 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 192 "parser.mly"
                                              ( Null(e) )
# 2546 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState151
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState151)
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState153 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | CONS ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | EMPTYLIST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | EMPTYTREE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | GETDATA ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | GETLST ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | GETRST ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | HD ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | ID _v ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v
            | IF ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | INT _v ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState154 _v
            | ISZERO ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | LET ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | LETREC ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | LPAREN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | NEWREF ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | NODE ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | NULLT_QUESTION ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | NULL_QUESTION ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | PAIR ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | PROC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | SET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | SETREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | TL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | UNIT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | UNPAIR ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState154
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState154)
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState153
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState153
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState153
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState153
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState153)
    | MenhirState154 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState155 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 187 "parser.mly"
                                                        ( Pair(e1, e2) )
# 2663 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState155
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState155)
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | RBRACE ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState157 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 2691 "parser.ml"
            ))), _, (t : (Ast.texpr))), _, (e : (Ast.expr))) = _menhir_stack in
            let _9 = () in
            let _7 = () in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 173 "parser.mly"
                                                                             ( Proc(x,t,e) )
# 2702 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState157
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState157)
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState159
        | BEGIN | COMMA | CONS | DEBUG | DEREF | ELSE | EMPTYLIST | EMPTYTREE | END | EOF | GETDATA | GETLST | GETRST | HD | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | NODE | NULLT_QUESTION | NULL_QUESTION | PAIR | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TL | UNIT | UNPAIR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let (((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 2729 "parser.ml"
            ))), _, (e : (Ast.expr))) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 180 "parser.mly"
                                    ( Set(x,e) )
# 2736 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState159)
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | COMMA ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState160 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | CONS ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | EMPTYLIST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | EMPTYTREE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | GETDATA ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | GETLST ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | GETRST ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | HD ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | ID _v ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState161 _v
            | IF ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | INT _v ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState161 _v
            | ISZERO ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | LET ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | LETREC ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | LPAREN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | NEWREF ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | NODE ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | NULLT_QUESTION ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | NULL_QUESTION ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | PAIR ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | PROC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | SET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | SETREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | TL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | UNIT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | UNPAIR ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState161
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState161)
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState160
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState160)
    | MenhirState161 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState162 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((_menhir_stack, _menhir_s), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 178 "parser.mly"
                                                          ( SetRef(e1,e2) )
# 2851 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState162
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState162)
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | RPAREN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState164 in
            let _menhir_env = _menhir_discard _menhir_env in
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((_menhir_stack, _menhir_s), _, (e : (Ast.expr))) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 194 "parser.mly"
                                   ( Tl(e) )
# 2883 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState164
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState164)
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | IN ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState166 in
            let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | BEGIN ->
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | CONS ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | EMPTYLIST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | EMPTYTREE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | GETDATA ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | GETLST ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | GETRST ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | HD ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | ID _v ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState167 _v
            | IF ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | INT _v ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState167 _v
            | ISZERO ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | LET ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | LETREC ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | LPAREN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | NEWREF ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | NODE ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | NULLT_QUESTION ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | NULL_QUESTION ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | PAIR ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | PROC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | SET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | SETREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | TL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | UNIT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | UNPAIR ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState167
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState167)
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState166
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState166)
    | MenhirState167 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState168
        | BEGIN | COMMA | CONS | DEBUG | DEREF | ELSE | EMPTYLIST | EMPTYTREE | END | EOF | GETDATA | GETLST | GETRST | HD | ID _ | IF | IN | INT _ | ISZERO | LET | LETREC | LPAREN | NEWREF | NODE | NULLT_QUESTION | NULL_QUESTION | PAIR | PROC | RBRACE | RPAREN | SEMICOLON | SET | SETREF | THEN | TL | UNIT | UNPAIR ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let ((((((_menhir_stack, _menhir_s), (x : (
# 23 "parser.mly"
       (string)
# 2994 "parser.ml"
            ))), (y : (
# 23 "parser.mly"
       (string)
# 2998 "parser.ml"
            ))), _, (e1 : (Ast.expr))), _), _, (e2 : (Ast.expr))) = _menhir_stack in
            let _9 = () in
            let _7 = () in
            let _6 = () in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : (Ast.expr) = 
# 188 "parser.mly"
                                                                                      ( Unpair(x, y, e1, e2) )
# 3009 "parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState168)
    | MenhirState0 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | DIVIDED ->
            _menhir_run104 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | EOF ->
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_s = MenhirState170 in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_menhir_stack, _menhir_s, (e : (Ast.expr))) = _menhir_stack in
            let _2 = () in
            let _v : (
# 103 "parser.mly"
       (Ast.prog)
# 3032 "parser.ml"
            ) = 
# 135 "parser.mly"
                 ( AProg e )
# 3036 "parser.ml"
             in
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = Obj.magic _menhir_stack in
            let (_1 : (
# 103 "parser.mly"
       (Ast.prog)
# 3043 "parser.ml"
            )) = _v in
            Obj.magic _1
        | MINUS ->
            _menhir_run106 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | PLUS ->
            _menhir_run102 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | TIMES ->
            _menhir_run98 _menhir_env (Obj.magic _menhir_stack) MenhirState170
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState170)
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
# 3069 "parser.ml"
      
    in
    
# 205 "parser.mly"
                                            ( es )
# 3075 "parser.ml"
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
# 181 "parser.mly"
                             ( BeginEnd(es) )
# 3092 "parser.ml"
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
    | MenhirState170 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState168 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState167 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState166 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState164 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState162 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState161 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState160 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState159 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState157 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState155 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState154 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState153 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState151 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState149 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState147 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState146 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState145 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState144 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState143 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState141 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState139 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState137 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState135 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState134 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState133 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState132 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState131 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState130 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState129 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState127 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState126 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState125 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState124 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState123 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState122 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState120 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState118 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState116 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState114 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState112 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState110 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState109 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState108 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState107 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState106 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState104 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState103 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState102 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState100 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState98 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState97 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState92 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState91 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState88 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState85 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState83 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState82 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState80 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState78 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState76 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState73 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState71 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState69 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState66 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState63 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s, _), _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState58 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState57 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState56 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState55 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
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
    | MenhirState47 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState45 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState34 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState31 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState27 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState26 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState24 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState23 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState22 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState19 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState15 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState12 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState10 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s
    | MenhirState7 ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let (((_menhir_stack, _menhir_s), _), _) = _menhir_stack in
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
            let _menhir_stack = Obj.magic _menhir_stack in
            let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            (match _tok with
            | COMMA ->
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
                                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | CONS ->
                                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | DEBUG ->
                                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | DEREF ->
                                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | EMPTYLIST ->
                                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | EMPTYTREE ->
                                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | GETDATA ->
                                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | GETLST ->
                                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | GETRST ->
                                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | HD ->
                                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | ID _v ->
                                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
                            | IF ->
                                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | INT _v ->
                                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState7 _v
                            | ISZERO ->
                                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | LET ->
                                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | LETREC ->
                                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | LPAREN ->
                                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | NEWREF ->
                                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | NODE ->
                                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | NULLT_QUESTION ->
                                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | NULL_QUESTION ->
                                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | PAIR ->
                                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | PROC ->
                                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | SET ->
                                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | SETREF ->
                                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | TL ->
                                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | UNIT ->
                                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | UNPAIR ->
                                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState7
                            | _ ->
                                assert (not _menhir_env._menhir_error);
                                _menhir_env._menhir_error <- true;
                                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState7)
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run8 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.expr) = 
# 185 "parser.mly"
           ( Unit )
# 3600 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

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
        | BEGIN ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState10 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState10
        | UNPAIR ->
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
        | BEGIN ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState12 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState12
        | UNPAIR ->
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
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | CONS ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | EMPTYLIST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | EMPTYTREE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | GETDATA ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | GETLST ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | GETRST ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | HD ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | ID _v ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
            | IF ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | INT _v ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState15 _v
            | ISZERO ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | LET ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | LETREC ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | LPAREN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | NEWREF ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | NODE ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | NULLT_QUESTION ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | NULL_QUESTION ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | PAIR ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | PROC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | SET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | SETREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | TL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | UNIT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | UNPAIR ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState15
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState15)
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
                    _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState19
                | INTTYPE ->
                    _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState19
                | LESS_THAN ->
                    _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState19
                | LISTTYPE ->
                    _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState19
                | LPAREN ->
                    _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState19
                | REFTYPE ->
                    _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState19
                | TREETYPE ->
                    _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState19
                | UNITTYPE ->
                    _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState19
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
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState47 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | UNPAIR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState47
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState47)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | UNPAIR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState49
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run50 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState51 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | UNPAIR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState51
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState51)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run52 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState53 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | UNPAIR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState53
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState53)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run54 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | UNPAIR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState55
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run56 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | CONS ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | EMPTYLIST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | EMPTYTREE ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | GETDATA ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | GETLST ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | GETRST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | HD ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | ID _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
    | IF ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | INT _v ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState56 _v
    | ISZERO ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | LET ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | LETREC ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | LPAREN ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | MINUS ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState56 in
        let _menhir_stack = (_menhir_stack, _menhir_s) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        (match _tok with
        | BEGIN ->
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | UNPAIR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState57
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57)
    | NEWREF ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | NODE ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | NULLT_QUESTION ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | NULL_QUESTION ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | PAIR ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | PROC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | SET ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | SETREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | TL ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | UNIT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | UNPAIR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState56
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState56

and _menhir_run58 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLTYPE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | INTTYPE ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | LESS_THAN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | LISTTYPE ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | LPAREN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | REFTYPE ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | TREETYPE ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | UNITTYPE ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState58
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState58

and _menhir_run67 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
                _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | CONS ->
                _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | DEBUG ->
                _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | DEREF ->
                _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | EMPTYLIST ->
                _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | EMPTYTREE ->
                _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | GETDATA ->
                _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | GETLST ->
                _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | GETRST ->
                _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | HD ->
                _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | ID _v ->
                _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
            | IF ->
                _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | INT _v ->
                _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState69 _v
            | ISZERO ->
                _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | LET ->
                _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | LETREC ->
                _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | LPAREN ->
                _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | NEWREF ->
                _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | NODE ->
                _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | NULLT_QUESTION ->
                _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | NULL_QUESTION ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | PAIR ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | PROC ->
                _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | SET ->
                _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | SETREF ->
                _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | TL ->
                _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | UNIT ->
                _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | UNPAIR ->
                _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState69
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState69)
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

and _menhir_run70 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | UNPAIR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run72 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 22 "parser.mly"
       (int)
# 4633 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (i : (
# 22 "parser.mly"
       (int)
# 4641 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 164 "parser.mly"
              ( Int i )
# 4646 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run73 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | CONS ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | EMPTYLIST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | EMPTYTREE ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | GETDATA ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | GETLST ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | GETRST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | HD ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | ID _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
    | IF ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | INT _v ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState73 _v
    | ISZERO ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | LET ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | LETREC ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | LPAREN ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | NEWREF ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | NODE ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | NULLT_QUESTION ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | NULL_QUESTION ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | PAIR ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | PROC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | SET ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | SETREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | TL ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | UNIT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | UNPAIR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState73
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState73

and _menhir_run74 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 23 "parser.mly"
       (string)
# 4720 "parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let (x : (
# 23 "parser.mly"
       (string)
# 4728 "parser.ml"
    )) = _v in
    let _v : (Ast.expr) = 
# 165 "parser.mly"
             ( Var x )
# 4733 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run75 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState76 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | UNPAIR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState76
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState76)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run77 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState78 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | UNPAIR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState78
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState78)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run79 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState80 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | UNPAIR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState80
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState80)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run81 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState82 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | UNPAIR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState82
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState82)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run83 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLTYPE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | INTTYPE ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | LESS_THAN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | LISTTYPE ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | LPAREN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | REFTYPE ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | TREETYPE ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | UNITTYPE ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83

and _menhir_run85 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BOOLTYPE ->
        _menhir_run29 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | INTTYPE ->
        _menhir_run28 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | LESS_THAN ->
        _menhir_run27 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | LISTTYPE ->
        _menhir_run25 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | LPAREN ->
        _menhir_run24 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | REFTYPE ->
        _menhir_run23 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | TREETYPE ->
        _menhir_run21 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | UNITTYPE ->
        _menhir_run20 _menhir_env (Obj.magic _menhir_stack) MenhirState85
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState85

and _menhir_run87 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState88 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | UNPAIR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState88
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState88)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run89 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _menhir_stack = Obj.magic _menhir_stack in
    let _1 = () in
    let _v : (Ast.expr) = 
# 166 "parser.mly"
            ( Debug )
# 5189 "parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v

and _menhir_run90 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
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
            _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | CONS ->
            _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | DEBUG ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | DEREF ->
            _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | EMPTYLIST ->
            _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | EMPTYTREE ->
            _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | GETDATA ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | GETLST ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | GETRST ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | HD ->
            _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | ID _v ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
        | IF ->
            _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | INT _v ->
            _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
        | ISZERO ->
            _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | LET ->
            _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | LETREC ->
            _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | LPAREN ->
            _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | NEWREF ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | NODE ->
            _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | NULLT_QUESTION ->
            _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | NULL_QUESTION ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | PAIR ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | PROC ->
            _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | SET ->
            _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | SETREF ->
            _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | TL ->
            _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | UNIT ->
            _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | UNPAIR ->
            _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState91
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let _menhir_stack = Obj.magic _menhir_stack in
        let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s

and _menhir_run92 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | BEGIN ->
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | CONS ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | EMPTYLIST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | EMPTYTREE ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | GETDATA ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | GETLST ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | GETRST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | HD ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | ID _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
    | IF ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | INT _v ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState92 _v
    | ISZERO ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | LET ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | LETREC ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | LPAREN ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | NEWREF ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | NODE ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | NULLT_QUESTION ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | NULL_QUESTION ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | PAIR ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | PROC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | SET ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | SETREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | TL ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | UNIT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | UNPAIR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState92
    | END ->
        let _menhir_stack = Obj.magic _menhir_stack in
        let _menhir_s = MenhirState92 in
        let _v : (Ast.expr list) = 
# 142 "/home/alcy/.opam/system/lib/menhir/standard.mly"
    ( [] )
# 5339 "parser.ml"
         in
        _menhir_goto_loption_separated_nonempty_list_SEMICOLON_expr__ _menhir_env _menhir_stack _menhir_s _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState92

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
# 103 "parser.mly"
       (Ast.prog)
# 5362 "parser.ml"
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
        _menhir_run92 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | CONS ->
        _menhir_run90 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DEBUG ->
        _menhir_run89 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | DEREF ->
        _menhir_run87 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EMPTYLIST ->
        _menhir_run85 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | EMPTYTREE ->
        _menhir_run83 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | GETDATA ->
        _menhir_run81 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | GETLST ->
        _menhir_run79 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | GETRST ->
        _menhir_run77 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | HD ->
        _menhir_run75 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | ID _v ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | IF ->
        _menhir_run73 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | INT _v ->
        _menhir_run72 _menhir_env (Obj.magic _menhir_stack) MenhirState0 _v
    | ISZERO ->
        _menhir_run70 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LET ->
        _menhir_run67 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LETREC ->
        _menhir_run58 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | LPAREN ->
        _menhir_run56 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NEWREF ->
        _menhir_run54 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NODE ->
        _menhir_run52 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NULLT_QUESTION ->
        _menhir_run50 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | NULL_QUESTION ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PAIR ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | PROC ->
        _menhir_run16 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SET ->
        _menhir_run13 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | SETREF ->
        _menhir_run11 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | TL ->
        _menhir_run9 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | UNIT ->
        _menhir_run8 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | UNPAIR ->
        _menhir_run1 _menhir_env (Obj.magic _menhir_stack) MenhirState0
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0)

# 233 "/home/alcy/.opam/system/lib/menhir/standard.mly"
  

# 5440 "parser.ml"
