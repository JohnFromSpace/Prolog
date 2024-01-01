% Fenwick Tree (Binary Indexed Tree) implementation in Prolog

% Predicate to initialize the Fenwick Tree
init_fenwick_tree(Size, FenwickTree) :-
    length(FenwickTree, Size),
    init_fenwick_tree(FenwickTree, 0).

init_fenwick_tree([], _).

init_fenwick_tree([0|Rest], Index) :-
    NextIndex is Index + 1,
    init_fenwick_tree(Rest, NextIndex).

% Predicate to update a value in the Fenwick Tree
update_fenwick_tree(FenwickTree, Index, Delta) :-
    length(FenwickTree, Size),
    update_fenwick_tree(FenwickTree, Index, Delta, Size).

update_fenwick_tree(_, _, _, 0).

update_fenwick_tree(FenwickTree, Index, Delta, Size) :-
    Index < Size,
    UpdatedIndex is Index + 1,
    nth0(Index, FenwickTree, OldValue),
    NewValue is OldValue + Delta,
    nth0(Index, FenwickTree, NewValue),
    NextIndex is Index + (Index & -Index) + 1,
    update_fenwick_tree(FenwickTree, NextIndex, Delta, Size).

% Predicate to get the prefix sum up to a given index
prefix_sum(FenwickTree, Index, Sum) :-
    prefix_sum(FenwickTree, Index, 0, Sum).

prefix_sum(_, -1, Sum, Sum).

prefix_sum(FenwickTree, Index, Acc, Sum) :-
    Index >= 0,
    UpdatedIndex is Index + 1,
    nth0(Index, FenwickTree, Value),
    NewAcc is Acc + Value,
    ParentIndex is Index - (Index & -Index) + 1,
    prefix_sum(FenwickTree, ParentIndex - 1, NewAcc, Sum).

% Example usage
% Initialize a Fenwick Tree with 8 elements
init_fenwick_tree(8, FenwickTree),

% Update values in the Fenwick Tree
update_fenwick_tree(FenwickTree, 2, 3),
update_fenwick_tree(FenwickTree, 5, 2),

% Get the prefix sum up to index 4
prefix_sum(FenwickTree, 4, Result1),  % Result1 = 3

% Update another value in the Fenwick Tree
update_fenwick_tree(FenwickTree, 3, 1),

% Get the prefix sum up to index 7
prefix_sum(FenwickTree, 7, Result2).  % Result2 = 6
