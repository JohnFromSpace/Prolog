:- use_module(library(dcg/basics)).

wordy(Question, Answer) :- string_codes(Question, Codes), phrase(parse(FirstNumber, OperandNumbers), Codes, []), foldl(calculate, OpNumbers, FirstNumber, Answer).

calculate(("+", A), B, C) :- C is B + A.
calculate(("-", A), B, C) :- C is B - A.
calculate(("*", A), B, C) :- C is B * A.
calculate(("/", A), B, C) :- C is B / A.

parse(FirstNumber, OpNums) --> question, first_num(FirstNumber), op_nums(OpNums), "?", !.

question --> "What".
