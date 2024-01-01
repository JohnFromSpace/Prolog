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

