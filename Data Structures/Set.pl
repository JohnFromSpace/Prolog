% Predicate to check if an element is a member of the set
member_of_set(Element, Set) :-
    member(Element, Set).

% Predicate to add an element to the set
add_to_set(Element, Set, UpdatedSet) :-
    (member(Element, Set) ->
        % Element already in the set, no change needed
        UpdatedSet = Set
    ;   % Element not in the set, add it
        UpdatedSet = [Element | Set]
    ).

% Predicate to remove an element from the set
remove_from_set(Element, Set, UpdatedSet) :-
    delete(Set, Element, UpdatedSet).

% Predicate to check if two sets are equal
sets_equal(Set1, Set2) :-
    permutation(Set1, Set2).

% Example usage
% Create a set [1, 2, 3]
initial_set([1, 2, 3]).

% Add 4 to the set
add_to_set(4, [1, 2, 3], UpdatedSet1),
write('Updated Set after adding 4: '), write(UpdatedSet1), nl.

% Remove 2 from the set
remove_from_set(2, [1, 2, 3], UpdatedSet2),
write('Updated Set after removing 2: '), write(UpdatedSet2), nl.

% Check if two sets are equal
sets_equal([1, 2, 3], [3, 2, 1]), write('Sets are equal.'), nl.
sets_equal([1, 2, 3], [4, 5, 6]), write('Sets are not equal.'), nl.
