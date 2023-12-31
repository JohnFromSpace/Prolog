% Tree representation: tree(Value, LeftChild, RightChild)

% Base case: an empty tree
tree(empty, nil, nil).

% Rule for inserting a value into the tree
insert(Value, empty, tree(Value, empty, empty)).
insert(Value, tree(Root, Left, Right), UpdatedTree) :-
    Value =< Root,
    insert(Value, Left, UpdatedLeft),
    UpdatedTree = tree(Root, UpdatedLeft, Right).
insert(Value, tree(Root, Left, Right), UpdatedTree) :-
    Value > Root,
    insert(Value, Right, UpdatedRight),
    UpdatedTree = tree(Root, Left, UpdatedRight).

% Rule for checking if a value is in the tree
member(Value, tree(Value, _, _)) :- !.
member(Value, tree(Root, Left, _)) :-
    Value < Root,
    member(Value, Left).
member(Value, tree(_, _, Right)) :-
    member(Value, Right).

% Rule for in-order traversal of the tree
inorder(empty, []).
inorder(tree(Value, Left, Right), Traversal) :-
    inorder(Left, LeftTraversal),
    inorder(Right, RightTraversal),
    append(LeftTraversal, [Value|RightTraversal], Traversal).

?- insert(5, empty, Tree1),
   insert(3, Tree1, Tree2),
   insert(7, Tree2, Tree3),
   insert(1, Tree3, Tree4),
   insert(4, Tree4, Tree5),
   insert(6, Tree5, Tree6),
   insert(8, Tree6, Tree7),
   member(6, Tree7).
