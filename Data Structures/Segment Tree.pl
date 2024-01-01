% Segment Tree implementation in Prolog

% Predicate to initialize the segment tree
init_segment_tree(List, Tree) :-
    length(List, N),
    Height is ceil(log2(N)),
    Size is 2^(Height + 1) - 1,
    init_segment_tree(List, 0, N-1, 0, Size, Tree).

init_segment_tree(_, Start, End, Index, Index, [leaf(Start, End, Value)]) :-
    nth0(Start, List, Value).

init_segment_tree(List, Start, End, Low, High, [node(Start, Mid, Left, Right, Sum)]) :-
    Mid is (Low + High) // 2,
    LeftIndex is 2 * Index + 1,
    RightIndex is 2 * Index + 2,
    init_segment_tree(List, Start, Mid, LeftIndex, High, Left),
    init_segment_tree(List, Mid+1, End, RightIndex, High, Right),
    sum_nodes(Left, Right, Sum).

% Predicate to update a value in the segment tree
update_segment_tree(Tree, Index, NewValue, UpdatedTree) :-
    update_segment_tree(Tree, Index, NewValue, 0, UpdatedTree).

update_segment_tree([leaf(_, _, _)], Index, NewValue, Index, [leaf(_, _, NewValue)]).

update_segment_tree([node(Start, End, Left, Right, Sum) | Rest], Index, NewValue, CurrentIndex, [node(Start, End, UpdatedLeft, UpdatedRight, UpdatedSum) | Rest]) :-
    Mid is (Start + End) // 2,
    (Index =< Mid ->
        update_segment_tree(Left, Index, NewValue, 2 * CurrentIndex + 1, UpdatedLeft),
        UpdatedRight = Right
    ;   update_segment_tree(Right, Index, NewValue, 2 * CurrentIndex + 2, UpdatedRight),
        UpdatedLeft = Left
    ),
    sum_nodes(UpdatedLeft, UpdatedRight, UpdatedSum).

% Predicate to query the segment tree for a range sum
query_segment_tree(Tree, QueryStart, QueryEnd, Result) :-
    query_segment_tree(Tree, QueryStart, QueryEnd, 0, Result).

query_segment_tree([leaf(Start, End, Value)], QueryStart, QueryEnd, _, Result) :-
    overlap(Start, End, QueryStart, QueryEnd),
    Result is Value.

query_segment_tree([node(Start, End, Left, Right, Sum) | _], QueryStart, QueryEnd, _, Result) :-
    overlap(Start, End, QueryStart, QueryEnd),
    Result is Sum.

query_segment_tree([node(Start, End, _, _, Sum) | Rest], QueryStart, QueryEnd, CurrentIndex, Result) :-
    Mid is (Start + End) // 2,
    (QueryEnd <= Mid ->
        query_segment_tree(Left, QueryStart, QueryEnd, 2 * CurrentIndex + 1, Result)
    ;   QueryStart > Mid ->
        query_segment_tree(Right, QueryStart, QueryEnd, 2 * CurrentIndex + 2, Result)
    ;   query_segment_tree(Left, QueryStart, Mid, 2 * CurrentIndex + 1, LeftResult),
        query_segment_tree(Right, Mid+1, QueryEnd, 2 * CurrentIndex + 2, RightResult),
        Result is LeftResult + RightResult
    ).

% Predicate to check if two ranges overlap
overlap(Start1, End1, Start2, End2) :-
    End1 >= Start2,
    End2 >= Start1.

% Predicate to sum the values of two nodes
sum_nodes(leaf(_, _, Value), leaf(_, _, Value), Value).

sum_nodes(node(_, _, _, _, Sum1), node(_, _, _, _, Sum2), Sum) :-
    Sum is Sum1 + Sum2.

% Example usage
List = [1, 2, 3, 4, 5, 6, 7, 8],
init_segment_tree(List, Tree),

% Query the sum of elements in the range [2, 5]
query_segment_tree(Tree, 2, 5, Result1),  % Result1 = 20

% Update the value at index 3 to 10
update_segment_tree(Tree, 3, 10, UpdatedTree),
query_segment_tree(UpdatedTree, 2, 5, Result2).  % Result2 = 28
