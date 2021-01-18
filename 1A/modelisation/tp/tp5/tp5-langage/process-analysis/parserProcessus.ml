
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | STARTS
    | STARTED
    | RIGHT_BRACE
    | RESOURCE
    | REQUIRES
    | PROCESS
    | NUMBER of (
# 14 "parserProcessus.mly"
       (int)
# 17 "parserProcessus.ml"
  )
    | LEFT_BRACE
    | IF
    | IDENTIFIER of (
# 15 "parserProcessus.mly"
       (string)
# 24 "parserProcessus.ml"
  )
    | FINISHES
    | FINISHED
    | END
    | AMOUNT
    | ACTIVITY
  
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
  | MenhirState22
  | MenhirState12
  | MenhirState5
  | MenhirState3

# 1 "parserProcessus.mly"
  

(* Partie recopiee dans le fichier CaML genere. *)
(* Ouverture de modules exploites dans les actions *)
(* Declarations de types, de constantes, de fonctions, d'exceptions exploites dans les actions *)


# 60 "parserProcessus.ml"

let rec _menhir_goto_etat : _menhir_env -> 'ttv_tail -> 'tv_etat -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv111 * _menhir_state * 'tv_action)) * (
# 15 "parserProcessus.mly"
       (string)
# 68 "parserProcessus.ml"
    )) = Obj.magic _menhir_stack in
    let (_v : 'tv_etat) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv109 * _menhir_state * 'tv_action)) * (
# 15 "parserProcessus.mly"
       (string)
# 75 "parserProcessus.ml"
    )) = Obj.magic _menhir_stack in
    let ((_4 : 'tv_etat) : 'tv_etat) = _v in
    ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_action)), (_3 : (
# 15 "parserProcessus.mly"
       (string)
# 81 "parserProcessus.ml"
    ))) = _menhir_stack in
    let _2 = () in
    let _v : 'tv_contrainte = 
# 44 "parserProcessus.mly"
                                       ( (print_endline "contrainte : action if IDENTIFIER etat") )
# 87 "parserProcessus.ml"
     in
    _menhir_goto_contrainte _menhir_env _menhir_stack _menhir_s _v) : 'freshtv110)) : 'freshtv112)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_contraintes : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_contraintes -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv103 * _menhir_state) * (
# 15 "parserProcessus.mly"
       (string)
# 104 "parserProcessus.ml"
        )) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_contraintes) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv101 * _menhir_state) * (
# 15 "parserProcessus.mly"
       (string)
# 112 "parserProcessus.ml"
        )) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_contraintes) : 'tv_contraintes) = _v in
        ((let ((_menhir_stack, _menhir_s), (_2 : (
# 15 "parserProcessus.mly"
       (string)
# 119 "parserProcessus.ml"
        ))) = _menhir_stack in
        let _1 = () in
        let _v : 'tv_activite = 
# 37 "parserProcessus.mly"
                                           ( (print_endline "activite : activity IDENTIFIER contraintes") )
# 125 "parserProcessus.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv99) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_activite) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv97) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_activite) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv95) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_activite) : 'tv_activite) = _v in
        ((let _v : 'tv_element = 
# 35 "parserProcessus.mly"
                   ( (print_endline "element : activite") )
# 142 "parserProcessus.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv93) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_element) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv91 * _menhir_state * 'tv_element) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | ACTIVITY ->
            _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | RIGHT_BRACE ->
            _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack) MenhirState22
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState22) : 'freshtv92)) : 'freshtv94)) : 'freshtv96)) : 'freshtv98)) : 'freshtv100)) : 'freshtv102)) : 'freshtv104)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv107 * _menhir_state * 'tv_contrainte) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_contraintes) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105 * _menhir_state * 'tv_contrainte) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_2 : 'tv_contraintes) : 'tv_contraintes) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_contrainte)) = _menhir_stack in
        let _v : 'tv_contraintes = 
# 43 "parserProcessus.mly"
                                       ( (print_endline "contraintes : contrainte contraintes") )
# 175 "parserProcessus.ml"
         in
        _menhir_goto_contraintes _menhir_env _menhir_stack _menhir_s _v) : 'freshtv106)) : 'freshtv108)
    | _ ->
        _menhir_fail ()

and _menhir_goto_contrainte : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_contrainte -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv89 * _menhir_state * 'tv_contrainte) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | FINISHES ->
        _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | REQUIRES ->
        _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | STARTS ->
        _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | ACTIVITY | RIGHT_BRACE ->
        _menhir_reduce6 _menhir_env (Obj.magic _menhir_stack) MenhirState12
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState12) : 'freshtv90)

