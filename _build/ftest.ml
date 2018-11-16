open Graph
open Gfile

let () =

  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf "\nUsage: %s infile source sink outfile\n\n%!" Sys.argv.(0) ;
      exit 0
    end ;

  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(4)
  
  (* These command-line arguments are not used for the moment. *)
  and _source = Sys.argv.(2)
  and _sink = Sys.argv.(3)
  in

  (* Open file *)
  let graph = Gfile.from_file infile in

  (* Rewrite the graph that has been read. *)
  let () = Gfile.export outfile graph in

  ()
(*
let testgraph = (add_node (add_node (add_node empty_graph "n1") "n2") "n3");;
let testgraph2 = (add_arc (add_arc (add_arc (add_arc testgraph "n1" "n2" "a12") "n2" "n1" "a21") "n2" "n3" "a23") "n1" "n3" "a13");;

export "~/Documents/4A/Ocaml/Project/dot_out" testgraph;;
export "~/Documents/4A/Ocaml/Project/dot_out2" testgraph2;;


*)
