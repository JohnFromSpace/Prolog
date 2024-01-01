% Predicate to add a key-value pair to the hash map
add_to_hash_map(Key, Value) :-
    % Check if the key already exists
    (hash_map(Key, _) ->
        % Key exists, retract the old value
        retract(hash_map(Key, _))
    ;   true
    ),
    % Assert the new key-value pair
    assert(hash_map(Key, Value)).

% Predicate to retrieve the value associated with a key
get_from_hash_map(Key, Value) :-
    % Check if the key exists
    hash_map(Key, Value).

% Example usage
:- dynamic hash_map/2.

% Adding key-value pairs to the hash map
add_to_hash_map('John', 25).
add_to_hash_map('Alice', 30).
add_to_hash_map('Bob', 28).

% Retrieving values from the hash map
get_from_hash_map('John', AgeJohn), write('John\'s age: '), write(AgeJohn), nl.
get_from_hash_map('Alice', AgeAlice), write('Alice\'s age: '), write(AgeAlice), nl.
get_from_hash_map('Bob', AgeBob), write('Bob\'s age: '), write(AgeBob), nl.

% Removing a key-value pair from the hash map
retract(hash_map('Alice', _)).

% Trying to retrieve the value after removal
get_from_hash_map('Alice', AgeAliceAfterRemoval), write('Alice\'s age after removal: '), write(AgeAliceAfterRemoval), nl.
