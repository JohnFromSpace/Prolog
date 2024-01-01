% Predicate to add a key-value pair to the ordered map
add_to_ordered_map(Key, Value, OrderedMapIn, OrderedMapOut) :-
    insert_ordered(Key, Value, OrderedMapIn, OrderedMapOut).

% Helper predicate to insert a key-value pair into an ordered list
insert_ordered(Key, Value, [], [(Key, Value)]) :-
    !.
insert_ordered(Key, Value, [(K, V) | Rest], [(Key, Value), (K, V) | Rest]) :-
    Key @=< K,
    !.
insert_ordered(Key, Value, [(K, V) | RestIn], [(K, V) | RestOut]) :-
    insert_ordered(Key, Value, RestIn, RestOut).

% Predicate to retrieve the value associated with a key from the ordered map
get_from_ordered_map(Key, OrderedMap, Value) :-
    member((Key, Value), OrderedMap).

% Example usage
ordered_map_demo :-
    % Initial ordered map is an empty list
    EmptyOrderedMap = [],

    % Adding key-value pairs to the ordered map
    add_to_ordered_map('John', 25, EmptyOrderedMap, OrderedMap1),
    add_to_ordered_map('Alice', 30, OrderedMap1, OrderedMap2),
    add_to_ordered_map('Bob', 28, OrderedMap2, OrderedMap3),

    % Retrieving values from the ordered map
    get_from_ordered_map('John', OrderedMap3, AgeJohn),
    write('John\'s age: '), write(AgeJohn), nl,

    get_from_ordered_map('Alice', OrderedMap3, AgeAlice),
    write('Alice\'s age: '), write(AgeAlice), nl,

    get_from_ordered_map('Bob', OrderedMap3, AgeBob),
    write('Bob\'s age: '), write(AgeBob), nl.

% Run the example
:- ordered_map_demo.
