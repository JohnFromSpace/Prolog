% Interval Tree implementation in Prolog

% Predicate to initialize an empty interval tree
empty_interval_tree(nil).

% Predicate to insert an interval into the interval tree
insert_interval(nil, Interval, interval_tree(Interval, nil, nil)).

insert_interval(interval_tree(ExistingInterval, Left, Right), NewInterval, UpdatedTree) :-
    overlap(ExistingInterval, NewInterval),
    split_interval(ExistingInterval, LeftPart, MiddlePart, RightPart),
    split_interval(NewInterval, _, MiddlePart, _),
    insert_interval(Left, LeftPart, UpdatedLeft),
    insert_interval(Right, RightPart, UpdatedRight),
    UpdatedTree = interval_tree(MiddlePart, UpdatedLeft, UpdatedRight).

% Predicate to check if two intervals overlap
overlap([Start1, End1], [Start2, End2]) :-
    Start1 =< End2,
    Start2 =< End1.

% Predicate to split an interval into three parts based on another interval
split_interval([Start, End], [Start, Middle], [Middle, Middle], [Middle, End]) :-
    Middle is (Start + End) // 2.

% Predicate to search for intervals overlapping with a given range
search_interval_tree(nil, _, []).

search_interval_tree(interval_tree(Interval, Left, Right), Range, Result) :-
    overlap(Interval, Range),
    search_interval_tree(Left, Range, LeftResult),
    search_interval_tree(Right, Range, RightResult),
    Result = [Interval | LeftResult ++ RightResult].

search_interval_tree(interval_tree(Interval, Left, Right), Range, Result) :-
    \+ overlap(Interval, Range),
    search_interval_tree(Left, Range, ResultLeft),
    search_interval_tree(Right, Range, ResultRight),
    Result = ResultLeft ++ ResultRight.

% Example usage
% Initialize an empty interval tree
empty_interval_tree(IntervalTree),

% Insert intervals into the interval tree
insert_interval(IntervalTree, [1, 5], UpdatedTree1),
insert_interval(UpdatedTree1, [3, 8], UpdatedTree2),
insert_interval(UpdatedTree2, [6, 10], UpdatedTree3),
insert_interval(UpdatedTree3, [12, 15], UpdatedTree4),

% Search for intervals overlapping with a given range
search_interval_tree(UpdatedTree4, [4, 7], Result1),  % Result1 = [[1, 5], [3, 8], [6, 10]]
search_interval_tree(UpdatedTree4, [9, 11], Result2).  % Result2 = []
