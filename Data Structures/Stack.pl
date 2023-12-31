% Initialize an empty stack
empty_stack([]).

% Push an element onto the stack
push(Element, Stack, [Element|Stack]).

% Pop an element from the stack
pop(Stack, Element, NewStack) :-
    Stack = [Element|NewStack].

% Example usage:
% Initialize an empty stack
?- empty_stack(Stack), write(Stack).
% Output: Stack = []

% Push elements onto the stack
?- push(a, [], Stack1), push(b, Stack1, Stack2), write(Stack2).
% Output: Stack2 = [b, a]

% Pop elements from the stack
?- pop([c, b, a], Element, NewStack), write(Element), write(' '), write(NewStack).
% Output: Element = c, NewStack = [b, a]

