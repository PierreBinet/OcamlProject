open Graph
open Gfile

let convFlow x = (0, int_of_string x);;

let rec find_path (gr: int graph) (visited: id list) (id1:id) (id2:id) =
  let rec path_temp = function
    |[]-> List.append visited [id2]
    |(x,_)::rest-> 
        if (x == id2)
        then (List.append visited [id1])
        else if (List.mem x visited)
        then 
          path_temp rest
        else 
          (find_path gr (List.append visited [id1]) x id2)
  in
    path_temp (out_arcs gr id1);;
