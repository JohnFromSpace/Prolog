% Helper predicate to find a cycle in a graph
cycle(Graph, Start, Cycle) :-
    cycle(Graph, Start, Start, [], Cycle).

cycle(_, Current, Start, Visited, [Current|Visited]) :-
    member(Start, Visited).

cycle(Graph, Current, Start, Visited, Cycle) :-
    neighbor(Current, Neighbor, Graph),
    \+ member(Neighbor, Visited),
    cycle(Graph, Neighbor, Start, [Current|Visited], Cycle).

% Helper predicate to find a neighbor of a vertex
neighbor(Vertex, Neighbor, Graph) :-
    member([Vertex, Neighbor], Graph).
neighbor(Vertex, Neighbor, Graph) :-
    member([Neighbor, Vertex], Graph).

% Helper predicate to check if a graph is a cactus graph
is_cactus_graph(Graph) :-
    \+ (member(Vertex, Graph), cycle(Graph, Vertex, Cycle), length(Cycle, Length), Length > 3).

% Example usage:
% Define a sample graph as a list of edges
sample_graph([[1, 2], [2, 3], [3, 4], [4, 1], [4, 5], [5, 6], [6, 4]]).

% Check if the sample graph is a cactus graph
?- sample_graph(Graph), is_cactus_graph(Graph).
