% Predicate to check if a list is sorted
sorted([]).
sorted([_]).
sorted([X,Y|Rest]) :- X =< Y, sorted([Y|Rest]).

% Predicate to add an element to the ordered set
add_to_ordered_set(Element, OrderedSet, UpdatedSet) :-
    insert_ordered(Element, OrderedSet, UpdatedSet).

% Helper predicate to insert an element into a sorted list
insert_ordered(Element, [], [Element]).
insert_ordered(Element, [H|T], [Element,H|T]) :-
    Element =< H, !.
insert_ordered(Element, [H|T0], [H|T]) :-
    insert_ordered(Element, T0, T).

% Predicate to remove an element from the ordered set
remove_from_ordered_set(Element, OrderedSet, UpdatedSet) :-
    delete(OrderedSet, Element, UpdatedSet).

% Example usage
% Create an ordered set [1, 2, 3]
initial_ordered_set([1, 2, 3]).

% Add 4 to the ordered set
add_to_ordered_set(4, [1, 2, 3], UpdatedSet1),
write('Updated Ordered Set after adding 4: '), write(UpdatedSet1), nl.

% Remove 2 from the ordered set
remove_from_ordered_set(2, [1, 2, 3], UpdatedSet2),
write('Updated Ordered Set after removing 2: '), write(UpdatedSet2), nl.

% Check if a list is a sorted ordered set
sorted_set([1, 2, 3]), write('List is a sorted ordered set.'), nl.
sorted_set([3, 2, 1]), write('List is not a sorted ordered set.'), nl.
