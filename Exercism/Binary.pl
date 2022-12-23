binary(Str, Dec) :- string_chars(Str, Chars), chars_binary(Chars, Dec).
chars_binary([], 0).
chars_binary(['0'|T], Dec) :- chars_binary(T, Dec), !.
chars_binary(['1'|T], Dec2) :- length(T, Pow), chars_binary(T, TDec), Dec2 is 2**Pow + TDec. 
