:- use_module(library(dcg/basics)).

wordy(Question, Answer) :- string_codes(Question, Codes), phrase(parse(FirstNumber, Operands), Codes, []), foldl(calculate, Operands, FirstNumber, Answer).

calculate(("+", A), B, C) :- C is B + A.
calculate(("-", A), B, C) :- C is B - A.
calculate(("*", A), B, C) :- C is B * A.
calculate(("/", A), B, C) :- C is B / A.

parse(FirstNumber, Operands) --> question, first_number(FirstNumber), operands(Operands), "?", !.

question --> "What".
question --> {throw(error(unknown_operation_error, _))}.

first_number(Number) --> " ", "is", " ", number(Number).
first_number(_) --> " ", "is", {throw(error(syntax_error, _))}.

operands([]) --> [].
operands([H|T]) --> operand(H), operands(T).

operand((Operand, Number)) --> " ", operator(Operator), " ", number(Number).
operand((Operand, _)) --> " ", operator(Op), {throw(error(syntax_error, _))}.
