open Graph
open Gfile

let convFlow x = (0, int_of_string x);;

let rec find_path (gr: int graph) (visited: (id*int) list) (id1:id) (id2:id) =
  let rec path_aux = function
    |[] -> []
    |(x,y)::rest-> 
        if (x = id2)
        then (List.append visited [(x, y)])
        else if (List.exists (fun (a,_) -> a=x) visited)
        then 
          path_aux rest
        else 
          match (find_path gr (List.append visited [(x,y)] ) x id2) with
            				|[] -> path_aux rest
            				|l -> l 
  in
    path_aux (out_arcs gr id1);;

(*
let rec ford_fulkerson (gr: int graph) (id1:id) (id2:id) =
	let rec appel_rec_find_path = function
		visited = (find_path gr [] id1 id2)
		gr = 
*)

(*let rec cout_min (l : (id*int) list)->(i : int);; le min doit etre positive*)
let rec cout_min (l : (id*int) list) = match l with
  |[]-> 0
  |(a,b)::[]-> b
  |(x,y)::rest-> (min y (cout_min rest))
;;

(*let rec sub_arc (l : (id*int) list) ->((l : (id*int) list) );; listpath = newlistpath, avec maj du coup des arcs : newcout=oldcout-coutmin*)
(*let graph_inv (gr) ->(gr) nouveau graph : ajout de tous les inv_graph initialisé à cout 0*)
(*let create_graph_flow (gr) -> (gr);; graph de retour avec cout en format tuple (flot,capa), avec flot initialisé a 0*)
let init_flow gr = 
  let f x = (0,x)
  in
    map gr f;;


