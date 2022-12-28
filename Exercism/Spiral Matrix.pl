spiral(0, []) :- !.
spiral(N, XS) :- spiral_H(N, N, 1, XS).

rest([_|X], X).
