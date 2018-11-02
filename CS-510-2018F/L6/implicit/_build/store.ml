  type 'a t = { mutable data: 'a array; mutable size: int}
  (* data is declared mutable so the store may be resized *)

  let empty_store i v = { data=Array.make i v; size=0 }

  let get_size st = st.size

  let enlarge_store st value =
    let new_array = Array.make (st.size*2) value
    in Array.blit st.data 0 new_array 0 st.size;
    st.data<-new_array
      
let new_ref st value =
  if Array.length (st.data)=st.size      
  then enlarge_store st value
  else ();
  begin
    st.data.(st.size)<-value;
    st.size<-st.size+1;
    st.size-1
  end


  let deref st ref =
    st.data.(ref)

  let set_ref st ref value =
  if ref>=st.size
  then failwith "Index out of bounds"
  else 
    st.data.(ref)<-value
    
  let rec take n = function
    | [] -> []
    |  x::xs when n>0 -> x::take (n-1) xs
    | x::xs -> []
             
  let store_to_list st =
    take st.size @@ Array.to_list @@ st.data
