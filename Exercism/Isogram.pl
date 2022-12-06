isLetter(C) :- 
  char_type(C, alpha).
isogram(Word) :-
  string lower(Word, X),
  string_chars(X, Y),
  include(isLetter, Y, Z),
  is_set(Z).
