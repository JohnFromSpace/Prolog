% Predicate to add a key-value pair to the unordered map
add_to_unordered_map(Key, Value) :-
    % Check if the key already exists
    (unordered_map(Key, _) ->
        % Key exists, retract the old value
        retract(unordered_map(Key, _))
    ;   true
    ),
    % Assert the new key-value pair
    assert(unordered_map(Key, Value)).

% Predicate to retrieve the value associated with a key from the unordered map
get_from_unordered_map(Key, Value) :-
    unordered_map(Key, Value).

% Example usage
:- dynamic unordered_map/2.

% Adding key-value pairs to the unordered map
add_to_unordered_map('John', 25).
add_to_unordered_map('Alice', 30).
add_to_unordered_map('Bob', 28).

% Retrieving values from the unordered map
get_from_unordered_map('John', AgeJohn), write('John\'s age: '), write(AgeJohn), nl.
get_from_unordered_map('Alice', AgeAlice), write('Alice\'s age: '), write(AgeAlice), nl.
get_from_unordered_map('Bob', AgeBob), write('Bob\'s age: '), write(AgeBob), nl.

% Removing a key-value pair from the unordered map
retract(unordered_map('Alice', _)).

% Trying to retrieve the value after removal
get_from_unordered_map('Alice', AgeAliceAfterRemoval), write('Alice\'s age after removal: '), write(AgeAliceAfterRemoval), nl.
