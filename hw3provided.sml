(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

fun only_capitals xs =
    List.filter (fn x =>Char.isUpper(String.sub(x,0))) xs

fun longest_string1 xs =
    foldl (fn (x,y)=>if String.size x > String.size y then x else y) "" xs

fun longest_string2 xs =
    foldl (fn (x,y)=>if String.size x >= String.size y then x else y) "" xs

fun longest_string_helper f xs = 
    foldl (fn (x,y)=>if f(String.size x,String.size y)then x else y) "" xs

val longest_string3 = longest_string_helper (fn(x,y)=> x>y)
val longest_string4 = longest_string_helper (fn(x,y)=> x>=y)


val longest_capitalized = longest_string1 o only_capitals

val rev_string = String.implode o List.rev o String.explode

fun first_answer f xs =
case xs of
      [] =>  raise NoAnswer
      | x::xs'=> case f x of 
		   NONE => first_answer f xs'
		  |SOME v=>v


fun all_answers f xs =
let fun aux (xs, acc) =
	case xs of  [] => SOME acc
		 | x::xs' => case f x of 
				 NONE => NONE
			      | SOME v  => aux( xs', v@acc )
							 
        in aux (xs, [])
	end

fun count_wildcards pat= 
    g (fn()=>1) (fn(_)=>0) pat

fun count_wild_and_variable_lengths pat =
    g (fn()=>1) String.size pat

fun count_some_var (str,pat) =
    g (fn() =>0) (fn s => if s=str then 1 else 0) pat 


fun check_pat pat = 
let 
    fun getvlist pat = case pat of
		       Variable v => [v]
		      |TupleP ps => foldl (fn(pat',acc)=> acc @ getvlist pat' ) [] ps 
		      | _ =>[] 		
    fun isrepeat xs = case xs of
			  [] => false
			 |x::xs' => List.exists (fn x' => x=x') xs' 
				    orelse isrepeat xs'
 in 
   (not o isrepeat o  getvlist) pat
end


fun match (v,pat) =
    case (v,pat) of
        (_,Wildcard) => SOME []
      | (var, Variable s) => SOME [(s,var)]
      | (Unit, UnitP) => SOME []
      | (Const i, ConstP i') => if i=i' then SOME [] else NONE
      | (Tuple tp, TupleP tp') => if length tp = length tp' 
				  then all_answers match (ListPair.zip(tp,tp'))
				  else NONE
      | (Constructor(s,va), ConstructorP(s',pat')) => if s=s' then match (va, pat')
                                                      else NONE
      | _ => NONE;

fun first_match v pats = SOME (first_answer (fn pat =>match pat) pats)
                       handle NoAnswer => NONE
