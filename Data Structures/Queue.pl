% Initialize an empty queue
empty_queue([], []).

% Enqueue an element to the queue
enqueue(Element, Front, Rear, NewFront, NewRear) :-
    NewFront = [Element | Front],
    NewRear = Rear.

% Dequeue an element from the queue
dequeue(Element, Front, Rear, NewFront, Rear) :-
    Front = [Element | NewFront].

% Check if the queue is empty
is_empty_queue(Front, Rear) :-
    Front = [],
    Rear = [].

% Example usage:
% Initialize an empty queue
?- empty_queue(Front, Rear).
% Output: Front = [], Rear = []

% Enqueue elements to the queue
?- enqueue(1, [], [], Front1, Rear1),
   enqueue(2, Front1, Rear1, Front2, Rear2),
   enqueue(3, Front2, Rear2, Front3, Rear3).
% Output: Front3 = [3, 2, 1], Rear3 = []

% Dequeue elements from the queue
?- dequeue(E1, Front3, Rear3, NewFront, NewRear),
   dequeue(E2, NewFront, NewRear, NewFront2, NewRear2).
% Output: E1 = 1, E2 = 2, NewFront2 = [], NewRear2 = []

% Check if the queue is empty
?- is_empty_queue(NewFront2, NewRear2).
% Output: true

