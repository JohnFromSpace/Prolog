next_row([], [1]) :- !.
next_row(R, RR) :- sum_by_pairs(R, R1), append([1|R1], [1], RR).

sum_by_pairs([_], []) :- !.
sum_by_pairs([A, B|Ns], [S|T]) :- S is A+B, sum_by_pairs([B|Ns], T).

pascal(0, _, []) :- !.
pascal(N, R, [RR|Rs]) :- NN is N-1, next_row(R, RR), pascal(NN, RR, Rs).

