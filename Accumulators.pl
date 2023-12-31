% In Prolog, accumulators are often used to improve the efficiency and clarity of recursive predicates. 
% They help avoid unnecessary backtracking and can lead to more efficient code by accumulating partial results during recursive calls. 
% Here's a simple example to illustrate the use of accumulators in a list sum predicate:
sum_list(List, Sum) :- sum_list_acc(List, 0, Sum).

% Base case: the sum of an empty list is the accumulator
sum_list_acc([], Acc, Acc).

% Recursive case: accumulate the sum during the traversal
sum_list_acc([Head|Tail], Acc, Sum) :-
    NewAcc is Acc + Head,
    sum_list_acc(Tail, NewAcc, Sum).

?- sum_list([1, 2, 3, 4, 5], Sum).
% End

% Find the length of a list using an accumulator in Prolog:
% Length of a list using an accumulator
list_length(List, Length) :- list_length_acc(List, 0, Length).

% Base case: the length of an empty list is the accumulator
list_length_acc([], Acc, Acc).

% Recursive case: accumulate the length during the traversal
list_length_acc([_|Tail], Acc, Length) :-
    NewAcc is Acc + 1,
    list_length_acc(Tail, NewAcc, Length).

?- list_length([1, 2, 3, 4, 5], Length).
% End
