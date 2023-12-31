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

% Doubly linked list implementation
% Fact representing an empty doubly linked list
dll_empty([]).

% Rule to add a new element to the doubly linked list
dll_add(Element, List, [Element|List]).

% Rule to remove an element from the doubly linked list
dll_remove(Element, [Element|Tail], Tail).
dll_remove(Element, [Head|Tail], [Head|NewTail]) :-
    dll_remove(Element, Tail, NewTail).

% Rule to traverse the doubly linked list forward
dll_forward([], _).
dll_forward([Head|Tail], Prev) :-
    write(Prev), write(' <-> '), write(Head), nl,
    dll_forward(Tail, Head).

% Rule to traverse the doubly linked list backward
dll_backward([], _).
dll_backward([Head|Tail], Next) :-
    write(Next), write(' <-> '), write(Head), nl,
    dll_backward(Tail, Head).

?- dll_empty(List), dll_add(1, List, NewList), dll_add(2, NewList, NewList2).
?- dll_forward(NewList2, null).
?- dll_backward(NewList2, null).
?- dll_remove(1, NewList2, UpdatedList).
% End of Implementation

% Concatinate two linked lists 
% Rule to concatenate two lists
concatenate_lists([], List, List).
concatenate_lists([Head|Tail1], List2, [Head|ResultTail]) :-
    concatenate_lists(Tail1, List2, ResultTail).

?- concatenate_lists([1, 2, 3], [4, 5, 6], Result).
% End of code

% Binary search in a list 
% Binary search on a sorted list
binary_search(List, Element) :-
    length(List, Len),
    binary_search(List, 0, Len, Element).

% Base case: element is at the middle position
binary_search(List, Low, High, Element) :-
    Middle is (Low + High) // 2,
    nth0(Middle, List, MiddleElement),
    MiddleElement =:= Element.

% Recursive case: element is in the left half
binary_search(List, Low, High, Element) :-
    Middle is (Low + High) // 2,
    nth0(Middle, List, MiddleElement),
    MiddleElement > Element,
    NewHigh is Middle,
    binary_search(List, Low, NewHigh, Element).

% Recursive case: element is in the right half
binary_search(List, Low, High, Element) :-
    Middle is (Low + High) // 2,
    nth0(Middle, List, MiddleElement),
    MiddleElement < Element,
    NewLow is Middle + 1,
    binary_search(List, NewLow, High, Element).

?- binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9], 5).
% End of code

% Sort a list 
% Example usage:
% ?- sort_list([3, 1, 4, 1, 5, 9, 2, 6, 5], SortedList).

sort_list(List, SortedList) :-
    sort(List, SortedList).

% Quick sort
% Quicksort implementation
quicksort([], []).
quicksort([Pivot|Rest], Sorted) :-
    partition(Pivot, Rest, Less, Greater),
    quicksort(Less, SortedLess),
    quicksort(Greater, SortedGreater),
    append(SortedLess, [Pivot|SortedGreater], Sorted).

% Partition the list into elements less than and greater than the pivot
partition(_, [], [], []).
partition(Pivot, [X|Xs], [X|Ls], Gs) :-
    X =< Pivot,
    partition(Pivot, Xs, Ls, Gs).
partition(Pivot, [X|Xs], Ls, [X|Gs]) :-
    X > Pivot,
    partition(Pivot, Xs, Ls, Gs).

?- quicksort([3, 1, 4, 1, 5, 9, 2, 6, 5], SortedList).
% End of code
