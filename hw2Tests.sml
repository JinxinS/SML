(*
all_except_option ("", ["a","b","c","d"]);
all_except_option ("a", ["a","b","c","d"]);
all_except_option ("b", ["a","b","c","d"]);
all_except_option ("c", ["a","b","c","d"]);
all_except_option ("d", ["a","b","c","d"]);
all_except_option ("d", ["a","a","b","c","d","d"]);
all_except_option ("c", ["a","a","b","c","d","d"]);
all_except_option ("e", ["a","b","c","d"]);
all_except_option ("e", []);


get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"Jeff") = ["Jeffrey","Geoff","Jeffrey"] ;
get_substitutions1([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred")= ["Fredrick","Freddie","F"];
get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],"Jeff") ;(*= ["Jeffrey","Geoff","Jeffrey"] ;*)
get_substitutions2([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],"Fred");(*= ["Fredrick","Freddie","F"];*)

similar_names([["Fred","Fredrick"],["Elizabeth","Betty"],["Freddie","Fred","F"]],{first="Fred", middle="W", last="Smith"}) ;(*=
[{first="Fred", last="Smith", middle="W"},
{first="Fredrick", last="Smith", middle="W"},
{first="Freddie", last="Smith", middle="W"},
{first="F", last="Smith", middle="W"}];*)


card_color (Clubs,Jack);
card_color (Diamonds,Queen);
card_color (Hearts,King);
card_color (Spades,Ace);
card_color (Clubs,Ace);
card_color (Diamonds,King);
card_color (Hearts,Queen);
card_color (Spades,0);


card_value (Clubs,Jack);
card_value (Diamonds,Queen);
card_value (Hearts,King);
card_value (Spades,Ace);
card_value (Clubs,Ace);
card_value (Diamonds,King);
card_value (Hearts,Queen);
card_value (Spades,Num 1);
card_value (Spades,Num 1);
card_value (Spades,Num 2);
card_value (Spades,Num 3);
card_value (Spades,Num 4);
card_value (Spades,Num 5);


remove_card ([(Spades,Num 1),(Spades,Num 4),(Diamonds,Queen),(Hearts,Queen),(Hearts,King),(Clubs,Jack)],(Hearts,Queen),e);
remove_card ([(Spades,Num 1),(Spades,Num 4),(Diamonds,Queen),(Hearts,Queen),(Hearts,King),(Clubs,Jack)],(Clubs,Jack),e);
remove_card ([(Spades,Num 1),(Spades,Num 4),(Diamonds,Queen),(Hearts,Queen),(Hearts,King),(Clubs,Jack)],(Diamonds,Queen),e);
remove_card ([(Spades,Num 1),(Spades,Num 4),(Diamonds,Queen),(Hearts,Queen),(Hearts,King),(Clubs,Jack)],(Spades,Num 1),e);
remove_card ([(Spades,Num 1),(Spades,Num 4),(Diamonds,Queen),(Hearts,Queen),(Hearts,King),(Clubs,Jack)],(Spades,Num 4),e);


all_same_color([]);
all_same_color([(Spades,Num 1)]);
all_same_color([(Spades,Num 1),(Hearts,Num 4)]);
all_same_color([(Spades,Num 1),(Spades,Num 4)]);
all_same_color([(Spades,Num 1),(Spades,Num 4),(Spades,Ace)]);
all_same_color([(Spades,Num 1),(Hearts,Num 4),(Spades,Ace)]);


sum_cards [(Spades,Num 1),(Spades,Num 4),(Diamonds,Queen),(Hearts,Queen),(Hearts,King),(Clubs,Jack)];
sum_cards [(Spades,Num 1),(Spades,Num 1),(Diamonds,Num 3),(Hearts,Num 5),(Hearts,Num 7),(Clubs,Num 9)];
sum_cards [(Spades,Num 1),(Spades,Num 2),(Diamonds,Num 4),(Hearts,Num 6),(Hearts,Num 8),(Clubs,Num 9)];
sum_cards [(Spades,Num 3),(Spades,Num 4),(Diamonds,Num 5),(Hearts,Num 6),(Hearts,Num 7),(Clubs,Num 8)];

score ([],10);
score ([(Spades,Num 1),(Spades,Num 4),(Diamonds,Queen),(Hearts,Queen),(Hearts,King),(Clubs,Jack)],10);
score ([(Spades,Num 1),(Spades,Num 1),(Diamonds,Num 3),(Hearts,Num 5),(Hearts,Num 7),(Clubs,Num 9)],20);
score ([(Spades,Num 1),(Spades,Num 2),(Diamonds,Num 4),(Hearts,Num 6),(Hearts,Num 8),(Clubs,Num 9)],30);
score ([(Spades,Num 3),(Spades,Num 4),(Diamonds,Num 5),(Hearts,Num 6),(Hearts,Num 7),(Clubs,Num 8)],40);
*)


remove_card ([(Hearts,Num 5),(Spades,Num 1)],(Spades,Num 1),e);
remove_card ([(Spades,Num 1),(Hearts,Num 5)],(Spades,Num 1),e);
remove_card ([(Spades,Num 1),(Spades,Num 1),(Spades,Num 2),(Spades,Num 1)],(Spades,Num 1),e);
remove_card ([(Spades,Num 2),(Diamonds,Num 3),(Spades,Num 1),(Hearts,Num 5)],(Spades,Num 1),e);
remove_card ([(Spades,Num 1)],(Spades,Num 0),e);
(*
officiate ([(Spades,Num 1),(Spades,Num 4),(Diamonds,Queen),(Hearts,Queen),(Hearts,King),(Clubs,Jack)],[Draw],10) = 4;
officiate ([(Spades,Num 1),(Spades,Num 4),(Diamonds,Queen),(Hearts,Queen),(Hearts,King),(Clubs,Jack)],[Draw, Draw,Draw,Draw],10) =15;
officiate ([(Spades,Num 1),(Spades,Num 4),(Diamonds,Queen),(Hearts,Queen),(Hearts,King),(Clubs,Jack)],[Draw, Draw],10) = 2;
(*
officiate ([(Spades,Num 1)], [Draw,Discard(Spades,Num 1)],20);
officiate ([(Spades,Num 1),(Spades,Num 4),(Diamonds,Queen),(Hearts,Queen),(Hearts,King),(Clubs,Jack)],[Draw, Discard (Spades, Num 1)],20);
*)
*)