% Red-Black Tree Implementation in Prolog

% empty tree is represented as nil
empty(nil).

% red-black tree properties
rbtree(nil).
rbtree(t(_, black, L, V, R)) :-
    rbtree(L),
    rbtree(R).

% insertion
insert(Value, Tree, Result) :-
    insert(Value, Tree, _, Result).

insert(Value, nil, t(nil, red, nil, Value, nil)).
insert(Value, t(Left, Color, LSubtree, V, RSubtree), _, Result) :-
    Value < V,
    insert(Value, LSubtree, NewLeft, NewSubtree),
    balance(t(NewLeft, Color, NewSubtree, V, RSubtree), Result).
insert(Value, t(Left, Color, LSubtree, V, RSubtree), _, Result) :-
    Value > V,
    insert(Value, RSubtree, NewRight, NewSubtree),
    balance(t(Left, Color, LSubtree, V, NewRight), Result).
insert(Value, Tree, _, Tree) :-
    Value =:= V. % do not insert duplicates

% balancing
balance(t(t(t(A, red, B, X, C), red, D, Y, E), red, F, Z, G), Result) :- % left-left
    Result = t(t(A, black, B, X, C), red, t(D, black, E, Y, F), Z, G).
balance(t(A, red, t(B, red, C, X, D), Y, t(t(E, red, F, Z, G), red, H, U, I)), Result) :- % right-right
    Result = t(t(t(A, black, B, X, C), red, D, Y, E), Z, t(F, black, G, H, U, I)).
balance(t(t(A, red, B, X, C), red, D, Y, t(t(E, red, F, Z, G), red, H, U, I)), Result) :- % left-right
    Result = t(t(A, black, B, X, C), Z, t(t(D, black, E, Y, F), red, G, H, U, I)).
balance(t(t(t(A, red, B, X, C), red, D, Y, t(E, red, F, Z, G)), red, H, U, I), Result) :- % right-left
    Result = t(t(t(A, black, B, X, C), Z, t(D, black, E, Y, F), G), H, U, I).

% Example usage
% To insert elements into the red-black tree:
% ?- insert(5, nil, Tree1), insert(3, Tree1, Tree2), insert(7, Tree2, Tree3), insert(2, Tree3, Tree4), insert(4, Tree4, Tree5).

% To check if a tree is a valid red-black tree:
% ?- rbtree(Tree5). % Should return true if Tree5 is a valid red-black tree.
