(* Read a graph from a file,
 * Write a graph to a file. *)

open Graph

type path = string

(* Values are read as strings. *)
val from_file: path -> string graph

(* Similarly, we write only a string graph.
 * Use Graph.map if necessary to prepare the input graph. *)
val write_file: path -> string graph -> unit

(*Takes a string graph, and writes a .dot file at the given path corresponding to this graph. *)
val export: path -> string graph -> unit

