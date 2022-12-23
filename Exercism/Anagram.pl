anagram(Word, Options, Matching) :- include(anagrams(Word), Options, Matching).

key(Word, Lower, Sorted) :- string_lower(Word, Lower), atom_chars(Lower, Chars), msort(Chars, Sorted).

anagrams(Word1, Word2) :- key(Word1, Lower1, Sorted), key(Word2, Lower2, Sorted), \+ Lower1 == Lower2.
