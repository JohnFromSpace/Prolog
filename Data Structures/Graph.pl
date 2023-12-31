% Dynamic predicates to store nodes and edges
:- dynamic(node/1).
:- dynamic(edge/2).

% Function to add a node to the graph
add_node(Node) :-
    assert(node(Node)).

% Function to add a directed edge to the graph
add_edge(From, To) :-
    assert(edge(From, To)).

% Function to check if there is a direct edge between two nodes
connected(X, Y) :-
    edge(X, Y).

% Function to check if there is a path between two nodes
path(X, Y) :-
    connected(X, Y).
path(X, Y) :-
    connected(X, Z),
    path(Z, Y).

% Function to print all nodes in the graph
print_nodes :-
    write('Nodes: '),
    findall(Node, node(Node), Nodes),
    write(Nodes), nl.

% Function to print all edges in the graph
print_edges :-
    write('Edges: '),
    findall(Edge, edge(Edge), Edges),
    write(Edges), nl.

% Example usage:
% 1. Add nodes and edges
% 2. Query for connectivity and paths
% 3. Print nodes and edges

:- add_node(a),
   add_node(b),
   add_node(c),
   add_edge(a, b),
   add_edge(b, c),
   add_edge(c, a),
   add_edge(c, b).

:- print_nodes,
   print_edges,
   write('Path from a to c: '), path(a, c), nl,
   write('Path from b to a: '), path(b, a), nl.
   
