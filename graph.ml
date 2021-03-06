type id = string

type 'a out_arcs = (id * 'a) list

(* A graph is just a list of pairs: a node & its outgoing arcs. *)
type 'a graph = (id * 'a out_arcs) list

exception Graph_error of string

let empty_graph = []

let node_exists gr id = List.mem_assoc id gr

let out_arcs gr id =
  try List.assoc id gr
  with Not_found -> raise (Graph_error ("Node " ^ id ^ " does not exist in this graph."))

let find_arc gr id1 id2 =
  let out = out_arcs gr id1 in
    try Some (List.assoc id2 out)
    with Not_found -> None

let add_node gr id =
  if node_exists gr id then raise (Graph_error ("Node " ^ id ^ " already exists in the graph."))
  else (id, []) :: gr

let add_arc gr id1 id2 lbl =

  (* Existing out-arcs *)
  let outa = out_arcs gr id1 in

  (* Update out-arcs.
   * remove_assoc does not fail if id2 is not bound.  *)
  let outb = (id2, lbl) :: List.remove_assoc id2 outa in

  (* Replace out-arcs in the graph. *)
  let gr2 = List.remove_assoc id1 gr in
	((id1, outb) :: gr2)

let add_int_arc gr id1 id2 lbl =

  (* Existing out-arcs *)
  let outa = out_arcs gr id1 in

  (* Update out-arcs.
   * remove_assoc does not fail if id2 is not bound.  *)
  let outb = (id2, lbl) :: List.remove_assoc id2 outa in

  (* Replace out-arcs in the graph. *)
  let gr2 = List.remove_assoc id1 gr in
	match lbl with
		|0 -> ((id1, List.remove_assoc id2 outa) :: gr2)
		|x ->((id1, outb) :: gr2)

let rm_arc (gr: 'a graph) id1 id2 =

  (* Existing out-arcs *)
  let outa = out_arcs gr id1 in

  (* Replace out-arcs in the graph. *)
  let (gr2: 'a graph) = List.remove_assoc id1 gr in
    ((id1, List.remove_assoc id2 outa) :: gr2)

let v_iter gr f = List.iter (fun (id, out) -> f id out) gr

let v_fold gr f acu = List.fold_left (fun acu (id, out) -> f acu id out) acu gr

let rec aux arc f = match arc with
  |[] -> []
  |(x,y)::rest -> (x,(f y))::(aux rest f);;

let rec map gr f = match gr with
  |[] -> []
  |(x,y)::rest -> (x, aux y f)::(map rest f);;

let rec maj_flow_path (gr: int graph) (gr1: int graph) (gr2: int graph) (gr3: string graph)=
	(*conversion des int option en int*)
	let aux1 = function
  	  |None->0
 	  |Some x->x
	in
	  let rec flow_aux n_outarcs grint grstring id= 
		 match n_outarcs with
		   |[]-> maj_flow_path grint gr1 gr2 grstring
		   |(n,lbl)::next-> if (aux1 (find_arc gr2 id n) = 0) then flow_aux next grint grstring id else flow_aux next grint (add_arc grstring id n ((string_of_int (aux1 (find_arc gr1 n id)))^"/"^((string_of_int ((aux1 (find_arc gr1 n id))+lbl))))) id 
	  in
		 match gr with
		   |[] -> gr3
		   |(node, n_outarcs)::xs -> flow_aux n_outarcs xs gr3 node

	;;

(*let testgraph = (add_node (add_node (add_node (add_node empty_graph "n1") "n2") "n3")"n4");;
  let testgraph2 =(add_arc (add_arc (add_arc (add_arc testgraph "n1" "n2" 5) "n2" "n3" 4) "n3" "n4" 6) "n1" "n3" 8);;*)
