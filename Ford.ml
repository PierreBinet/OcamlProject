let convFlow x = (0, int_of_string x);;
let testgraph = (add_node (add_node (add_node (add_node empty_graph "n1") "n2") "n3")"n4");;
let testgraph2 =(add_arc (add_arc (add_arc testgraph "n1" "n2" 5) "n2" "n3" 4) "n3" "n4" 6);;

type path2 = id list;;

let rec find_path (gr: int graph) (visited: path2) (id1:string) (id2 :string)=
let rec findSource gr id1 = match gr with
|[]->[]
|(x,outarc)::rest->(if (x==id1) then outarc else (findSource rest id1))
in
let out_arc = (findSource gr id1) in
let rec path_temp out_arc = match out_arc with
|[]-> []
|(id2,_)::rest-> (List.append visited [id1])
|(x,_)::rest->
if (not (List.mem x visited)) 
then 
(path_temp rest;
find_path (gr (List.append visited [id1]) x id2))
else 
(path_temp rest)
