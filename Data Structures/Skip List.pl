% Skip List implementation in Prolog

% Predicate to initialize an empty skip list
empty_skip_list([]).

% Predicate to generate a random level for a new node
random_level(Level) :-
    random(1.0, 2.0, R),
    Level is floor(log2(R)) + 1.

% Predicate to insert an element into the skip list
insert_skip_list(SkipList, Element, UpdatedSkipList) :-
    random_level(Level),
    insert_skip_list(SkipList, Element, Level, 0, UpdatedSkipList).

insert_skip_list([], Element, Level, Level, [node(Element, NextList)]).

insert_skip_list(SkipList, Element, Level, CurrentLevel, UpdatedSkipList) :-
    CurrentLevel < Level,
    insert_skip_list_at_level(SkipList, Element, CurrentLevel, NextList, UpdatedList),
    NextLevel is CurrentLevel + 1,
    insert_skip_list(UpdatedList, Element, Level, NextLevel, UpdatedSkipList).

% Predicate to insert an element at a specific level in the skip list
insert_skip_list_at_level([], Element, _, [], [node(Element, NextList)]).

insert_skip_list_at_level([node(Value, NextList) | Rest], Element, Level, RestAtLevel, UpdatedList) :-
    Element < Value,
    Level > 0,
    insert_skip_list_at_level(NextList, Element, Level, RestAtLevel, UpdatedNextList),
    UpdatedList = [node(Element, UpdatedNextList) | Rest].

insert_skip_list_at_level([node(Value, NextList) | Rest], Element, Level, RestAtLevel, UpdatedList) :-
    Element >= Value,
    insert_skip_list_at_level(Rest, Element, Level, RestAtLevel, UpdatedRest),
    RestAtLevel = NextList,
    UpdatedList = [node(Value, UpdatedRest) | Rest].

% Predicate to search for an element in the skip list
search_skip_list(SkipList, Element) :-
    search_skip_list(SkipList, Element, _).

search_skip_list([], _, false).

search_skip_list([node(Value, _) | _], Element, true) :-
    Element = Value.

search_skip_list([node(Value, NextList) | Rest], Element, Result) :-
    Element < Value,
    search_skip_list(NextList, Element, Result).

search_skip_list([node(Value, _) | Rest], Element, Result) :-
    Element >= Value,
    search_skip_list(Rest, Element, Result).

% Predicate to delete an element from the skip list
delete_skip_list(SkipList, Element, UpdatedSkipList) :-
    delete_skip_list(SkipList, Element, 0, UpdatedSkipList).

delete_skip_list([], _, _, []).

delete_skip_list([node(Value, NextList) | Rest], Element, CurrentLevel, UpdatedList) :-
    delete_skip_list_at_level(NextList, Element, CurrentLevel, UpdatedNextList),
    delete_skip_list(Rest, Element, CurrentLevel, RestAtLevel),
    UpdatedList = [node(Value, UpdatedNextList) | RestAtLevel].

% Predicate to delete an element at a specific level in the skip list
delete_skip_list_at_level([], _, _, []).

delete_skip_list_at_level([node(Value, NextList) | Rest], Element, CurrentLevel, UpdatedList) :-
    Element =:= Value,
    (CurrentLevel = 0 ->
        UpdatedList = Rest
    ;   delete_skip_list_at_level(NextList, Element, CurrentLevel-1, UpdatedNextList),
        UpdatedList = [node(Value, UpdatedNextList) | Rest]).

delete_skip_list_at_level([node(Value, NextList) | Rest], Element, CurrentLevel, UpdatedList) :-
    Element < Value,
    delete_skip_list_at_level(NextList, Element, CurrentLevel, UpdatedNextList),
    UpdatedList = [node(Value, UpdatedNextList) | Rest].

delete_skip_list_at_level([node(Value, _) | Rest], Element, CurrentLevel, UpdatedList) :-
    Element >= Value,
    delete_skip_list_at_level(Rest, Element, CurrentLevel, UpdatedList).

% Predicate to display a skip list
display_skip_list([]) :-
    write('Empty Skip List'), nl.

display_skip_list(SkipList) :-
    display_skip_list(SkipList, 0).

display_skip_list([], _).

display_skip_list([node(Value, NextList) | Rest], Level) :-
    write('Level '), write(Level), write(': '), write(Value), nl,
    display_skip_list(NextList, Level + 1),
    display_skip_list(Rest, Level).

% Example usage
% Initialize an empty skip list
empty_skip_list(SkipList),

% Insert elements into the skip list
insert_skip_list(SkipList, 3, UpdatedList1),
insert_skip_list(UpdatedList1, 6, UpdatedList2),
insert_skip_list(UpdatedList2, 7, UpdatedList3),
insert_skip_list(UpdatedList3, 9, UpdatedList4),

% Display the skip list
display_skip_list(UpdatedList4), nl,

% Search for elements in the skip list
search_skip_list(UpdatedList4, 6),  % true
search_skip_list(UpdatedList4, 8),  % false

% Delete elements from the skip list
delete_skip_list(UpdatedList4, 6, UpdatedList5),
display_skip_list(UpdatedList5).  % Display the updated skip list
