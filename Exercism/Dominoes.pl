can_chain([]).
can_chain([(A, B) | R]) :- once(can_chain(A, B, R)).

can_chain(X, X, []).
can_chain(S, Pr, Pl) :- select(P, Pl, R), ((Pr, N) = P ; (N, Pr) = P), can_chain(S, N, R).
