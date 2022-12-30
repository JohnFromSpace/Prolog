sum_of_multiples(_, 1, 0).

is_a_multiple(_, [], 0).

is_a_multiple(Number, [F|A], Result) :- 0 is mod(Number, F) -> Result is Number; is_a_multiple(Number, A, Result).
