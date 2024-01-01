% Y-fast trie implementation in Prolog

% Definition of an empty Y-fast trie
empty_y_fast_trie(empty, 0).

% Definition of a Y-fast trie node
% A node contains a key, a set of smaller elements (left), and a set of larger elements (right)
node(Key, nil, nil, node(Key, nil, nil)).

% Predicate to check if a Y-fast trie is empty
is_empty_y_fast_trie(empty, 0).

% Predicate to insert an element into a Y-fast trie
insert_y_fast(Element, empty, node(Element, empty, empty, L)) :- L is 1.

insert_y_fast(Element, node(Key, Left, Right, L), node(Key, NewLeft, Right, NewL)) :-
    Element < Key,
    insert_y_fast(Element, Left, NewLeft, NewL).

insert_y_fast(Element, node(Key, Left, Right, L), node(Key, Left, NewRight, NewL)) :-
    Element > Key,
    insert_y_fast(Element, Right, NewRight, NewL).

% Predicate to check if an element is in a Y-fast trie
member_y_fast(Element, node(Element, _, _, _)).

member_y_fast(Element, node(Key, Left, _, L)) :-
    Element < Key,
    member_y_fast(Element, Left, L).

member_y_fast(Element, node(Key, _, Right, R)) :-
    Element > Key,
    member_y_fast(Element, Right, R).

% Predicate to find the predecessor of a given element in a Y-fast trie
predecessor_y_fast(Element, empty, nil) :- Element > 0, !.
predecessor_y_fast(Element, node(Key, Left, _, _), Pred) :-
    Element < Key,
    predecessor_y_fast(Element, Left, Pred).
predecessor_y_fast(Element, node(Key, Left, _, L), Pred) :-
    Element >= Key,
    predecessor_y_fast(Element, Left, Pred), !.

predecessor_y_fast(Element, node(Key, _, Right, _), Pred) :-
    Element > Key,
    predecessor_y_fast(Element, Right, Pred), !.

% Predicate to find the successor of a given element in a Y-fast trie
successor_y_fast(Element, empty, nil) :- Element < 0, !.
successor_y_fast(Element, node(Key, _, Right, _), Succ) :-
    Element >= Key,
    successor_y_fast(Element, Right, Succ).
successor_y_fast(Element, node(Key, _, Right, R), Succ) :-
    Element < Key,
    successor_y_fast(Element, Right, Succ), !.

% Predicate to delete an element from a Y-fast trie
delete_y_fast(Element, empty, empty).

delete_y_fast(Element, node(Key, Left, Right, L), UpdatedNode) :-
    Element < Key,
    delete_y_fast(Element, Left, NewLeft),
    UpdatedNode = node(Key, NewLeft, Right, L).

delete_y_fast(Element, node(Key, Left, Right, R), UpdatedNode) :-
    Element > Key,
    delete_y_fast(Element, Right, NewRight),
    UpdatedNode = node(Key, Left, NewRight, R).

delete_y_fast(Element, node(Key, Left, Right, _), UpdatedNode) :-
    Element =:= Key,
    merge_y_fast(Left, Right, Merged),
    UpdatedNode = Merged.

% Predicate to merge two subtrees of a Y-fast trie
merge_y_fast(empty, Right, Right).

merge_y_fast(Left, empty, Left).

merge_y_fast(Left, Right, UpdatedNode) :-
    deepest_node_y_fast(Left, DeepestNode),
    split_y_fast(Right, DeepestNode, NewRight, _),
    UpdatedNode = node(DeepestNode, Left, NewRight, _).

% Predicate to find the deepest node in a Y-fast trie
deepest_node_y_fast(node(Key, nil, _, _), Key).

deepest_node_y_fast(node(_, Left, _, _), DeepestNode) :-
    deepest_node_y_fast(Left, DeepestNode).

% Predicate to split a Y-fast trie into two parts
split_y_fast(empty, _, empty, empty).

split_y_fast(node(Key, Left, Right, _), SplitKey, NewLeft, NewRight) :-
    Key =< SplitKey,
    split_y_fast(Right, SplitKey, NewLeft, NewRight).

split_y_fast(node(Key, Left, Right, _), SplitKey, NewLeft, UpdatedRight) :-
    Key > SplitKey,
    split_y_fast(Left, SplitKey, NewLeft, TempRight),
    merge_y_fast(Right, TempRight, UpdatedRight).

% Example usage
% Create an empty Y-fast trie
empty_y_fast_trie(Trie, _),
is_empty_y_fast_trie(Trie, Size),  % true, Size = 0

% Insert elements into the Y-fast trie
insert_y_fast(5, Trie, UpdatedTrie1, Size1),
insert_y_fast(7, UpdatedTrie1, UpdatedTrie2, Size2),
insert_y_fast(3, UpdatedTrie2, UpdatedTrie3, Size3),
insert_y_fast(9, UpdatedTrie3, UpdatedTrie4, Size4),

% Check if elements are in the Y-fast trie
member_y_fast(7, UpdatedTrie4, _),  % true
member_y_fast(4, UpdatedTrie4, _),  % false

% Find predecessor and successor
predecessor_y_fast(6, UpdatedTrie4, Pred1),  % 5
successor_y_fast(6, UpdatedTrie4, Succ1),  % 7

% Delete an element from the Y-fast trie
delete_y_fast(7, UpdatedTrie4, UpdatedTrie5),
member_y_fast(7, UpdatedTrie5, _),  % false

write('Y-fast trie after operations: '), write(UpdatedTrie5), nl,
write('Size of Y-fast trie: '), write(Size4), nl.

