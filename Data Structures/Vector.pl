% Vector initialization (empty vector)
empty_vector([]).

% Push back an element to the vector
push_back(Element, Vector, Result) :-
    append(Vector, [Element], Result).

% Pop the last element from the vector
pop_back(Vector, Result) :-
    append(Result, [_], Vector).

% Get the front (first) element of the vector
front(Vector, Front) :-
    Vector = [Front|_].

% Get the end (last) element of the vector
end(Vector, End) :-
    reverse(Vector, [End|_]).

% Get the size of the vector
vector_size(Vector, Size) :-
    length(Vector, Size).

% Clear all elements from the vector
clear_vector([], []).

% Concatenate two vectors
concat_vectors(Vector1, Vector2, Result) :-
    append(Vector1, Vector2, Result).

% Example usage:
% ?- empty_vector(V), push_back(1, V, V1), push_back(2, V1, V2).
% V = [],
% V1 = [1],
% V2 = [1, 2].

% ?- pop_back([1, 2, 3], Result).
% Result = [1, 2].

% ?- front([1, 2, 3], Front).
% Front = 1.

% ?- end([1, 2, 3], End).
% End = 3.

% ?- vector_size([1, 2, 3], Size).
% Size = 3.

% ?- clear_vector([1, 2, 3], Cleared).
% Cleared = [].

% ?- concat_vectors([1, 2], [3, 4], Result).
% Result = [1, 2, 3, 4].
