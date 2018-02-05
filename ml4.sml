(* Defining your own types *)
datatype day = Mon | Tue | Wed | Thu | Fri | Sat | Sun;

fun isWeekDay x = not (x = Sat orelse x = Sun);

isWeekDay Mon;

isWeekDay Sat;

(* No Parameters *)
datatype day = Mon | Tue | Wed | Thu | Fri | Sat | Sun;

(* Strict Typing *)
datatype flip = Heads | Tails;

fun isHeads x = (x = Heads);

isHeads Tails;

(* Data Constructos in Patterns *)
fun isWeekDay Sat = false
|   isWeekDay Sun = false
|   isWeekDay _ = true;

(* Wrappers *)
datatype exint = Value of int | PlusInf | MinusInf;

PlusInf;

MinusInf;

Value;

val x = Value 3;

(* Patterns with Data Constructors *)
val (Value y) = x;

(* An Exhaustive Pattern *)
val s = case x of
          PlusInf => "infinity" |
          MinusInf => "-infinity" |
          Value y => Int.toString y;

(* Pattern Matching Function *)
fun square PlusInf = PlusInf
|   square MinusInf = PlusInf
|   square (Value x) = Value (x * x);

square MinusInf;
square (Value 3);

(* A Peek at Exception Handling *)
fun square PlusInfo = PlusInf
|   square MinusInf = PlusInf
|   square (Value x) = Value (x * x)
      handle Overflow => PlusInf;

square (Value 10000);
square (Value 100000);

(* Type Constructors With Parameters *)
datatype 'a option = NONE | SOME of 'a;

SOME 4;
SOME 1.2;
SOME "pig";

(* Uses for Option *)
fun optdiv a b =
  if b = 0 then NONE else SOME (a div b);

optdiv 7 2;

optdiv 7 0;

(* Longer Example: bunch *)
datatype 'x bunch =
  One of 'x |
  Group of 'x list;

One 1.0;
Group [true, false];

(* Example Polymorphism *)
fun size (One _) = 1
|   size (Group x) = length x;

size (One 1.0);
size (Group [true, false]);

(* Example No Polymorphism *)
fun sum (One x) = x
|   sum (Group xlist) = foldr op + 0 xlist;

sum (One 5);
sum (Group [1,2,3]);

(* Recursively Defined Type Constructors *)
datatype intlist =
  INTNIL |
  INTCONS of int * intlist;

(* Constructing those values *)
INTNIL;

INTCONS (1, INTNIL);

INTCONS (1, INTCONS (2, INTNIL));

fun intlistLength INTNIL = 0
|   intlistLength (INTCONS(_, tail)) =
      1 + (intlistLength tail);

fun listLength nil = 0
|   listLength (_::tail) =
      1 + (listLength tail);

(* Parametric List Type *)
datatype 'element mylist =
  NIL |
  CONS of 'element * 'element mylist;

CONS (1.0, NIL);
CONS (1, CONS(2, NIL));

fun myListLength NIL = 0
|   myListLength (CONS(_, tail)) =
      1 + myListLength(tail);

fun addup NIL = 0
|   addup (CONS(head, tail)) =
      head + addup tail;

(* foldr for mylist *)
fun myfoldr f c NIL = c
|   myfoldr f c (CONS(a, b)) =
      f(a, myfoldr f c b);


(* A Peek at defining operators *)
infixr 5 CONS;
1 CONS 2 CONS NIL;

(* A Polymorphic Binary Tree *)
datatype 'data tree =
  Empty |
  Node of 'data tree * 'data * 'data tree;

(* Constructing a tree *)
val treeEmpty = Empty;
val tree2 = Node(Empty, 2, Empty);
val tree123 = Node(Node(Empty, 1, Empty),
                   2,
                   Node(Empty, 3, Empty));

(* Increment all elements *)
fun incall Empty = Empty
|   incall (Node (x, y, z)) =
      Node(incall x, y + 1, incall z);

incall tree123;

(* Add Up the Elements *)
fun sumall Empty = 0
|   sumall (Node(x, y, z)) =
      sumall x + y + sumall z;

sumall tree123;

(* Polymorphic List Coversion *)
fun listall Empty = nil
|   listall (Node (x, y, z)) =
      listall x @ y :: listall z;

listall tree123;

(* Tree Search *)
fun isintree x Empty = false
|   isintree x (Node(left, y, right)) =
      x = y
      orelse isintree x left
      orelse isintree x right;

isintree 4 tree123;
isintree 3 tree123;
