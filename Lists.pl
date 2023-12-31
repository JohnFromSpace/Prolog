% A list is a collection of items, not necessarily homogeneous. 
% In Prolog, lists are inbuilt data structures. 
% Lists can be used to represent sets, stacks, queues, linked lists, and several complex data structures such as trees, graphs, etc.

[]            % empty list
[a]            % singleton list
[hello, world]        % 2 element list
[[1,2,3,4], p, this] % 3 element list 
[[[1, 2], [3, 4]], [[a, b], [x, y]]].    
% nested list (3 level nesting)

% In prolog, lists have got only one operator, called pipe, denoted by |. 
% This operator is used to append an element at the beginning of a list. The syntax of the pipe operator is as follows:
[a | L]

% In Prolog, the Cut operator, denoted by ! is a goal that always succeeds but cannot be backtracked. 
% For example, consider the following program to find the max element between 2 numbers:
max_element(X, Y, X) :- X > Y.    % If X > Y, then X is the max element
max_element(X, Y, Y) :- X =< Y.   % If X <= Y, then Y is the max element

?- max_element(5, 2, Ans). 

% List implementation
% Base case: An empty list
my_list([]).

% Recursive case: A list with at least one element
my_list([Head | Tail]) :-
    % Head is the first element of the list
    % Tail is the rest of the list
    write('Head: '), write(Head), nl,
    write('Tail: '), write(Tail), nl.

% Example usage:
% This will print "Head: 1" and "Tail: [2,3]"
?- my_list([1, 2, 3]).
% End of Implementation

% Find the length of a list
% Base case: an empty list has length 0
length_of_list([], 0).

% Recursive case: the length is 1 plus the length of the tail of the list
length_of_list([_|Tail], Length) :-
    length_of_list(Tail, TailLength),
    Length is TailLength + 1.

?- length_of_list([1, 2, 3, 4, 5], Length).
% End of code

%  Find and remove a specified element in a linked list in Prolog,
% Base case: removing an element from an empty list results in an empty list
remove_element(_, [], []).

% If the element to be removed is the head of the list, skip it
remove_element(Element, [Element|Tail], NewList) :-
    remove_element(Element, Tail, NewList).

% If the element to be removed is not the head, keep the head and recurse on the tail
remove_element(Element, [X|Tail], [X|NewList]) :-
    X \= Element,
    remove_element(Element, Tail, NewList).

?- remove_element(3, [1, 2, 3, 4, 5], NewList).
% End of code

% Find sum of elements in a list 
% Base case: sum of elements in an empty list is 0
sum_of_elements([], 0).

% Recursive case: sum is the head of the list plus the sum of the tail
sum_of_elements([Head|Tail], Sum) :-
    sum_of_elements(Tail, TailSum),
    Sum is Head + TailSum.

?- sum_of_elements([1, 2, 3, 4, 5], Sum).
% End of code
