% BK-tree implementation in Prolog

% Predicate to initialize an empty BK-tree
empty_bk_tree(nil).

% Predicate to insert a word into the BK-tree
insert_bk_tree(nil, Word, bk_tree(Word, [])).

insert_bk_tree(bk_tree(Root, Children), Word, UpdatedTree) :-
    levenshtein_distance(Root, Word, Distance),
    member(ChildNode-DistanceList, Children),
    insert_bk_tree(ChildNode, Word, UpdatedChild),
    UpdatedTree = bk_tree(Root, [ChildNode-UpdatedChild | Children]).

% Predicate to search for words in the BK-tree within a given distance
search_bk_tree(nil, _, _, []).

search_bk_tree(bk_tree(Root, Children), Query, Tolerance, Result) :-
    levenshtein_distance(Root, Query, Distance),
    (Distance =< Tolerance ->
        Result = [Root | SubResult]
    ;   Result = SubResult
    ),
    findall(SubResult, (
        member(ChildNode-DistanceList, Children),
        DistanceLowerBound is Distance - Tolerance,
        DistanceUpperBound is Distance + Tolerance,
        member(Dist-Word, DistanceList),
        Dist >= DistanceLowerBound,
        Dist =< DistanceUpperBound,
        search_bk_tree(ChildNode, Query, Tolerance, SubResult)
    ), SubResults),
    flatten(SubResults, AllResults).

% Predicate to calculate the Levenshtein distance between two words
levenshtein_distance(Word1, Word2, Distance) :-
    atom_chars(Word1, List1),
    atom_chars(Word2, List2),
    levenshtein_distance(List1, List2, Distance).

levenshtein_distance([], List, Distance) :-
    length(List, Distance).

levenshtein_distance(List, [], Distance) :-
    length(List, Distance).

levenshtein_distance([H1 | T1], [H2 | T2], Distance) :-
    levenshtein_distance(T1, T2, SubDistance),
    (H1 \= H2 -> Distance is SubDistance + 1 ; Distance is SubDistance).

% Example usage
% Initialize an empty BK-tree
empty_bk_tree(BKTree),

% Insert words into the BK-tree
insert_bk_tree(BKTree, "book", UpdatedTree1),
insert_bk_tree(UpdatedTree1, "cook", UpdatedTree2),
insert_bk_tree(UpdatedTree2, "back", UpdatedTree3),
insert_bk_tree(UpdatedTree3, "bag", UpdatedTree4),

% Search for words within a given distance
search_bk_tree(UpdatedTree4, "book", 1, Result1),  % Result1 = ["book", "cook"]
search_bk_tree(UpdatedTree4, "back", 2, Result2).  % Result2 = ["back", "book", "bag"]
