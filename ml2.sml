(* Patterns you already know *)
fun f n = n * n;

fun f (a, b) = a * b;

(* Underscore as a pattern *)
fun f _ = "yes";

f 34.5;

f [];

(* Constants as Patterns *)
fun f 0 = "yes"; (* throws match nonexhaustive warning *)

f 0;

(* List of Patters as Patterns *)
fun f [a, _] = a;

f [#"f", #"g"];

(* Cons of Patterns as a Pattern *)
fun f (x::xs) = x;

f [1, 2, 3]

(* Multiple Patterns for Functions *)
fun f 0 = "zero"
|   f 1 = "one";

f 1;

(* Overlapping Patterns *)
fun f 0 = "zero"
|   f _ = "non-zero";

f 0;

f 34;

(* Equivalent defs *)
fun f 0 = "zero"
|   f _ = "non-zero"

fun f n =
  if n = 0 then "zero"
  else "non-zero";

(* Pattern Matching Examples *)
fun fact 0 = 1
|   fact n = n * fact (n - 1);

fun reverse nil = nil
|   reverse (first::rest) =
      reverse rest @ [first];

(* Add up all elements of a list *)
fun f nil = 0
|   f (first::rest) = first + f rest;

(* Counting the true values in a list *)
fun f nil = 0
|   f (true::rest) = 1 + f rest
|   f (false::rest) = f rest;

(* Making a new list of integers in which each is one greater than in original list *)
fun f nil = nil
|   f (first::rest) = first + 1 :: f rest;

(* polyEqual warning *)
fun eq (a, b) = if a = b then 1 else 0;

eq (1, 3);

eq ("abc", "abc");

(* Local Variable Defs *)
let val x = 1 val y = 2 in x + y end;

x; (* Error *)

(* Proper indentation for Let *)
let
  val x = 1
  val y = 2
in
  x + y
end

(* Long Expressions with let *)
fun days2ms days =
  let
    val hours = days * 24.0
    val minutes = hours * 60.0
    val seconds = minutes * 60.0
  in
    seconds * 1000.0
  end;

(* Patterns with let *)
fun halve nil = (nil, nil)
|   halve [a] = ([a], nil)
|   halve (a::b::cs) =
      let
        val (x, y) = halve cs
      in
        (a::x, b::y)
      end;

(* halve at work *)
halve [1];
halve [1, 2];
halve [1, 2, 3, 4, 5, 6];

(* MergeSort *)
fun merge (nil, ys) = ys
|   merge (xs, nil) = xs
|   merge (x::xs, y::ys) =
      if (x < y) then x :: merge(xs, y::ys)
      else y :: merge(x::xs, ys);

(* Merge at work *)
merge ([2], [1, 3]);
merge ([1,3,4,7,8],[2,3,5,6,10])

fun mergeSort nil = nil
|   mergeSort [a] = [a]
|   mergeSort theList =
      let
        val (x, y) = halve theList
      in
        merge(mergeSort x, mergeSort y)
      end;

mergeSort [4, 3, 2, 1];
mergeSort [4,2,3,1,5,3,6];

(* Nested Function Definitions *)
fun mergeSort nil = nil
|   mergeSort [e] = [e]
|   mergeSort theList =
      let
        (* From the given list make a pair of listsum
         * (x, y), where half the elements of the
         * original are in x and half are in y. *)
        fun halve nil = (nil, nil)
        |   halve [a] = ([a], nil)
        |   halve (a::b::cs) =
              let
                val (x, y) = halve cs
              in
                (a::x, b::y)
              end;

        (* Merge two sorted lists of integers into
         * a single sorted list. *)
        fun merge (nil, ys) = ys
        |   merge (xs, nil) = xs
        |   merge (x::xs, y::ys) =
              if (x < y) then x :: merge(xs, y::ys)
              else y :: merge(x::xs, ys);

        val (x, y) = halve theList
      in
        merge(mergeSort x, mergeSort y)
      end;
