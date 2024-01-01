% Examples of string representation using atoms
string_atom('Hello World').
string_atom('Prolog is fun!').

% Predicate to check if a term is an atom representing a string
is_string_atom(Term) :-
    atom(Term),
    atom_chars(Term, Chars),
    maplist(char_type(_, alpha), Chars).

% Example usage
?- is_string_atom('Hello World').
% true

?- is_string_atom('123').
% false (contains numeric characters)

?- is_string_atom('Prolog').
% true

% Examples of string representation using lists of characters
string_list(['H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd']).
string_list(['P', 'r', 'o', 'l', 'o', 'g', ' ', 'i', 's', ' ', 'f', 'u', 'n', '!']).

% Predicate to check if a term is a list representing a string
is_string_list(Term) :-
    is_list(Term),
    maplist(char_type(_, alpha), Term).

% Example usage
?- is_string_list(['H', 'e', 'l', 'l', 'o', ' ', 'W', 'o', 'r', 'l', 'd']).
% true

?- is_string_list([49, 50, 51]).
% false (contains numeric character codes)

?- is_string_list(['P', 'r', 'o', 'l', 'o', 'g', ' ', 'i', 's', ' ', 'f', 'u', 'n', '!']).
% true
