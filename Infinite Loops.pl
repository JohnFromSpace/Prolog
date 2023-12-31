% Infinite Loops occur in two cases:
% Case 1):
Parent(X, Y) :- Child(Y, X). % X is a parent of a Y, only if Y is a child of X.
Child(A, B) :- Child(B, A).

?- Parent(Ivan, Bob). % Infinite loop
?- Child(Bob, Ivan). % Infinite loop

