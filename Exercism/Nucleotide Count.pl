char_count(Chars, Char, Count):- aggregate_all(count, (member(X, Chars), X == Char), Count).
