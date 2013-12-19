only_capitals ["this","Is","a","Test","hello","World"];
only_capitals ["This","Is","the","Second","Test"];
only_capitals ["This","Is","All","Capital"];
only_capitals ["there","is","no","capital"];

longest_string1 [];
longest_string1 ["one","two","three"];
longest_string1 ["one","two","three","four","five","six","seven"];
longest_string1 ["one","two","three","four","five","six","seven","eleven"];

longest_string2 [];
longest_string2 ["one","two","three"];
longest_string2 ["one","two","three","four","five","six","seven"];
longest_string2 ["one","two","three","four","five","six","seven","eleven"];

longest_string3 ["one","two","three"];
longest_string3 ["one","two","three"];
longest_string3 ["one","two","three","four","five","six","seven"];
longest_string3 ["one","two","three","four","five","six","seven","eleven"];

longest_string4 [];
longest_string4 ["one","two","three"];
longest_string4 ["one","two","three","four","five","six","seven"];
longest_string4 ["one","two","three","four","five","six","seven","eleven"];


longest_capitalized ["one","two","Three","four","five","six","Seven","eleven"];
longest_capitalized ["one","two","Three","four","five","six","Seven","Eleven"];

rev_string "hello";
rev_string "world";
rev_string "bird";
rev_string "apple";

fun grinc x = if x > 0 then SOME (x+1) else NONE;
 
 first_answer grinc [~1,~2,0,3,5,6,9];
(* first_answer grinc [~1,~2,0];*)

fun negv x = if x < 0 then SOME [x] else NONE;

all_answers negv [~1,~2,0,3,5,6,9];
all_answers negv [~1,~2,0];
all_answers negv [~1,~1,~2];

 
count_wildcards Wildcard;
count_wildcards (Variable "Wildcard") ;
count_wildcards UnitP ;
count_wildcards (ConstP 42) ;
count_wildcards (TupleP [Wildcard, Wildcard, Wildcard]) ; 
count_wildcards (TupleP [ConstP 42, UnitP, Variable "s"]) ; 
count_wildcards (ConstructorP("s",TupleP [Wildcard, Wildcard, Wildcard])) ;
count_wildcards (ConstructorP("Wildcard",TupleP [ConstP 42, UnitP, Variable "s"])) ;


count_wild_and_variable_lengths Wildcard;
count_wild_and_variable_lengths (Variable "Wildcard") ;
count_wild_and_variable_lengths UnitP ;
count_wild_and_variable_lengths (ConstP 42) ;
count_wild_and_variable_lengths (TupleP [Wildcard, Wildcard, Wildcard]) ; 
count_wild_and_variable_lengths (TupleP [ConstP 42, UnitP, Variable "s"]) ; 
count_wild_and_variable_lengths (ConstructorP("s",TupleP [Wildcard, Wildcard, Wildcard])) ;
count_wild_and_variable_lengths (ConstructorP("Wildcard",TupleP [ConstP 42, UnitP, Variable "s"])) ;


count_some_var ("Wildcard",(Variable "Wildcard")) ;
count_some_var ("wildcard",(Variable "Wildcard")) ;
count_some_var ("Wildcard",ConstructorP("Wildcard",TupleP [(Variable "wildcard"), (Variable "Wildcard"),(Variable "Wildcard")])) ;

check_pat(TupleP [Wildcard, Wildcard, Wildcard]);
check_pat(TupleP [Variable "a", Variable "b", Variable "c"]);
check_pat(ConstP 42);
check_pat(Variable "a");
check_pat(Wildcard);
check_pat(TupleP [Variable "a", Variable "a", Variable "a"]);

match(Const 42, TupleP [Wildcard, Wildcard, Wildcard]);
match(Const 42, TupleP [ConstP 42, Wildcard, Wildcard]);
match(Const 42, ConstP 42);
match(Tuple[Unit], TupleP[UnitP]);
match (Const 42, Variable "x") ;
match(Constructor("a",Const 42),ConstructorP("a",ConstP 42)) ;
match(Constructor("a",Const 42),ConstructorP("a",ConstP 1)) ;
match(Constructor("a",Const 42),Wildcard) ;
match(Constructor("a",Unit),ConstructorP("a",Variable "b"));
match(Tuple[Unit],Variable "x");
match(Tuple[Unit,Unit],Variable "x");
match(Tuple[Unit,Unit],ConstP 42);