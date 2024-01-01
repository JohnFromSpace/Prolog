% Sparse Set implementation in Prolog

% Predicate to initialize an empty sparse set
empty_sparse_set([]).

% Predicate to add an element to the sparse set
add_to_sparse_set(Element, Set, UpdatedSet) :-
    \+ member(Element, Set),
    UpdatedSet = [Element | Set].

add_to_sparse_set(Element, Set, Set) :-
    member(Element, Set).

% Predicate to remove an element from the sparse set
remove_from_sparse_set(Element, Set, UpdatedSet) :-
    select(Element, UpdatedSet, Set).

% Predicate to check if an element is in the sparse set
in_sparse_set(Element, Set) :-
    member(Element, Set).

% Example usage
% Initialize an empty sparse set
empty_sparse_set(SparseSet),

% Add elements to the sparse set
add_to_sparse_set(3, SparseSet, UpdatedSet1),
add_to_sparse_set(5, UpdatedSet1, UpdatedSet2),
add_to_sparse_set(7, UpdatedSet2, UpdatedSet3),

% Check if elements are in the sparse set
in_sparse_set(5, UpdatedSet3),  % true
in_sparse_set(8, UpdatedSet3),  % false

% Remove an element from the sparse set
remove_from_sparse_set(5, UpdatedSet3, UpdatedSet4),

% Check if the element is removed
in_sparse_set(5, UpdatedSet4).  % false
