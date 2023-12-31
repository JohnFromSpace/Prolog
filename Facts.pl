% Facts in Prolog are clauses with a head with no variables and no body.
% They are mainly used as declarative statements about a problem domain.
% They are expressed as:
% R(X,Y,...). 
% where R is a relation between some objects X, Y,... that is true.
% It can also be considered as a definition. 
% In other words, the clause R(X,Y,...). returns true.  

good(Bob). % translates to Bob is good.
male(Robert). % Robert is male.
gives(Alexander, money, Peter). % Alexander gives money to Peter.
owns(Maria, dog). % Maria owns a dog.
has(Ivan, house, city). % Ivan has a house in the city.

% In SWI-Prolog we can use variables like the following:
?- good(X).
X = Bob.

?- owns(X, Y).
X = Maria.
Y = dog.

% Using semicolons in Prolog is a bit tricky. 
% Let's use the following two facts:

drinks(Bob, X). % Bob drinks X.
drinks(John, X). % John drinks X.
