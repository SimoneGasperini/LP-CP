include "globals.mzn";


par int: size;
par int: n = size*size;
array[1..n, 1..n] of par 0..n: input;

array[1..n, 1..n] of var 1..n: sudoku;


constraint
  % fixed input digits
  forall(i in 1..n, j in 1..n where input[i,j] != 0)
    (sudoku[i,j] = input[i,j])
  /\
  % all different digits in each row
  forall(i in 1..n)
    (alldifferent([sudoku[i,j] | j in 1..n]))
  /\
  % all different digits in each column
  forall(j in 1..n)
    (alldifferent([sudoku[i,j] | i in 1..n]))
  /\
  % all different digits in each box
  forall(b1 in 0..size-1, b2 in 0..size-1)
    (alldifferent([sudoku[i+(b1*size),j+(b2*size)] | i in 1..size, j in 1..size]))
  ;

solve satisfy;


output
  ["Solution ="];

output
  [
  if (j mod n = 1 /\ i != 1) then "\n" else "" endif ++
  if (j mod size = 1 /\ j != 1) then "   " else "" endif ++
  if (i mod size = 1 /\ j = 1) then "\n" else "" endif ++
  show_int(3, sudoku[i,j]) | i in 1..n, j in 1..n
  ];
