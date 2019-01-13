open Graph
open Gfile
open Printf
   

(*******************  Flow Graph  *******************)
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

val conv_flow: int graph -> (int*int) graph


(*maybe aux1 shouldn't be public ?*)
val aux1: int option -> int

val maj_inv_arc: int graph -> id -> id -> (id*int) list -> (id*int) list -> int -> int graph

val maj_path: int graph -> (id*int) list -> id -> int-> int graph

val rm_arc:'a graph -> id -> id -> 'a graph

val maj_flow_path: int graph -> string graph -> string graph

val ford_fulkerson: int graph -> id -> id -> int graph

