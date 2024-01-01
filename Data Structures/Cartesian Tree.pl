% Cartesian Tree implementation in Prolog

% Predicate to build a Cartesian tree from a list of elements
build_cartesian_tree([], nil).

build_cartesian_tree([Element | Rest], Tree) :-
    build_cartesian_tree(Rest, RestTree),
    insert_into_cartesian_tree(RestTree, Element, Tree).

% Predicate to insert an element into a Cartesian tree
insert_into_cartesian_tree(nil, Element, cartesian_tree(Element, nil, nil)).

insert_into_cartesian_tree(cartesian_tree(Value, Left, Right), Element, UpdatedTree) :-
    Element < Value,
    insert_into_cartesian_tree(Left, Element, UpdatedLeft),
    UpdatedTree = cartesian_tree(Value, UpdatedLeft, Right).

insert_into_cartesian_tree(cartesian_tree(Value, Left, Right), Element, UpdatedTree) :-
    Element >= Value,
    insert_into_cartesian_tree(Right, Element, UpdatedRight),
    UpdatedTree = cartesian_tree(Element, Left, UpdatedRight).

% Predicate to perform an in-order traversal of a Cartesian tree
in_order_traversal(nil, []).

in_order_traversal(cartesian_tree(Value, Left, Right), Result) :-
    in_order_traversal(Left, LeftResult),
    in_order_traversal(Right, RightResult),
    Result = [Value | RightResult] ++ LeftResult.

% Example usage
% Build a Cartesian tree from a list of elements
Elements = [3, 1, 4, 6, 2, 5],
build_cartesian_tree(Elements, CartesianTree),

% Perform an in-order traversal of the Cartesian tree
in_order_traversal(CartesianTree, Result).
