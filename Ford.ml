let convFlow x = (0, int_of_string x);;


let rec find_path gr source target (pathlist: 'a option list) =
  let rec findSource gr (source: string) = match gr with
    |[]->raise Not_found
    |(x,outarc)::rest->(if (x==source) then outarc else (findSource rest source))
  in
    match (findSource gr source) with
      |[]->[None]
      |(x,_)::rest->
          if (x==target) then
            (List.append pathlist [Some x])
          else
            (List.append pathlist (find_path gr x target pathlist))



