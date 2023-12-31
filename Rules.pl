% Rules are represented as the following:
% Head :- Body. 
% Where the Head is correct if the Body is correct. 
% It is evaluated the following way:
% T :- T. 
% F :- F.

% Let's look at the following examples:
human(Einstein). % Einstein is a human. 

% This can be turned to a rule the following way:
human(Einstein) :- true.

