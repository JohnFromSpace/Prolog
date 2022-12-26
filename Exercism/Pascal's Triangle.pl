next_row([], [1]) :- !.
next_row(R, RR) :- sum_by_pairs(R, R1), append([1|R1], [1], RR).

