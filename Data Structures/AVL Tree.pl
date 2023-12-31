% AVL Tree Implementation

% AVL Tree Node Structure
% avl_tree(Key, Left_Subtree, Right_Subtree, Height)

% Base case: an empty tree has a height of -1
empty_tree(-1).

% Calculate the height of a tree
height(empty_tree, -1).
height(avl_tree(_, _, _, Height), Height).

% Get the balance factor of a node
balance_factor(avl_tree(_, Left, Right, _), Balance) :-
    height(Left, LeftHeight),
    height(Right, RightHeight),
    Balance is LeftHeight - RightHeight.

% Rotate Right
rotate_right(avl_tree(X, avl_tree(Y, A, B, _), C, _), avl_tree(Y, A, avl_tree(X, B, C, _), _)).

% Rotate Left
rotate_left(avl_tree(X, A, avl_tree(Y, B, C, _), _), avl_tree(Y, avl_tree(X, A, B, _), C, _)).

% Left-Right Rotation
rotate_left_right(Node, Result) :-
    rotate_left(Node, Temp),
    rotate_right(Temp, Result).

% Right-Left Rotation
rotate_right_left(Node, Result) :-
    rotate_right(Node, Temp),
    rotate_left(Temp, Result).

% Insert a key into the AVL tree
insert(Key, empty_tree, avl_tree(Key, empty_tree, empty_tree, 0)).
insert(Key, avl_tree(NodeKey, Left, Right, Height), Result) :-
    Key < NodeKey,
    insert(Key, Left, NewLeft),
    update_height(avl_tree(NodeKey, NewLeft, Right, _), Result).

insert(Key, avl_tree(NodeKey, Left, Right, Height), Result) :-
    Key > NodeKey,
    insert(Key, Right, NewRight),
    update_height(avl_tree(NodeKey, Left, NewRight, _), Result).

% Helper predicate to update the height and balance factor of a node
update_height(avl_tree(Key, Left, Right, _), Result) :-
    height(Left, LeftHeight),
    height(Right, RightHeight),
    MaxHeight is max(LeftHeight, RightHeight) + 1,
    Result = avl_tree(Key, Left, Right, MaxHeight).

% Balance the AVL tree
balance(avl_tree(Key, Left, Right, _), Result) :-
    balance_factor(avl_tree(Key, Left, Right, _), Balance),
    Balance > 1,
    Key < Left,
    balance_factor(Left, LeftBalance),
    (LeftBalance >= 0 ->
        rotate_right(avl_tree(Key, Left, Right, _), Result)
    ;   rotate_left_right(avl_tree(Key, Left, Right, _), Result)
    ).

balance(avl_tree(Key, Left, Right, _), Result) :-
    balance_factor(avl_tree(Key, Left, Right, _), Balance),
    Balance < -1,
    Key > Right,
    balance_factor(Right, RightBalance),
    (RightBalance <= 0 ->
        rotate_left(avl_tree(Key, Left, Right, _), Result)
    ;   rotate_right_left(avl_tree(Key, Left, Right, _), Result)
    ).

balance(Node, Node).

% Public predicate to insert a key into the AVL tree
avl_insert(Key, Tree, Result) :-
    insert(Key, Tree, Temp),
    balance(Temp, Result).

% Example usage:
% avl_insert(5, empty_tree, T1),
% avl_insert(3, T1, T2),
% avl_insert(7, T2, T3).

