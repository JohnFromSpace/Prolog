spiral(0, []) :- !.
spiral(N, XS) :- spiral_H(N, N, 1, XS).

rest([_|X], X).

transpose(XS, [])   :- member([], XS), !.
transpose(M, [X|T]) :- maplist(nth0(0), M, X), maplist(rest, M, M1), transpose(M1, T).
