open Ast
open Ds
open Interp

let rec repl (mode:string):unit =
  output_string stdout (mode ^"> ");
  flush stdout;
  let line = input_line stdin in
  match line with
    "done" -> ()
  | "p" -> repl "p"
  | "e" -> repl "e"
  | _ ->
    begin
      (* output_string stdout line; *)
      (* output_char stdout '\n'; *)
      if (mode="e")
      then output_string stdout (string_of_expval (interp line))
      else output_string stdout (line |> parse |> string_of_expr);
      output_char stdout '\n';
      repl mode
    end

(* "Main program" *)
(*   let () = repl "e" *)
let () = repl "e"
