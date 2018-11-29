open Graph
open Gfile
open Printf
   

(*******************  Flow Graph  *******************)
val convFlow: string -> int * int

(* A path is a list of nodes. *)
(*type pathlist = id list*)

(* find_path gr forbidden id1 id2 
 *   returns None if no path can be found.
 *   returns Some p if a path p from id1 to id2 has been found. 
 *
 *  forbidden is a list of forbidden nodes (they have already been visited)
 *)
val find_path: int graph -> (id*int) list -> id -> id -> (id*int) list

val cout_min: (id*int) list -> int

val init_flow: int graph -> (int*int) graph
