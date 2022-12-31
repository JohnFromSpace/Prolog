:- use_module(library(dcg/basics)).

wordy(Question, Answer) :- string_codes(Question, Codes), phrase(parse(FirstNumber, OperandNumbers), Codes, []), foldl(calculate, OperandNumbers, FirstNumber, Answer).

calculate(("+", A), B, C) :- C is B + A.
calculate(("-", A), B, C) :- C is B - A.
calculate(("*", A), B, C) :- C is B * A.
calculate(("/", A), B, C) :- C is B / A.

parse(FirstNumber, OperandNumbers) --> question, first_number(FirstNumber), operand_numbers(OperandNumbers), "?", !.

question --> "What".
question --> {throw(error(unknown_operation_error, _))}.

first_number(Number) --> " ", "is", " ", number(Number).
first_number(_) --> " ", "is", {throw(error(syntax_error, _))}.

operand_numbers([]) --> [].
op_nums([H|T]) --> op_num(H), op_nums(T).
