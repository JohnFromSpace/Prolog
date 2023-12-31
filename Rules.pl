% Rules are represented as the following:
% Head :- Body. 
% Where the Head is correct if the Body is correct. 
% It is evaluated the following way:
% T :- T. 
% F :- F.

% Let's look at the following examples:
human(Einstein). % Einstein is a human. 

% This can be turned to a rule the following way:
human(Einstein) :- true. % Einstein is a human if true. 

% Einstein likes people who like physics.
likes(Bohr, physics).
likes(Curie, chemistry).
likes(Tesla, engineering).
likes(Planck, physics).
likes(Heisenberg, physics).

% Create the rule:
likes(Einstein, X) :- likes(X, physics).

% Let's check if the following queries are true:
?- likes(Einstein, Bohr). % T
?- likes (Einstein, Curie). % F
?- likes(Einstein, Tesla). % F
?- likes(Einstein, Planck). % T
?- likes(Einstein, Heisenberg). % T

% Ranges in rules
lived(Einstein, 1879, 1955). % Einstein lived from year 1879 to 1955.
lived(Tesla, 1856, 1943). 

human(X, Y) :- lived(X, A, B),
               Y >= A, 
               Y <= B.
