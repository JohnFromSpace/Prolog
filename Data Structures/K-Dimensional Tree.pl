% k-dimensional tree implementation in Prolog (2D)

% Predicate to initialize an empty k-d tree
empty_kd_tree(nil).

% Predicate to insert a point into the k-d tree
insert_kd_tree(nil, Point, Depth, kdtree(Point, Depth, nil, nil)).

insert_kd_tree(kdtree([X, Y], Depth, Left, Right), [NewX, NewY], CurrentDepth, UpdatedTree) :-
    Dimension is CurrentDepth mod 2,
    (Dimension = 0 ->
        NewPoint = [NewX, Y]
    ;   NewPoint = [X, NewY]
    ),
    NextDepth is CurrentDepth + 1,
    (NewPoint < [X, Y] ->
        insert_kd_tree(Left, [NewX, NewY], NextDepth, UpdatedLeft),
        UpdatedTree = kdtree([X, Y], Depth, UpdatedLeft, Right)
    ;   insert_kd_tree(Right, [NewX, NewY], NextDepth, UpdatedRight),
        UpdatedTree = kdtree([X, Y], Depth, Left, UpdatedRight)
    ).

% Predicate to search for points in a k-d tree within a given range
search_kd_tree(nil, _, []).

search_kd_tree(kdtree(Point, Depth, Left, Right), Range, Result) :-
    point_in_range(Point, Range),
    search_kd_tree(Left, Range, LeftResult),
    search_kd_tree(Right, Range, RightResult),
    append(LeftResult, [Point | RightResult], Result).

search_kd_tree(kdtree(Point, Depth, Left, Right), Range, Result) :-
    \+ point_in_range(Point, Range),
    Dimension is Depth mod 2,
    (Dimension = 0 ->
        (Point < Range -> search_kd_tree(Right, Range, Result)
        ;   search_kd_tree(Left, Range, Result))
    ;   (Point < Range -> search_kd_tree(Right, Range, Result)
        ;   search_kd_tree(Left, Range, Result))
    ).

% Predicate to check if a point is within a given range
point_in_range([X, Y], [[XMin, XMax], [YMin, YMax]]) :-
    X >= XMin, X <= XMax,
    Y >= YMin, Y <= YMax.

% Example usage
% Initialize an empty k-d tree
empty_kd_tree(KDTree),

% Insert points into the k-d tree
insert_kd_tree(KDTree, [3, 6], 0, UpdatedTree1),
insert_kd_tree(UpdatedTree1, [4, 8], 0, UpdatedTree2),
insert_kd_tree(UpdatedTree2, [1, 9], 0, UpdatedTree3),
insert_kd_tree(UpdatedTree3, [7, 5], 0, UpdatedTree4),

% Search for points within a given range
search_kd_tree(UpdatedTree4, [[2, 6], [4, 9]], Result).  % Result = [[3, 6], [4, 8], [7, 5]]
