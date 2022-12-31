:- use_module(library(dcg/basics)).

wordy(Question, Answer) :- string_codes(Question, Codes), phrase(parse(FirstNumber, OpNums), Codes, []), foldl(calculate, OpNums, FirstNumber, Answer).

calculate(("+", A), B, C) :- C is B + A.
calculate(("-", A), B, C) :- C is B - A.
calculate(("*", A), B, C) :- C is B * A.
calculate(("/", A), B, C) :- C is B / A.

parse(FirstNumber, OpNums) --> question, first_num(FirstNumber), op_nums(OpNums), "?", !.

question --> "What".
question --> {throw(error(unknown_operation_error, _))}.
