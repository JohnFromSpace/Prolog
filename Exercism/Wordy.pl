:- use_module(library(dcg/basics)).

wordy(Question, Answer) :- string_codes(Question, Codes), phrase(parse(FirstNumber, OperandNumbers), Codes, []), foldl(calculate, OperandNumbers, FirstNumber, Answer).

calculate(("+", A), B, C) :- C is B + A.
calculate(("-", A), B, C) :- C is B - A.
calculate(("*", A), B, C) :- C is B * A.
calculate(("/", A), B, C) :- C is B / A.

parse(FirstNumber, OpNums) --> question, first_number(FirstNumber), operand_numbers(OperandNumbers), "?", !.

question --> "What".
