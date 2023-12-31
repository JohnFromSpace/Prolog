% Helper predicate to swap elements at two indices in a list
swap(List, Index1, Index2, Result) :-
    nth0(Index1, List, Elem1, Rest),
    nth0(Index2, Rest, Elem2, Before),
    nth0(Index1, Swapped, Elem2, Before),
    nth0(Index2, Swapped, Elem1, Result).

% Helper predicate to ensure the max heap property is maintained
heapify(List, Index, Result) :-
    left_child_index(Index, LeftIndex),
    right_child_index(Index, RightIndex),
    max_index(List, Index, LeftIndex, RightIndex, MaxIndex),
    (Index \= MaxIndex ->
        swap(List, Index, MaxIndex, Swapped),
        heapify(Swapped, MaxIndex, Result)
    ;   Result = List
    ).

% Helper predicates to calculate indices
parent_index(Index, ParentIndex) :- ParentIndex is div(Index - 1, 2).
left_child_index(Index, LeftIndex) :- LeftIndex is 2 * Index + 1.
right_child_index(Index, RightIndex) :- RightIndex is 2 * Index + 2.

% Helper predicate to find the index of the maximum element among three indices
max_index(List, Index1, Index2, Index3, MaxIndex) :-
    nth0(Index1, List, Elem1),
    nth0(Index2, List, Elem2),
    nth0(Index3, List, Elem3),
    max_list([Elem1, Elem2, Elem3], MaxElem),
    (MaxElem = Elem1 -> MaxIndex = Index1
    ; MaxElem = Elem2 -> MaxIndex = Index2
    ; MaxIndex = Index3
    ).

% Build a max heap from an unordered list
build_max_heap(UnorderedList, MaxHeap) :-
    length(UnorderedList, Length),
    LastIndex is Length - 1,
    build_max_heap_helper(UnorderedList, LastIndex, MaxHeap).

build_max_heap_helper(List, Index, Result) :-
    (Index >= 0 ->
        heapify(List, Index, Heapified),
        PrevIndex is Index - 1,
        build_max_heap_helper(Heapified, PrevIndex, Result)
    ;   Result = List
    ).

% Example usage:
% build_max_heap([4, 10, 3, 5, 1], MaxHeap).
