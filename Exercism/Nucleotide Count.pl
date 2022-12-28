char_count(Chars, Char, Count):- aggregate_all(count, (member(X, Chars), X == Char), Count).

nucleotide_count(Str, Counts):- string_chars(Str, Chars), forall(member(X, Chars), (X == 'A'; X == 'C'; X == 'G'; X == 'T')), char_count(Chars, 'A', A), char_count(Chars, 'C', C), char_count(Chars, 'G', G), char_count(Chars, 'T', T), Counts = [('A', A), ('C', C), ('G', G), ('T', T)].