and _menhir_goto_action : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_action -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv87 * _menhir_state * 'tv_action) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IF ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv83 * _menhir_state * 'tv_action) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENTIFIER _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv79 * _menhir_state * 'tv_action)) = Obj.magic _menhir_stack in
            let (_v : (
# 15 "parserProcessus.mly"
       (string)
# 222 "parserProcessus.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | FINISHED ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv71) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv69) = Obj.magic _menhir_stack in
                ((let _1 = () in
                let _v : 'tv_etat = 
# 52 "parserProcessus.mly"
                    ( (print_endline "etat : FINISHED") )
# 238 "parserProcessus.ml"
                 in
                _menhir_goto_etat _menhir_env _menhir_stack _v) : 'freshtv70)) : 'freshtv72)
            | STARTED ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv75) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv73) = Obj.magic _menhir_stack in
                ((let _1 = () in
                let _v : 'tv_etat = 
# 51 "parserProcessus.mly"
               ( (print_endline "etat : STARTED") )
# 251 "parserProcessus.ml"
                 in
                _menhir_goto_etat _menhir_env _menhir_stack _v) : 'freshtv74)) : 'freshtv76)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (('freshtv77 * _menhir_state * 'tv_action)) * (
# 15 "parserProcessus.mly"
       (string)
# 261 "parserProcessus.ml"
                )) = Obj.magic _menhir_stack in
                ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv78)) : 'freshtv80)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv81 * _menhir_state * 'tv_action)) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)) : 'freshtv84)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv85 * _menhir_state * 'tv_action) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)) : 'freshtv88)

and _menhir_goto_elements : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_elements -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv63) * (
# 15 "parserProcessus.mly"
       (string)
# 289 "parserProcessus.ml"
        ))) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | RIGHT_BRACE ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv59) * (
# 15 "parserProcessus.mly"
       (string)
# 299 "parserProcessus.ml"
            ))) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv57) * (
# 15 "parserProcessus.mly"
       (string)
# 306 "parserProcessus.ml"
            ))) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, (_2 : (
# 15 "parserProcessus.mly"
       (string)
# 311 "parserProcessus.ml"
            ))), _, (_4 : 'tv_elements)) = _menhir_stack in
            let _5 = () in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_processus = 
# 30 "parserProcessus.mly"
                                                               ( (print_endline "processus : process IDENTIFIER { elements }") )
# 319 "parserProcessus.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv55) = _menhir_stack in
            let (_v : 'tv_processus) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv53 * 'tv_processus) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | END ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv49 * 'tv_processus) = Obj.magic _menhir_stack in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv47 * 'tv_processus) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, (_1 : 'tv_processus)) = _menhir_stack in
                let _2 = () in
                let _v : (
# 21 "parserProcessus.mly"
      (unit)
# 340 "parserProcessus.ml"
                ) = 
# 28 "parserProcessus.mly"
                        ( (print_endline "fichier : processus END") )
# 344 "parserProcessus.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv45) = _menhir_stack in
                let (_v : (
# 21 "parserProcessus.mly"
      (unit)
# 351 "parserProcessus.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv43) = Obj.magic _menhir_stack in
                let (_v : (
# 21 "parserProcessus.mly"
      (unit)
# 358 "parserProcessus.ml"
                )) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv41) = Obj.magic _menhir_stack in
                let ((_1 : (
# 21 "parserProcessus.mly"
      (unit)
# 365 "parserProcessus.ml"
                )) : (
# 21 "parserProcessus.mly"
      (unit)
# 369 "parserProcessus.ml"
                )) = _v in
                (Obj.magic _1 : 'freshtv42)) : 'freshtv44)) : 'freshtv46)) : 'freshtv48)) : 'freshtv50)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv51 * 'tv_processus) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv52)) : 'freshtv54)) : 'freshtv56)) : 'freshtv58)) : 'freshtv60)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv61) * (
# 15 "parserProcessus.mly"
       (string)
# 385 "parserProcessus.ml"
            ))) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)) : 'freshtv64)
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv67 * _menhir_state * 'tv_element) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv65 * _menhir_state * 'tv_element) * _menhir_state * 'tv_elements) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_element)), _, (_2 : 'tv_elements)) = _menhir_stack in
        let _v : 'tv_elements = 
# 33 "parserProcessus.mly"
                                 ( (print_endline "elements : element elements") )
# 398 "parserProcessus.ml"
         in
        _menhir_goto_elements _menhir_env _menhir_stack _menhir_s _v) : 'freshtv66)) : 'freshtv68)
    | _ ->
        _menhir_fail ()

and _menhir_reduce6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_contraintes = 
# 42 "parserProcessus.mly"
                                     ( (print_endline "contraintes : /* Lambda, mot vide */") )
# 409 "parserProcessus.ml"
     in
    _menhir_goto_contraintes _menhir_env _menhir_stack _menhir_s _v

and _menhir_run6 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv39) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_action = 
# 48 "parserProcessus.mly"
                ( (print_endline "action : STARTS") )
