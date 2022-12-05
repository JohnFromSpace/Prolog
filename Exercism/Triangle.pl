valid(Side1, Side2, Side3) :-
	Side1 > 0,
	Side2 > 0,
	Side3 > 0,
	Side1 + Side2 > Side3,
	Side1 + Side3 > Side2,
	Side2 + Side3 > Side1.

isosceles(Side, Side, _).
isosceles(Side, _, Side).
isosceles(_, Side, Side).
