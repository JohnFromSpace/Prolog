% Base case: an empty tree is represented as an atom 'empty'.
bst(empty).

% Rule to insert an element into a BST.
insert(Element, empty, tree(Element, empty, empty)).
insert(Element, tree(Root, Left, Right), tree(Root, NewLeft, Right)) :-
    Element < Root,
    insert(Element, Left, NewLeft).
insert(Element, tree(Root, Left, Right), tree(Root, Left, NewRight)) :-
    Element >= Root,
    insert(Element, Right, NewRight).

% Rule to check if an element is in the BST.
search(Element, tree(Element, _, _)) :- !.
search(Element, tree(Root, Left, _)) :-
    Element < Root,
    search(Element, Left).
search(Element, tree(_, _, Right)) :-
    search(Element, Right).

% In-order traversal of the BST.
inorder(empty, []).
inorder(tree(Root, Left, Right), Result) :-
    inorder(Left, LeftResult),
    inorder(Right, RightResult),
    append(LeftResult, [Root|RightResult], Result).

% Example usage:
% ?- insert(5, empty, Tree1), insert(3, Tree1, Tree2), insert(7, Tree2, Tree3).
% Tree3 = tree(5, tree(3, empty, empty), tree(7, empty, empty)).

% ?- search(3, Tree3).
% true.

% ?- search(6, Tree3).
% false.

% ?- inorder(Tree3, Result).
% Result = [3, 5, 7].
