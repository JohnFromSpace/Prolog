% Treap implementation in Prolog

% Predicate to initialize an empty treap
empty_treap(nil).

% Predicate to merge two treaps
merge_treap(nil, Treap, Treap).

merge_treap(Treap, nil, Treap).

merge_treap(treap(Key1, Priority1, Left1, Right1), treap(Key2, Priority2, Left2, Right2), Merged) :-
    Priority1 > Priority2,
    merge_treap(Right1, treap(Key2, Priority2, Left2, Right2), MergedRight),
    Merged = treap(Key1, Priority1, Left1, MergedRight).

merge_treap(treap(Key1, Priority1, Left1, Right1), treap(Key2, Priority2, Left2, Right2), Merged) :-
    Priority1 =< Priority2,
    merge_treap(treap(Key1, Priority1, Left1, Right1), Left2, MergedLeft),
    Merged = treap(Key2, Priority2, MergedLeft, Right2).

% Predicate to split a treap into two treaps based on a key
split_treap(nil, _, nil, nil).

split_treap(treap(Key, _, Left, Right), SplitKey, LeftSplit, RightSplit) :-
    Key =< SplitKey,
    split_treap(Right, SplitKey, RightSplit, RestRight),
    LeftSplit = treap(Key, _, Left, RestRight).

split_treap(treap(Key, _, Left, Right), SplitKey, LeftSplit, RightSplit) :-
    Key > SplitKey,
    split_treap(Left, SplitKey, RestLeft, LeftSplit),
    RightSplit = treap(Key, _, RestLeft, Right).

% Predicate to insert a key into a treap
insert_treap(nil, Key, Priority, treap(Key, Priority, nil, nil)).

insert_treap(treap(Key, Priority, Left, Right), NewKey, NewPriority, Merged) :-
    NewPriority > Priority,
    split_treap(treap(Key, Priority, Left, Right), NewKey, LeftSplit, RightSplit),
    Merged = treap(NewKey, NewPriority, LeftSplit, RightSplit).

insert_treap(treap(Key, Priority, Left, Right), NewKey, NewPriority, Merged) :-
    NewPriority =< Priority,
    insert_treap(Left, NewKey, NewPriority, MergedLeft),
    Merged = treap(Key, Priority, MergedLeft, Right).

% Predicate to delete a key from a treap
delete_treap(Treap, Key, UpdatedTreap) :-
    split_treap(Treap, Key, Left, Right),
    split_treap(Right, Key + 1, _, RestRight),
    merge_treap(Left, RestRight, UpdatedTreap).

% Predicate to check if a key is in the treap
member_treap(treap(Key, _, _, _), Key).

member_treap(treap(Key, _, Left, _), Element) :-
    Element < Key,
    member_treap(Left, Element).

member_treap(treap(_, _, _, Right), Element) :-
    member_treap(Right, Element).

% Example usage
% Initialize an empty treap
empty_treap(Treap),

% Insert keys into the treap with priorities
insert_treap(Treap, 5, 10, UpdatedTreap1),
insert_treap(UpdatedTreap1, 8, 5, UpdatedTreap2),
insert_treap(UpdatedTreap2, 3, 8, UpdatedTreap3),

% Check if keys are in the treap
member_treap(UpdatedTreap3, 5),  % true
member_treap(UpdatedTreap3, 2),  % false

% Delete a key from the treap
delete_treap(UpdatedTreap3, 5, UpdatedTreap4),
member_treap(UpdatedTreap4, 5).  % false
