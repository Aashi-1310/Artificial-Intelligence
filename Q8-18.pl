memb(X, [X | Tail]).
memb(X, [Head | Tail]):-
  memb(X, Tail).

conc([], L, L).
conc([X | L1], L2, [X | L3]):-
  conc(L1, L2, L3).

reverse([], []).
reverse([Head|Tail], R):-
  reverse(Tail, L1),
  conc(L1, [Head], R).

palindrome([]):- !.
palindrome([_]):- !.
palindrome(L):-
  conc([Head|Tail], [Head], L),
  palindrome(Tail), !.

sumList([], 0).
sumList([Head|Tail], S):-
  sumList(Tail, X),
  S is Head + X.

evenlength([]):- !.
evenlength([_|T]):- oddlength(T).

oddlength([_]):- !.
oddlength([_|T]):- evenlength(T).

nth_element(1, [H|_], H):- !.
nth_element(N, [_|T], X):-
	N > 0,
	N1 is N - 1,
	nth_element(N1, T, X).

max(X, Y, M) :-
    (X >= Y -> M= X ; M = Y).
maxlist([H], H):- !.
maxlist([H|T], M):-
	maxlist(T, M1),
	max(H, M1, M).

insert_nth(I, 1, L, [I|L]):- !.
insert_nth(I, N, [H|T], [H|T1]):-
  N1 is N - 1,
  insert_nth(I, N1, T, T1).

delete_nth(1, [H|T], T):- !.
delete_nth(N, [H|T], [H|T1]):-
  N1 is N - 1,
  delete_nth(N1, T, T1).

merge([H1|T1], [H2|T2], [H1|T]):-
  H1 < H2, !,
  merge(T1, [H2|T2], T).
merge([H1|T1], [H2|T2], [H2|T]):-
  merge([H1|T1], T2, T), !.
merge(L1, [], L1):- !.
merge([], L2, L2).
