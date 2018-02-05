(* More Pattern Matching *)

(* Case Expressions *)
case 1 + 1 of
   3 => "three" |
   2 => "two" |
   _ => "hmm";

(* Another example *)
val x = 1::2::3;
case x of
   _::_::c::_ => c |
   _::b::_ => b |
   a::_ => a |
   nil => 0;

(* Predefined Functions *)
ord;

~;

(* Defining Functions *)
val x = ~;

x 3;

(* Anonymous Functions *)
fun f x = x + 2;

f 1;

(* Anonymous Function *)
fn x => x + 2;

(fn x => x + 2) 1;

(* Equivalent Effects *)
fun f x = x + 2;
val f = fn x => x + 2;

(* The op Keyword *)
op *;

(* Currrying *)
fun f (a, b) = a + b;

fun g a = fn b => a + b;

f (2, 3);

g 2 3;

val add2 = g 2;

add2 3;

add2 10;

(* Multiple Curried Parameters *)
fun f (a, b, c) = a + b + c;

fun g a = fn b => fn c => a + b + c

f (1, 2, 3);

g 1 2 3;

(* Easier notation for currying *)
fun f a b c d = a + b + c + d;


(* The map function *)
map ~ [1, 2, 3, 4];

map (fn x => x + 1) [1, 2, 3, 4];

map (fn x => x mod 2 = 0) [1, 2, 3, 4];

map (op +) [(1, 2), (3, 4), (5, 6)];

map;

val f = map (op +);

f [(1, 2), (3, 4)];

(* The foldr function *)
foldr (op +) 0 [1, 2, 3, 4];

foldr (op * ) 1 [1, 2, 3, 4];

foldr (op ^) "" ["abc", "def", "ghi"];

foldr (op ::) [5] [1, 2, 3, 4];

(* foldr is curried *)
foldr;

foldr (op +);

foldr (op +) 0;

val addup = foldr (op +) 0;

addup [1,2,3,4,5];

(* The foldl function *)
foldl (op +) 0 [1, 2, 3, 4];

foldl (op * ) 1 [1, 2, 3, 4];

(* foldl vs foldr *)
foldr (op ^) "" ["abc", "def", "ghi"];

foldl (op ^) "" ["abc", "def", "ghi"];

foldr (op -) 0 [1, 2, 3, 4];

foldl (op -) 0 [1, 2, 3, 4];
