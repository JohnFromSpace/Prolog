% Disjoint-set (Union-Find) implementation in Prolog

% Predicate to initialize disjoint sets for individual elements
make_set(Element, set(Element, 0)).

% Predicate to find the representative (root) of a set
find(Set, Root) :-
    Set = set(Root, _).

% Predicate to union two sets
union(Set1, Set2, UpdatedSet) :-
    find(Set1, Root1),
    find(Set2, Root2),
    Root1 \= Root2,
    Set1 = set(Root1, Rank1),
    Set2 = set(Root2, Rank2),
    (Rank1 < Rank2 ->
        UpdatedSet = set(Root1, Rank1 + 1)
    ;   UpdatedSet = set(Root2, Rank2 + 1)
    ).

% Predicate to check if two elements belong to the same set
same_set(Element1, Element2) :-
    find(Element1, Root1),
    find(Element2, Root2),
    Root1 = Root2.

% Example usage
% Initialize sets for elements 1 to 5
make_set(1, Set1),
make_set(2, Set2),
make_set(3, Set3),
make_set(4, Set4),
make_set(5, Set5),

% Check if elements 1 and 2 belong to the same set (should be false)
same_set(Set1, Set2),  % false

% Union sets containing elements 1 and 2
union(Set1, Set2, UpdatedSet1),

% Check if elements 1 and 2 belong to the same set after union (should be true)
same_set(Set1, UpdatedSet1),  % true

% Union sets containing elements 3 and 4
union(Set3, Set4, UpdatedSet2),

% Check if elements 1 and 3 belong to the same set (should be false)
same_set(Set1, Set3),  % false

% Union sets containing elements 1 and 3
union(Set1, Set3, UpdatedSet3),

% Check if elements 1 and 3 belong to the same set after union (should be true)
same_set(UpdatedSet1, UpdatedSet3).  % true
