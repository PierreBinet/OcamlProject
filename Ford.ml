let convFlow x = (0, int_of_string x);;

let rec indiceNode gr n= match gr with
  |[]-> raise Not_found
  |(n,_)::rest->0
  |_::rest-> 1+(indiceNode rest n)

;;


let findSource gr = nth gr (indiceNode (find (let f x = (x==source)) gr))
;;

nth

let rec find_path gr source target pathlist =
  match gr with
    |[]->None
    |(source,out_arc_src)::(target,_)::[]->(let rec aux1 out_arc _src = match out_arc _src with
                                              |[]->None
                                              |(target,_)::rest->Some [target]
                                              |_-> aux1 rest )
    |(source,out_arc_src)::rest->
    |_->





