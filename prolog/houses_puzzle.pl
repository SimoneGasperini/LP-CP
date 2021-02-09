/*
HOUSES PUZZLE
1) Five colored houses in a row, each with an owner, a pet, cigarettes, and a drink.
2) The English lives in the red house.
3) The Spanish has a dog.
4) They drink coffee in the green house.
5) The Ukrainian drinks tea.
6) The green house is next to the white house.
7) The Winston smoker has a serpent.
8) In the yellow house they smoke Kool.
9) In the middle house they drink milk.
10) The Norwegian lives in the first house from the left.
11) The Chesterfield smoker lives near the man with the fox.
12) In the house near the house with the horse they smoke Kool.
13) The Lucky Strike smoker drinks juice.
14) The Japanese smokes Kent.
15) The Norwegian lives near the blue house.

Who owns the zebra and who drinks water?
*/


% visualize the result in a nice table
:- use_rendering(table,
		 [header(house('Color', 'Owner', 'Pet', 'Cigarettes', 'Drink'))]).


% create the two rule for the two requested goals
zebra_owner(Owner) :-
    houses(Hs),
    member(house(_,Owner,zebra,_,_), Hs).

water_drinker(Owner) :-
    houses(Hs),
    member(house(_,Owner,_,_,water), Hs).

houses(Hs) :-
    % house(Color, Owner, Pet, Cigarettes, Drink)
    length(Hs, 5),													% 1
	member(house(red,english,_,_,_), Hs),							% 2
	member(house(_,spanish,dog,_,_), Hs),							% 3
	member(house(green,_,_,_,coffee), Hs),							% 4
	member(house(_,ukrainian,_,_,tea), Hs),							% 5
	next(house(green,_,_,_,_), house(white,_,_,_,_), Hs),			% 6
	member(house(_,_,serpent,winston,_), Hs),						% 7
	member(house(yellow,_,_,kool,_), Hs),							% 8
	middle(house(_,_,_,_,milk), Hs),								% 9
	first(house(_,norwegian,_,_,_), Hs),							% 10
	next(house(_,_,_,chesterfield,_), house(_,_,fox,_,_), Hs),		% 11
	next(house(_,_,horse,_,_), house(_,_,_,kool,_), Hs),			% 12
	member(house(_,_,_,luckystrike,juice), Hs),						% 13
	member(house(_,japanese,_,kent,_), Hs),							% 14
	next(house(_,norwegian,_,_,_), house(blue,_,_,_,_), Hs),		% 15	
	member(house(_,_,zebra,_,_), Hs),								% someone owns the zebra
	member(house(_,_,_,_,water), Hs), !.							% someone drinks water


next(A, B, Ls) :-
    append(_, [A,B|_], Ls);
	append(_, [B,A|_], Ls).

middle(H, Hs) :- Hs = [_,_,H,_,_].

first(H, Hs) :- Hs = [H,_,_,_,_].


/* QUERY
?- houses(Result).
*/