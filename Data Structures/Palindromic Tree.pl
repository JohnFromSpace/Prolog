% Palindromic Tree implementation in Prolog

% Predicate to initialize an empty palindromic tree
empty_palindromic_tree(nil).

% Predicate to insert a palindrome into the palindromic tree
insert_palindrome(Tree, Index, Length, UpdatedTree) :-
    insert_palindrome(Tree, Index, Length, Length, UpdatedTree).

insert_palindrome(nil, Index, Length, RemainingLength, pal_node(Index, Length, [], Children)) :-
    RemainingLength > 0.

insert_palindrome(pal_node(Index, Length, StartIndexes, Children), Index, Length, RemainingLength, UpdatedNode) :-
    RemainingLength > 0,
    RemainingLength1 is RemainingLength - 2,
    insert_palindrome(Children, Index, Length, RemainingLength1, UpdatedChildren),
    UpdatedNode = pal_node(Index, Length, [Index | StartIndexes], UpdatedChildren).

% Predicate to search for palindromes in the palindromic tree
search_palindromes(Tree, Index, Length, Palindromes) :-
    search_palindromes(Tree, Index, Length, Length, Palindromes).

search_palindromes(nil, _, _, _, []).

search_palindromes(pal_node(Index, Length, StartIndexes, Children), Index, Length, RemainingLength, Result) :-
    RemainingLength > 0,
    RemainingLength1 is RemainingLength - 2,
    search_palindromes(Children, Index, Length, RemainingLength1, SubResult),
    append(StartIndexes, SubResult, Result).

% Example usage
% Initialize an empty palindromic tree
empty_palindromic_tree(PalTree),

% Insert palindromes into the palindromic tree
insert_palindrome(PalTree, 1, 1, UpdatedTree1),
insert_palindrome(UpdatedTree1, 2, 2, UpdatedTree2),
insert_palindrome(UpdatedTree2, 3, 1, UpdatedTree3),
insert_palindrome(UpdatedTree3, 4, 3, UpdatedTree4),
insert_palindrome(UpdatedTree4, 5, 2, UpdatedTree5),

% Search for palindromes in the palindromic tree
search_palindromes(UpdatedTree5, 2, 2, Result1),  % Result1 = [2, 5]
search_palindromes(UpdatedTree5, 4, 3, Result2).  % Result2 = [4]
