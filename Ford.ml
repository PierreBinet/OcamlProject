open Graph
open Gfile

let convFlow x = (0, int_of_string x);;

let rec find_path (gr: int graph) (visited: (id*int) list) (id1:id) (id2:id) =
  let find_lbl = function
    |None -> 0
    |Some lbl-> lbl
  in
  let rec path_aux = function
    |[]-> List.append visited []
    |(x,_)::rest-> 
        if (x == id2)
        then (List.append visited [(id2, find_lbl (find_arc gr id1 id2))])
        else if (List.mem (x,find_lbl (find_arc gr id1 x)) visited)
        then 
          path_aux rest
        else 
          (find_path gr (List.append visited [(id1,find_lbl (find_arc gr id1 x))]) x id2)
  in
    path_aux (out_arcs gr id1);;

(*let rec Ford_Fulkerson (gr: int graph) (visited: id list) (id1:id) (id2:id) =*)
