% Infinite Loops occur in two cases:
% Case 1):
Parent(X, Y) :- Child(Y, X). % X is a parent of a Y, only if Y is a child of X.
Child(A, B) :- Parent(B, A).

?- Parent(Ivan, Bob). % Infinite loop
?- Child(Bob, Ivan). % Infinite loop

% Case 2):
Person(X) :- Person(Y), Relate(X, Y). 

?- Person(Ivan). % Infinite loop

% To evade an infinite loop a fact will be needed:
Person(John). % T
?- Person(John). % t
