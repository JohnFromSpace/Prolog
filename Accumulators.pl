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
