% Predicate to check if an element is a member of the set
member_of_set(Element, Set) :-
    member(Element, Set).

% Predicate to add an element to the unordered set
add_to_unordered_set(Element, Set, UpdatedSet) :-
    (member(Element, Set) ->
        % Element already in the set, no change needed
        UpdatedSet = Set
    ;   % Element not in the set, add it
        UpdatedSet = [Element | Set]
    ).

% Predicate to remove an element from the unordered set
remove_from_unordered_set(Element, Set, UpdatedSet) :-
    delete(Set, Element, UpdatedSet).

% Example usage
% Create an unordered set [1, 2, 3]
initial_unordered_set([1, 2, 3]).

% Add 4 to the unordered set
add_to_unordered_set(4, [1, 2, 3], UpdatedSet1),
write('Updated Unordered Set after adding 4: '), write(UpdatedSet1), nl.

% Remove 2 from the unordered set
remove_from_unordered_set(2, [1, 2, 3], UpdatedSet2),
write('Updated Unordered Set after removing 2: '), write(UpdatedSet2), nl.
