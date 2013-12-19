
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* put your solutions for problem 1 here *)
fun all_except_option (s , [])= NONE
  | all_except_option (s ,x::xs)=
    if same_string(x,s)
    then SOME xs
    else
	case all_except_option(s,xs) of
	     NONE=> NONE
	     | SOME ys => SOME (x::ys) 	


fun get_substitutions1 ([],s)=[]
  | get_substitutions1 (x::xs,s)   =
    case all_except_option (s,x) of
	NONE   => get_substitutions1(xs,s)
      | SOME y => y @ get_substitutions1(xs,s)

fun get_substitutions2 ([],s)=[]
  | get_substitutions2 (x::xs,s) =
    let fun aux ([],s,acc)=acc
	  | aux (x'::xs',s,acc)= 		      
	    case all_except_option(s,x')of
		NONE  => aux(xs',s,acc)
	       |SOME y  => aux(xs',s,acc @ y)
    in
	aux(x::xs,s,[])
    end

fun similar_names (lst,{first=x, middle=y,last=z}) = 
let fun aux (first_names,acc) = 
	case first_names of
	    [] => acc 
	 | x'::xs =>aux(xs,acc@[{first=x',middle =y,last=z}])
in
    {first=x, middle=y,last=z}::aux(get_substitutions1(lst,x) , [])
end	       

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove
exception e

(* put your solutions for problem 2 here *)
fun card_color (suit,_)= 
    case suit of 
	(Clubs|Spades) =>Black 
	| _ =>Red 

  
fun card_value (_,rank)=
    case rank of
	Num v => v
	|(Jack|Queen|King)  => 10
	| Ace =>11 			   

fun remove_card (cs ,card , e) =
    case cs of
         c::cs' => if (c = card) then cs' else c::remove_card(cs',card,e)
           | _ => raise e  


fun all_same_color [] = true
  | all_same_color cs =
    case cs of 
	c1::c2::cs'=> (card_color c1  = card_color c2) andalso 
		      all_same_color (c2::cs')
        |_ => true 


fun sum_cards cs =
    let fun aux([],acc) = acc
	  | aux (c::xs,acc) = aux (xs,card_value c+acc)
    in
	aux (cs,0)
    end
	    

fun score (cs,goal) =
    let val sum = sum_cards cs
	val ps = if sum > goal	then 3*(sum-goal) else goal-sum
    in
       if all_same_color cs then ps div 2 else ps
    end



fun officiate (cards,moves,goal)=
let fun proceed (cs,ms,hs) =
	case ms of 
	    []=> score (hs,goal)
	  | (Discard h)::ms' => proceed (cs,ms',remove_card(hs,h,IllegalMove)) 
	  | Draw::ms' => 
	                 case cs of 
                           [] =>score(hs,goal)
		          |c::cs'  => let val hs' = c::hs
					 val sum = sum_cards hs'
				     in
					 if sum > goal then score (hs',goal)
						       else proceed (cs',ms',hs')	  
				     end
in
    proceed (cards,moves,[])
end

