% x-fast trie implementation in Prolog

% Empty x-fast trie
empty_x_fast_trie(empty, 0).

% Definition of a node in the x-fast trie
node(Key, Value, 0, empty, empty, node(Key, Value, 0)).

% Predicate to check if an x-fast trie is empty
is_empty_x_fast_trie(empty, 0).

% Predicate to insert an element into the x-fast trie
insert_x_fast(Element, empty, UpdatedTrie) :-
    insert_leaf(Element, empty, UpdatedTrie).

% Helper predicate to insert a leaf node into the x-fast trie
insert_leaf(Element, empty, node(Element, 1, 0)).

insert_leaf(Element, node(Key, Value, Bit, Left, Right, UpdatedNode), UpdatedNode) :-
    nth_bit(Element, Bit, BitValue),
    BitValue = 0,
    insert_leaf(Element, Left, NewLeft),
    UpdatedNode = node(Key, Value, Bit, NewLeft, Right, _).

insert_leaf(Element, node(Key, Value, Bit, Left, Right, UpdatedNode), UpdatedNode) :-
    nth_bit(Element, Bit, BitValue),
    BitValue = 1,
    insert_leaf(Element, Right, NewRight),
    UpdatedNode = node(Key, Value, Bit, Left, NewRight, _).

% Predicate to check if an element is in the x-fast trie
member_x_fast(Element, empty, _) :-
    fail. % Element not found

member_x_fast(Element, node(Key, _, Bit, Left, _, _), Value) :-
    nth_bit(Element, Bit, BitValue),
    BitValue = 0,
    member_x_fast(Element, Left, Value).

member_x_fast(Element, node(Key, Value, Bit, _, Right, _), Value) :-
    nth_bit(Element, Bit, BitValue),
    BitValue = 1,
    member_x_fast(Element, Right, Value).

% Predicate to find the successor of a given element in the x-fast trie
successor_x_fast(Element, empty, nil) :-
    write('Error: Element not found.'), nl.

successor_x_fast(Element, node(Key, Value, Bit, Left, Right, _), Successor) :-
    nth_bit(Element, Bit, BitValue),
    successor_x_fast(BitValue, Element, Key, Left, Right, Successor).

successor_x_fast(0, Element, Key, Left, _, Successor) :-
    member_x_fast(Element, Left, Value),
    Successor = node(Key, Value, 0).

successor_x_fast(1, Element, Key, _, Right, Successor) :-
    successor_x_fast(Element, Right, Successor).

% Helper predicate to find the successor based on bit value
successor_x_fast(0, Element, Key, Left, _, Successor) :-
    member_x_fast(Element, Left, Value),
    Successor = node(Key, Value, 0).

successor_x_fast(1, Element, Key, _, Right, Successor) :-
    successor_x_fast(Element, Right, Successor).

% Predicate to delete an element from the x-fast trie
delete_x_fast(Element, empty, _) :-
    write('Error: Element not found.'), nl.

delete_x_fast(Element, Trie, UpdatedTrie) :-
    delete_leaf(Element, Trie, UpdatedTrie).

% Helper predicate to delete a leaf node from the x-fast trie
delete_leaf(Element, node(Key, _, Bit, Left, Right, _), UpdatedNode) :-
    nth_bit(Element, Bit, BitValue),
    BitValue = 0,
    delete_leaf(Element, Left, NewLeft),
    UpdatedNode = node(Key, 0, Bit, NewLeft, Right, _).

delete_leaf(Element, node(Key, _, Bit, Left, Right, _), UpdatedNode) :-
    nth_bit(Element, Bit, BitValue),
    BitValue = 1,
    delete_leaf(Element, Right, NewRight),
    UpdatedNode = node(Key, 0, Bit, Left, NewRight, _).

% Helper predicate to check the nth bit of a number
nth_bit(Number, BitIndex, BitValue) :-
    Bit is 1 << BitIndex,
    BitValue is (Number /\ Bit) >> BitIndex.

% Example usage
% Create an empty x-fast trie
empty_x_fast_trie(Trie, _),
is_empty_x_fast_trie(Trie, Size),  % true, Size = 0

% Insert elements into the x-fast trie
insert_x_fast(5, Trie, UpdatedTrie1),
insert_x_fast(7, UpdatedTrie1, UpdatedTrie2),
insert_x_fast(3, UpdatedTrie2, UpdatedTrie3),
insert_x_fast(9, UpdatedTrie3, UpdatedTrie4),

% Check if elements are in the x-fast trie
member_x_fast(7, UpdatedTrie4, Value7),  % Value7 = 7
member_x_fast(4, UpdatedTrie4, Value4),  % Value4 = 4

% Find the successor
successor_x_fast(6, UpdatedTrie4, Successor),  % Successor = node(7, 7, 0)

% Delete an element from the x-fast trie
delete_x_fast(7, UpdatedTrie4, UpdatedTrie5),
member_x_fast(7, UpdatedTrie5, _),  % Error: Element not found
write('Updated x-fast trie: '), write(UpdatedTrie5
