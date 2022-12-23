anagram(Word, Options, Matching) :- include(anagrams(Word), Options, Matching).

key(Word, Lower, Sorted) :- string_lower(Word, Lower), atom_chars(Lower, Chars), msort(Chars, Sorted).
