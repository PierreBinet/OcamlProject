open Graph
open Gfile


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
let int_graph = Graph.map graph int_of_string in


let listpath = Ford.find_path int_graph "0" "5" [] in ()
(* Rewrite the graph that has been read. *)
                 (* let () = Gfile.export outfile graph in 

                 ()*)




(* ######## Previous export debug ######### *)
(*
let testgraph = (add_node (add_node (add_node empty_graph "n1") "n2") "n3");;
let testgraph2 = (add_arc (add_arc (add_arc (add_arc testgraph "n1" "n2" "a12") "n2" "n1" "a21") "n2" "n3" "a23") "n1" "n3" "a13");;

export "~/Documents/4A/Ocaml/Project/dot_out" testgraph;;
export "~/Documents/4A/Ocaml/Project/dot_out2" testgraph2;;
*)

(* ######## Previous map debug ######### *)
(* 
let f x = "x";;
map testgraph2 f;;
*)
