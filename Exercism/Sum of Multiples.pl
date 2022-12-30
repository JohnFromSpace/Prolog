sum_of_multiples(_, 1, 0).

is_a_multiple(_, [], 0).

is_a_multiple(Number, [F|A], Result) :- 0 is mod(Number, F) -> Result is Number; is_a_multiple(Number, A, Result).

sum_of_multiples(Factors, Limit, Result) :- Number is Limit - 1, is_a_multiple(Number, Factors, Result1), sum_of_multiples(Factors, Number, Result2), Result is Result1 + Result2.
