open Graph
open Gfile


(*trouve un path entre deux noeuds*)
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



(*let rec cout_min (l : (id*int) list)->(i : int);; le min doit etre positif | calcul le cout_min du path trouvé*)
let rec cout_min (l : (id*int) list) = match l with
  |[]-> 0
  |(a,b)::[]-> b
  |(x,y)::rest-> (min y (cout_min rest))
;;

let conv_flow gr = 
  let f x = (0,x)
  in
    map gr f;;


(*conversion des int option en int*)
let aux1 = function
  |None->0
  |Some x->x
;;

(*mise a jour des arcs et ajout des arcs inverses : add_int_arc fait la meme chose que add_arc mais en plus il supprime l'arc si jamais son coût est de 0 *)
let rec maj_inv_arc gr id1 n l outarc coutmin= 
  match (outarc) with
    |[]->gr
    |(a,p)::rest-> if (n=a) then (add_int_arc (add_int_arc gr n id1 ((aux1 (find_arc gr n id1))+coutmin)) id1 n (p-coutmin))
        else maj_inv_arc gr id1 n l rest coutmin
;;

(*mise a jour du path*)
let rec maj_path gr listpath id1 coutmin= 
  match listpath with
    |[] -> gr
    |(node,lbl)::rest-> maj_path ( maj_inv_arc gr id1 node listpath (out_arcs gr id1) coutmin) rest node coutmin
;;

(*algorithme final*)
let ford_fulkerson gr id1 id2=
  let gr_init = gr in
  let rec ford_fulkerson_aux gr id1 id2 =
    let listinit = [] in
    let a = (find_path gr listinit id1 id2) in
      match a with
        |[]->gr
        |x::xs-> ford_fulkerson_aux (maj_path gr a id1 (cout_min a)) id1 id2
  in maj_flow_path (ford_fulkerson_aux gr id1 id2) (ford_fulkerson_aux gr id1 id2) gr_init (Graph.map gr_init (function x -> (string_of_int x)^"/"^(string_of_int x)))



