:- use_module(library(clpfd)).

:- use_rendering(sudoku).


sudoku(Matrix) :-
    structure(Matrix),
	rows_constraint(Matrix),
    cols_constraint(Matrix),
	blocks_constraint(Matrix).

structure(Matrix) :-
    length(Matrix, 9),						% Matrix is a list of 9 elements (representing the rows)
	maplist(same_length(Matrix), Matrix),	% each element of Matrix is a list with the same length of Matrix
	append(Matrix, Nums),					% Matrix is a concatenation of lists composed by Nums
    Nums ins 1..9.							% Nums is the finite domain of integers [1,9]

rows_constraint(Matrix) :-
    maplist(all_distinct, Matrix).			% each list in Matrix (row) contains distinct elements

cols_constraint(Matrix) :-
    transpose(Matrix, Transpose),			% Transpose is the transpose of Matrix
    maplist(all_distinct, Transpose).		% each list in Transpose (col) contains distinct elements

blocks_constraint(Matrix) :-
	Matrix = [R1,R2,R3,R4,R5,R6,R7,R8,R9],
	maplist(blocks, [[R1,R2,R3], [R4,R5,R6], [R7,R8,R9]]).			% each triplet of blocks is checked

blocks([[], [], []]).
blocks([[N1,N2,N3|Rest1], [N4,N5,N6|Rest2], [N7,N8,N9|Rest3]]) :-	% selection of the block elements
	all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),						% the block elements are distinct
	blocks([Rest1, Rest2, Rest3]).

problem([[_,_,_, _,_,_, _,_,_],
         [_,_,_, _,_,3, _,8,5],
         [_,_,1, _,2,_, _,_,_],
         [_,_,_, 5,_,7, _,_,_],
         [_,_,4, _,_,_, 1,_,_],
         [_,9,_, _,_,_, _,_,_],
         [5,_,_, _,_,_, _,7,3],
         [_,_,2, _,1,_, _,_,_],
         [_,_,_, _,4,_, _,_,9]]).


/* QUERY
?- problem(Sudoku), sudoku(Sudoku).
*/