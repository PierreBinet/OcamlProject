let convFlow x = (0, int_of_string x);;


let rec find_path gr source target pathlist =
  let rec findSource gr source = match gr with
    |[]-> raise Not_found
    |(source,outarc)::rest->outarc
    |(other,_)::rest->(findSource rest source)
  in
    match (findSource gr source)  with
      |[]->raise Not_found
      |(target,_)::rest-> (List.append pathlist [target])
      |(other,_)::rest-> (List.append pathlist (find_path gr other target pathlist))



