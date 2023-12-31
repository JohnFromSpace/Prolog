% Check if a word is a palindrome using backtracking
/* Define a predicate to check if a list is a palindrome */
palindrome([]).
palindrome([_]).

palindrome([X|Xs]) :-
    append(Middle, [X], Xs),
    palindrome(Middle).

/* Example usage */
?- palindrome([a, b, c, b, a]).
% Output: true

?- palindrome([1, 2, 3, 4]).
% Output: false
% End
