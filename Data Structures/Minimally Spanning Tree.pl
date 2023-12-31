% Facts representing edges in the graph
edge(a, b, 4).
edge(a, c, 2).
edge(b, c, 5).
edge(b, d, 10).
edge(c, d, 3).

% Predicate to find the minimal spanning tree
minimal_spanning_tree(Tree) :-
    findall(Edge, edge(Edge), Edges),
    sort(Edges, SortedEdges),
    mst_kruskal(SortedEdges, Tree).

% Kruskal's algorithm for finding minimal spanning tree
mst_kruskal(Edges, Tree) :-
    mst_kruskal(Edges, [], Tree).

mst_kruskal([], Tree, Tree).
mst_kruskal([Edge|RestEdges], AccTree, Tree) :-
    Edge = edge(X, Y, Weight),
    \+ member(X-Y, AccTree),
    \+ member(Y-X, AccTree),
    union([[X-Y]], AccTree, NewAccTree),
    mst_kruskal(RestEdges, NewAccTree, Tree).

% Helper predicate to merge two lists
union([], L, L).
union([H|T], L, R) :-
    member(H, L),
    union(T, L, R).
union([H|T], L, [H|R]) :-
    \+ member(H, L),
    union(T, L, R).
