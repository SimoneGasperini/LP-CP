/*
--> unification (parameters passing mechanism) is very powerful
because it performs a bidirectional flow of information
*/


% list(LIST) means that LIST is a list (predicate)
list([]) :- !.
list([_|L]) :-
    list(L).


% member(LIST, EL) means that EL is in LIST
member([E|_], E) :- !.
member([_|L], E) :-
    member(L, E), !.


% append(LIST1, LIST2, LIST) means that LIST is the concatenation of LIST1 and LIST2
append([], L, L) :- !.
append([E|L1], L2, [E|L]) :-
    append(L1, L2, L).


% remove(EL, LIST1, LIST2) means that LIST2 is equal to LIST1 from which EL is removed
remove(E, L1, L2) :-
    append(L, [E|R], L1),
    append(L, R, L2), !.


% first(LIST, FIRST) means that FIRST is the first element in LIST
first([E|_], E) :- !.


% last(LIST, LAST) means that LAST is the last element in LIST
last([E], E) :- !.
last([_|L], E) :-
    last(L, E), !.


% max(LIST, MAX) means that MAX is the maximum element in LIST
max([E], E) :- !.
max([A|L], E) :-
    max(L, E), E >= A, !.
max([A|L], A) :-
    max(L, E), E < A, !.


% min(LIST, MIN) means that MIN is the minimum element in LIST
min([E], E) :- !.
min([A|L], E) :-
    min(L, E), E < A, !.
min([A|L], A) :-
    min(L, E), E >= A, !.


% next(LIST, EL, NEXT) means that NEXT is the element after EL in LIST
next([E,C|_], E, C) :- !.
next([_|L], E, C) :-
    next(L, E, C), !.


% index(LIST, EL, I) means that I is the index of EL in LIST
index([A|_], A, 0) :- !.
index([_|L], A, J) :-
    index(L, A, I), J is I + 1, !.


% len(LIST, LEN) means that LEN is the length of LIST
len([], 0) :- !.
len([_|L], S) :-
    len(L, Z), S is Z + 1, !.


% sum(LIST, SUM) means that SUM is the sum of the elements in LIST
sum([], 0) :- !.
sum([A|L], X) :-
    sum(L, Y), X is Y + A, !.


% mean(LIST, MEAN) means that MEAN is the mean of the elements in LIST
mean([], 0) :- !.
mean(L, M) :-
    sum(L, Sum),
    len(L, Len),
    M is Sum / Len, !.
