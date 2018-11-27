open Graph
open Gfile
open Ford


(* ######## THE LE MAIN ######### *)
let () =

if Array.length Sys.argv <> 5 then
  begin
    Printf.printf "\nUsage: %s infile source target outfile\n\n%!" Sys.argv.(0) ;
    exit 0
  end ;

let infile = Sys.argv.(1)
and outfile = Sys.argv.(4)

and source = Sys.argv.(2)
and target = Sys.argv.(3)
in

(* Open file *)
let graph = Gfile.from_file infile in

(* Test find_path *)

(*
let graph = Gfile.from_file infile in
let int_graph = Graph.map graph int_of_string in

let listpath = Ford.find_path int_graph [] source target in
let rec print_listpath listpath txt= match listpath with
	|[]-> txt
	|(x,lbl)::rest-> txt^"noeud "^x^", cout "^(string_of_int lbl)^"\n\n"^(print_listpath rest txt)
in Printf.printf "%s\n" (print_listpath listpath "");;
*)

(* Export *)
let () = Gfile.export outfile graph in 
(* note that this is the terminal command to be used to export the dot file in png : dot -Tpng your-dot-file > some-output-file *)
()




(* ######## Previous export debug ######### *)
(*
let testgraph = (add_node (add_node (add_node empty_graph "n1") "n2") "n3");;
let testgraph2 = (add_arc (add_arc (add_arc (add_arc testgraph "n1" "n2" "a12") "n2" "n1" "a21") "n2" "n3" "a23") "n1" "n3" "a13");;

export "~/Documents/4A/Ocaml/Project/dot_out" testgraph;;
export "~/Documents/4A/Ocaml/Project/dot_out2" testgraph2;;
*)

(* ######## Previous map debug ######### *)

(* 
let f x = int_of_string x;;
map testgraph2 f;;
*)
