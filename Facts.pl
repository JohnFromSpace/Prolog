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

% We ask if something is true by using ?- in front of a fact:
?- good(X). % Is it true that "X" who is "Bob" is "good"?
X = Bob.

?- owns(X, Y).
X = Maria.
Y = dog.

% Using semicolons in Prolog is a bit tricky. 
% Let's use the following two facts:

drinks(Bob, beer). % Bob drinks beer.
drinks(John, wine). % John drinks wine.

% In SWI-Prolog: 

?- drinks(Bob, X), drinks(John, X).
X = beer;
X = wine. 
% This returns:
% "Bob drinks beer." which is true. AND "John drinks beer." which is not true.
% "Bob drinks wine." which is true. AND "John drinks wine." which is true.
% So the compiler returns both results with their respective values of X for each query. 
% In other words, the first time "X" takes the value of "beer", and the second time "X" takes the
% value of "wine".

%We can represent the query as:
/*
                                                                            drinks(Bob, beer). -> T
                                                                          /                          \
                                   drinks(Bob, beer), drinks(John, beer).                              AND -> F  
                                  /                                       \                          /         \   
?- drinks(Bob, X), drinks(John, X).                                         drinks(John, beer). -> F            \  
X = beer.                                                                                                         AND -> F
X = wine.                                                                   drinks(Bob, wine). -> F             /    
                                  \                                       /                         \          /  
                                   drinks(Bob, wine), drinks(John, wine).                              AND -> F
                                                                          \                         /
                                                                            drinks(John, wine). -> T 
*/

% The semicolon ";" represents the OR operator in Prolog. 
% The colon "," represents the AND operator in Prolog.
