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

(* ####### Test find_path ####### 
(* Open file *)
let graph = Gfile.from_file infile in
let int_graph = Graph.map graph int_of_string in

let listpath = Ford.find_path int_graph [] source target in
let rec print_listpath listpath = match listpath with
	|[]-> ""
	|(x,lbl)::rest-> "noeud "^x^", cout "^(string_of_int lbl)^"\n\n"^(print_listpath rest)
in Printf.printf "%s ------------\n cout_min : %d \n%!" (print_listpath listpath) (cout_min listpath);;
 ######## *)

(* ######## test conv_flow (Export in dot) ######### 
(* Open file *)
let graph = Gfile.from_file infile in
let int_graph = Graph.map graph int_of_string in
let flow_graph = conv_flow int_graph in
let string_graph = Graph.map flow_graph (fun (a,b)->(string_of_int a)^" /"^(string_of_int b) ) in
let () = Gfile.export outfile string_graph in 
(* note that this is the terminal command to be used to export the dot file in png : dot -Tpng your-dot-file > some-output-file *)
()
 ######## *)

(* ######## test maj_path (Export in dot) ######### *)
(* Open file *)
let graph = Gfile.from_file infile in
let int_graph = Graph.map graph int_of_string in
let listpath = Ford.find_path int_graph [] source target in
let test_graph = maj_path int_graph listpath source in
let string_graph = Graph.map test_graph string_of_int in
let () = Gfile.export outfile string_graph in 
(* note that this is the terminal command to be used to export the dot file in png : dot -Tpng your-dot-file > some-output-file *)
let rec print_listpath listpath = match listpath with
	|[]-> ""
	|(x,lbl)::rest-> "noeud "^x^", cout "^(string_of_int lbl)^"\n\n"^(print_listpath rest)
in Printf.printf "%s ------------\n cout_min : %d \n%!" (print_listpath listpath) (cout_min listpath);;
		
(* ######## *)

(* ######## test ford_fulkerson (Export in dot) ######### 
(* Open file *)
let graph = Gfile.from_file infile in
let int_graph = Graph.map graph int_of_string in
let ford_fulk_graph = ford_fulkerson int_graph source target in
let listpath = Ford.find_path int_graph [] source target in
let string_graph = Graph.map ford_fulk_graph string_of_int in
let () = Gfile.export outfile string_graph in 
(* note that this is the terminal command to be used to export the dot file in png : dot -Tpng your-dot-file > some-output-file *)
let rec print_listpath listpath = match listpath with
	|[]-> ""
	|(x,lbl)::rest-> "noeud "^x^", cout "^(string_of_int lbl)^"\n\n"^(print_listpath rest)
in Printf.printf "%s ------------\n cout_min : %d \n%!" (print_listpath listpath) (cout_min listpath);;
 ######## *)

(* ######## Export in dot ######### 
(* Open file *)
let graph = Gfile.from_file infile in
let () = Gfile.export outfile graph in 
(* note that this is the terminal command to be used to export the dot file in png : dot -Tpng your-dot-file > some-output-file *)
()
 ######## *)


(* ######## Previous export debug ######### 

let testgraph = (add_node (add_node (add_node empty_graph "n1") "n2") "n3");;
let testgraph2 = (add_arc (add_arc (add_arc (add_arc testgraph "n1" "n2" "a12") "n2" "n1" "a21") "n2" "n3" "a23") "n1" "n3" "a13");;
export "~/Documents/4A/Ocaml/Project/dot_out" testgraph;;
export "~/Documents/4A/Ocaml/Project/dot_out2" testgraph2;;
 ######## *)


(* ######## Previous map debug ######### 

let f x = int_of_string x;;
map testgraph2 f;;
 ######## *)
