can_chain([]).
can_chain([(A, B) | R]) :- once(can_chain(A, B, R)).
