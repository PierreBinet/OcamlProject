open Graph
open Gfile

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
let conv_flow gr = 
  let f x = (0,x)
  in
    map gr f;;

let aux1 = function
  |None->0
  |Some x->x
;;

let rec maj_inv_arc gr id1 n l outarc = 
  match (outarc) with
    |[]->gr
    |(a,p)::rest-> if (n=a) then (add_int_arc (add_int_arc gr id1 n (p-(cout_min l))) n id1 ((aux1 (find_arc gr n id1))+(cout_min l)))
        else maj_inv_arc gr id1 n l rest
;;

let rec maj_path gr listpath id1= 
  match listpath with
    |[] -> gr
    |(node,lbl)::rest-> maj_path ( maj_inv_arc gr id1 node listpath (out_arcs gr id1)) rest node
;;

let rec maj_flow_path gr listpath id1=
  let rec maj_arc gr id1 n l outarc = 
    match (outarc) with
      |[]->gr
      |(a,p)::rest-> if (n=a) then (add_int_arc gr id1 n (p-(cout_min l)))
          else maj_inv_arc gr id1 n l rest
  in
    match listpath with
      |[] -> gr
      |(node,lbl)::rest-> maj_flow_path ( maj_arc gr id1 node listpath (out_arcs gr id1)) rest node
;;

let rec ford_fulkerson gr id1 id2 =
  let listinit = []
  in
    match (find_path gr listinit id1 id2) with
      |[]->gr
      |x::xs-> ford_fulkerson (maj_path gr (find_path gr listinit id1 id2) id1) id1 id2

