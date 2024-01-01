% Ternary Search Tree implementation in Prolog

% Predicate to initialize an empty ternary search tree
empty_tst(nil).

% Predicate to insert a key into the ternary search tree
insert_tst(nil, [], nil).
insert_tst(nil, [Char | Chars], Node) :-
    insert_tst(nil, Chars, Right),
    Node = tst(Char, nil, Right, nil).
insert_tst(tst(SplitChar, Left, Middle, Right), [Char | Chars], UpdatedNode) :-
    Char < SplitChar,
    insert_tst(Left, [Char | Chars], UpdatedLeft),
    UpdatedNode = tst(SplitChar, UpdatedLeft, Middle, Right).
insert_tst(tst(SplitChar, Left, Middle, Right), [Char | Chars], UpdatedNode) :-
    Char = SplitChar,
    insert_tst(Middle, Chars, UpdatedMiddle),
    UpdatedNode = tst(SplitChar, Left, UpdatedMiddle, Right).
insert_tst(tst(SplitChar, Left, Middle, Right), [Char | Chars], UpdatedNode) :-
    Char > SplitChar,
    insert_tst(Right, [Char | Chars], UpdatedRight),
    UpdatedNode = tst(SplitChar, Left, Middle, UpdatedRight).

% Predicate to search for a key in the ternary search tree
search_tst(nil, _).
search_tst(tst(SplitChar, Left, Middle, Right), [Char | Chars]) :-
    (Char < SplitChar ->
        search_tst(Left, [Char | Chars])
    ;   Char = SplitChar ->
        search_tst(Middle, Chars)
    ;   Char > SplitChar ->
        search_tst(Right, [Char | Chars])
    ).

% Example usage
% Initialize an empty ternary search tree
empty_tst(TST),

% Insert keys into the ternary search tree
insert_tst(TST, "apple", UpdatedTree1),
insert_tst(UpdatedTree1, "banana", UpdatedTree2),
insert_tst(UpdatedTree2, "orange", UpdatedTree3),

% Search for keys in the ternary search tree
search_tst(UpdatedTree3, "apple"),  % true
search_tst(UpdatedTree3, "grape").  % false
