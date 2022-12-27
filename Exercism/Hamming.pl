hamming_distance(Str1, Str2, Dist)  :- 
string_codes(Str1, Codes1), 
string_codes(Str2, Codes2), 
foldl([A, B, S, R] >> (A =:= B -> R is S; R is S + 1), Codes1, Codes2, 0, Dist).
