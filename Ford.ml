open Graph
open Gfile

let convFlow x = (0, int_of_string x);;

let rec find_path (gr: int graph) (visited: (id*int) list) (id1:id) (id2:id) =
  let rec path_aux = function
    |[] -> []
    |(x,y)::rest-> 
        if (x == id2)
        then (List.append visited [(x, y)])
        else if (List.exists (fun (a,_) -> if a=x then true else false) visited)
        then 
          path_aux rest
        else 
        	if ((find_path gr (List.append visited [(x,y)] ) x id2) != [])
			then (find_path gr (List.append visited [(x,y)]) x id2)
			else path_aux rest
  in
    path_aux (out_arcs gr id1);;

(*let rec Ford_Fulkerson (gr: int graph) (visited: id list) (id1:id) (id2:id) =*)
