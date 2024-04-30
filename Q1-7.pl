sum(X, Y, S) :-
    S is X + Y.

max(X, Y, M) :-
    (X >= Y -> M= X ; M = Y).

factorial(0, 1).
factorial(N, F) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

fib(0, 0).
fib(1, 1).
fib(N, T) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, T1),
    fib(N2, T2),
    T is T1 + T2.

gcd(X, 0, X) :- X > 0.
gcd(X, Y, G) :-
    Y > 0,
    Z is X mod Y,
    gcd(Y, Z, G).

power(_, 0, 1).
power(Num, Pow, Ans) :-
    Pow > 0,
    Pow1 is Pow - 1,
    power(Num, Pow1, Temp),
    Ans is Num * Temp.

multi(N1, N2, R):-
	R is N1 * N2.


