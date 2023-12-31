% A list is a collection of items, not necessarily homogeneous. 
% In Prolog, lists are inbuilt data structures. 
% Lists can be used to represent sets, stacks, queues, linked lists, and several complex data structures such as trees, graphs, etc.

[]            % empty list
[a]            % singleton list
[hello, world]        % 2 element list
[[1,2,3,4], p, this] % 3 element list 
[[[1, 2], [3, 4]], [[a, b], [x, y]]].    
% nested list (3 level nesting)

% In prolog, lists have got only one operator, called pipe, denoted by |. 
% This operator is used to append an element at the beginning of a list. The syntax of the pipe operator is as follows:
[a | L]

% In Prolog, the Cut operator, denoted by ! is a goal that always succeeds but cannot be backtracked. 
% For example, consider the following program to find the max element between 2 numbers:
