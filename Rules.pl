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

likes(Einstein, X) :- likes(X, physics).
