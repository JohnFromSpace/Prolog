% Heap representation: heap(List).

% Empty heap
empty_heap(heap([])).

% Insert an element into the heap
insert_heap(Element, Heap, UpdatedHeap) :-
    merge_heap(Heap, heap([Element]), UpdatedHeap).

% Merge two heaps
merge_heap(heap([]), Heap, Heap).
merge_heap(Heap, heap([]), Heap).
merge_heap(heap([X|Xs]), heap([Y|Ys]), MergedHeap) :-
    X =< Y,
    merge_heap(heap(Xs), heap([Y|Ys]), SubHeap),
    MergedHeap = heap([X|SubHeap]).
merge_heap(heap([X|Xs]), heap([Y|Ys]), MergedHeap) :-
    X > Y,
    merge_heap(heap([X|Xs]), heap(Ys), SubHeap),
    MergedHeap = heap([Y|SubHeap]).

% Extract minimum element from the heap
extract_min(Heap, Min, UpdatedHeap) :-
    Heap = heap([Min|Rest]),
    merge_heap(heap(Rest), empty_heap, UpdatedHeap).

% Example usage:
% Create an empty heap, insert elements, and extract the minimum
:- initialization(main).

main :-
    empty_heap(EmptyHeap),
    insert_heap(5, EmptyHeap, Heap1),
    insert_heap(3, Heap1, Heap2),
    insert_heap(7, Heap2, Heap3),
    insert_heap(2, Heap3, Heap4),
    extract_min(Heap4, Min, UpdatedHeap),
    write('Min element: '), writeln(Min),
    write('Updated heap after extraction: '), writeln(UpdatedHeap).