# 423 "parserProcessus.ml"
     in
    _menhir_goto_action _menhir_env _menhir_stack _menhir_s _v) : 'freshtv40)

and _menhir_run7 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | NUMBER _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv35 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 14 "parserProcessus.mly"
       (int)
# 439 "parserProcessus.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENTIFIER _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv31 * _menhir_state) * (
# 14 "parserProcessus.mly"
       (int)
# 450 "parserProcessus.ml"
            )) = Obj.magic _menhir_stack in
            let (_v : (
# 15 "parserProcessus.mly"
       (string)
# 455 "parserProcessus.ml"
            )) = _v in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv29 * _menhir_state) * (
# 14 "parserProcessus.mly"
       (int)
# 462 "parserProcessus.ml"
            )) = Obj.magic _menhir_stack in
            let ((_3 : (
# 15 "parserProcessus.mly"
       (string)
# 467 "parserProcessus.ml"
            )) : (
# 15 "parserProcessus.mly"
       (string)
# 471 "parserProcessus.ml"
            )) = _v in
            ((let ((_menhir_stack, _menhir_s), (_2 : (
# 14 "parserProcessus.mly"
       (int)
# 476 "parserProcessus.ml"
            ))) = _menhir_stack in
            let _1 = () in
            let _v : 'tv_contrainte = 
# 45 "parserProcessus.mly"
                                            ( (print_endline "contrainte : requires NUMBER IDENTIFIER") )
# 482 "parserProcessus.ml"
             in
            _menhir_goto_contrainte _menhir_env _menhir_stack _menhir_s _v) : 'freshtv30)) : 'freshtv32)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv33 * _menhir_state) * (
# 14 "parserProcessus.mly"
       (int)
# 492 "parserProcessus.ml"
            )) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)) : 'freshtv36)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv37 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)

and _menhir_run10 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv27) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_action = 
# 49 "parserProcessus.mly"
                    ( (print_endline "action : FINISHES") )
# 514 "parserProcessus.ml"
     in
    _menhir_goto_action _menhir_env _menhir_stack _menhir_s _v) : 'freshtv28)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState22 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv19 * _menhir_state * 'tv_element) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)
    | MenhirState12 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state * 'tv_contrainte) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv23 * _menhir_state) * (
# 15 "parserProcessus.mly"
       (string)
# 536 "parserProcessus.ml"
        )) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState3 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv25) * (
# 15 "parserProcessus.mly"
       (string)
# 545 "parserProcessus.ml"
        ))) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv26)

and _menhir_reduce9 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_elements = 
# 32 "parserProcessus.mly"
                                  ( (print_endline "elements : /* Lambda, mot vide */") )
# 554 "parserProcessus.ml"
     in
    _menhir_goto_elements _menhir_env _menhir_stack _menhir_s _v

and _menhir_run4 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | IDENTIFIER _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv15 * _menhir_state) = Obj.magic _menhir_stack in
        let (_v : (
# 15 "parserProcessus.mly"
       (string)
# 570 "parserProcessus.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | FINISHES ->
            _menhir_run10 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | REQUIRES ->
            _menhir_run7 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | STARTS ->
            _menhir_run6 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | ACTIVITY | RIGHT_BRACE ->
            _menhir_reduce6 _menhir_env (Obj.magic _menhir_stack) MenhirState5
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5) : 'freshtv16)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv17 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)

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

and fichier : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 21 "parserProcessus.mly"
      (unit)
# 611 "parserProcessus.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv13) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | PROCESS ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv9) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | IDENTIFIER _v ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv5) = Obj.magic _menhir_stack in
            let (_v : (
# 15 "parserProcessus.mly"
       (string)
# 642 "parserProcessus.ml"
            )) = _v in
            ((let _menhir_stack = (_menhir_stack, _v) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | LEFT_BRACE ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv1) * (
# 15 "parserProcessus.mly"
       (string)
# 653 "parserProcessus.ml"
                )) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | ACTIVITY ->
                    _menhir_run4 _menhir_env (Obj.magic _menhir_stack) MenhirState3
                | RIGHT_BRACE ->
                    _menhir_reduce9 _menhir_env (Obj.magic _menhir_stack) MenhirState3
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState3) : 'freshtv2)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ('freshtv3) * (
# 15 "parserProcessus.mly"
       (string)
# 673 "parserProcessus.ml"
                )) = Obj.magic _menhir_stack in
                (raise _eRR : 'freshtv4)) : 'freshtv6)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
            (raise _eRR : 'freshtv8)) : 'freshtv10)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv12)) : 'freshtv14))

# 54 "parserProcessus.mly"
  

# 692 "parserProcessus.ml"

# 269 "<standard.mly>"
  

# 697 "parserProcessus.ml"
