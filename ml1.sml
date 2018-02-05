(* Basics *)
1 + 2 * 3; (* all lines must end with a semicolon (;) *)

(* Constants *)
1234; (* integer number *)
123.4; (* real number *)
true; (* boolean true literal *)
false; (* boolean false literal *)

"fred"; (* string literal *)
"H"; (* string literal *)
#"H"; (* character literal *)

(* Operators *)
~ 1 + 2 - 3 * 4 div 5 mod 6; (* integer negation, addition, subtraction, multiplication, division, and remainder *)

~ 1.0 + 2.0 - 3.0 * 4.0 / 5.0; (* real negation, addition, subtraction, multiplication, and division *)

"bibity" ^ "bobity" ^ "boo"; (* String concatenation *)

2 < 3; (* true *)
1.0 <= 1.0; (* true *)
#"d" > #"c"; (* true *)
"abce" >= "abd"; (* false *)

1 < 2 orelse 3 > 4; (* boolean orelse operator *)
1 < 2 andalso not (3 < 4); (* boolean andalso and the not operators *)

(* Conditional Expressions *)
if 1 < 2 then #"x" else #"y"; (* x *)

if 1 > 2 then 34 else 56; (* 56 *)

(* Type Conversion and Function Application *)
1 * 2; (* 2 : int *)
1.0 * 2.0; (* 2.0 : real *)

real(123); (* 123.0 : real *)
floor(3.6); (* 3 : int *)
floor 3.6; (* 3 : int *)
str #"a"; (* "a" : string *)

(* Variable Definition *)
val x = 1 + 2 * 3; (* x = 7 : int *)
x; (* 7 : int *)

val y = if x = 7 then 1.0 else 2.0; (* y = 1.0 : real *)

val fred = 23; (* fred = 23 : int *)
fred; (* 23 : int *)
val fred = true; (* fred = true : bool *)
fred; (* true : bool *)

(* Tuples and Lists *)
val barney = (1 + 2, 3.0 * 4.0, "brown"); (* int * real * string *)

val point1 = ("red", (300, 200)); (* string * (int * int) *)

#2 barney; (* 12.0 : real *)
#1 (#2 point1); (* 300 : int *)

[1, 2, 3]; (* : int list *)
[1.0, 2.0]; (* : real list *)
[true]; (* : bool list *)

[(1, 2), (1, 3)]; (* : (int * int) list *)
[[1, 2, 3], [1, 2]]; (* : int list list *)

val x = (1, 2, 3); (* : int * int * int *)
val y = [1, 2, ,3]; (* : int list *)

[]; (* empty list, has type : 'a list *)
nil; (* nil, has type : 'a list *)

null []; (* null operator, tests if a list is empty *)
null [1, 2, 3]; (* false *)

[1, 2, 3] @ [4, 5, 6]; (* list concatenation operator, @, yields: [1,2,3,4,5,6] *)

val x = #"c" :: []; (* cons operator, ::, adds an item to the head of a list *)

val y = #"b" :: x; (* [#"b", #"c"] *)

val z = #"a" :: y; (* [#"a", #"b", #"c"] *)

val z = 1 :: 2 :: 3 :: []; (* [1, 2, 3] *)

hd z; (* the head of z: 1 *)
tl z; (* the tail of z: [2, 3] *)
tl(tl z); (* the tail of the tail of z: [3] *)
tl(tl(tl z)) (* the tail of the tail of the tail of the tail of z: [] *)

explode "hello"; (* explode converts a string to a list of characters: [#"h", #"e", #"l", #"l", #"o"] *)
implode [#"h", #"i"]; (* implode converts a char list to a string: "hi" *)

(* Function Definitions *)
fun firstChar s = hd (explod s); (* fn : string -> char *)

firstChar "abc"; (* #"a" *)

fun quot(a, b) = a div b; (* fn : int * int -> int *)

quot(6, 2); (* 3 *)

fun fact n = (* fn : int -> int *)
  if n = 0 then 1
  else n * fact(n - 1);

fact 5; (* 120 *)

fun listsum x =
  if null x then 0
  else hd x + listsum(tl x);

listsum [1, 2, 3, 4, 5]; (* 15 *)

fun length x =
  if null x then 0
  else 1 + length (tl x);

length [true, false, true]; (* 3 *)
length [4.0, 3.0, 2.0, 1.0]; (* 4 *)

fun reverse L =
  if null L then nil
  else reverse(tl L) @ [hd L];

reverse [1, 2, 3]; (* [3, 2, 1] *)

(* Types and Type Annotations *)
fun prod(a, b) = a * b; (* fn: int * int -> int *)
fun prod(a:real, b:real) : real = a * b (* fn: real * real -> real *)
