open OUnit2
open Ast
open Ds
open Checker

let tests = [
    (* pair *)
    "pair1 " >::
        (fun _ -> assert_equal
            (PairType (IntType, IntType))
            (chk "pair(3, 4)"));

    "pair2 " >::
        (fun _ -> assert_equal
        (* Mismatch !!! has 
        (PairType (PairType (IntType, IntType), IntType)) 
        *)
            (PairType ((PairType (IntType, IntType)), IntType))
            (chk "pair(pair(3, 4), 5)"));

    "pair3 " >::
        (fun _ -> assert_equal
            (PairType (BoolType, IntType))
            (chk "pair(zero?(0), 3)"));

    "pair_proc " >::
        (fun _ -> assert_equal
            (PairType (FuncType (IntType, IntType), IntType))
            (chk "pair(proc (x:int) { x - 1 }, 4)"));

    "unpair1 "  >::
        (fun _ -> assert_equal
            IntType
            (chk "unpair (a, b) = pair(1, 2) in a + b"));

    "unpair_proc " >::
        (fun _ -> assert_equal
        (* Mismatch !!! has 
        (FuncType (PairType (IntType, BoolType), PairType (BoolType, IntType))) 
        *)
            (FuncType ((PairType (IntType, BoolType)), (PairType (BoolType, IntType))))
            (chk "proc (z:<int*bool>) { unpair(x, y) = z in pair(y, x) }"));

    "pair_bool_int " >::
        (fun _ -> assert_equal
            (PairType (BoolType, IntType))
            (chk "let f = proc (z:<int*bool>) { unpair (x,y)=z in pair(y,x) } in (f pair (1, zero?(0)))"));

    (* list *)
    "emptylist " >::
        (fun _ -> assert_equal
        (* Mismatch !!! has 
        (ListType IntType) 
        *)
            (ListType (IntType))
            (chk "emptylist int"));

    "single_ele_int " >::
        (fun _ -> assert_equal
        (* Mismatch !!! has 
        (ListType IntType) *)
            (ListType (IntType))
            (chk "cons(1, emptylist int)"));

    "single_ele_bool " >::
        (fun _ -> assert_equal
        (* Mismatch !!! has 
        (ListType BoolType) 
        *)
            (ListType (BoolType))
            (chk "cons(zero?(1), emptylist bool)"));

    "list_of_list_let_int " >::
        (fun _ -> assert_equal
        (* Mismatch !!! has 
        (ListType (ListType IntType)) 
        *)
            (ListType (ListType (IntType)))
            (chk "let x = 4 in cons(cons(x - 1, emptylist int), emptylist list(int))"));

    "null_list " >::
        (fun _ -> assert_equal
            (BoolType)
            (chk "null?(emptylist list(int))"));

    "hd_list_int " >::
        (fun _ -> assert_equal
            (IntType)
            (chk "hd(cons(1, emptylist int))"));

    "tl_list_int " >::
        (fun _ -> assert_equal
        (* Mismatch !!! has 
        (ListType IntType) 
        *)
            (ListType (IntType))
            (chk "tl(cons(1, emptylist int))"));

    (* tree *)
    "empty_tree " >::
        (fun _ -> assert_equal
        (* Mismatch !!! has 
        (TreeType IntType) 
        *)
            (TreeType (IntType))
            (chk "emptytree int"));

    "null_tree " >::
        (fun _ -> assert_equal
            (BoolType)
            (chk "nullT?(emptytree int)"));

    "not_null_tree " >::
        (fun _ -> assert_equal
            (BoolType)
            (chk "nullT?(node(1, node(2, emptytree int, emptytree int), emptytree int))"));

    "get_data_tree " >::
        (fun _ -> assert_equal
            (IntType)
            (chk "getData(node(1, node(2, emptytree int, emptytree int), emptytree int))"));

    "get_lst " >::
        (fun _ -> assert_equal
        (* Mismatch !!! has 
        (TreeType IntType) 
        *)
            (TreeType (IntType))
            (chk "getLST(node(1, node(2, emptytree int, emptytree int), emptytree int))"));

    "get_rst " >::
        (fun _ -> assert_equal
        (* Mismatch !!! has 
        (TreeType IntType) 
        *)
            (TreeType (IntType))
            (chk "getRST(node(1, node(2, emptytree int, emptytree int), emptytree int))"));

]

let _ = run_test_tt_main ("suite" >::: tests)
