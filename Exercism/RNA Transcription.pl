rna_transcription(Dna, Rna) :-
    string_chars(Dna, Xs),
    maplist(dna_rna, Xs, Ys),
    string_chars(Rna, Ys).
    
dna_rna('G', 'C').
dna_rna('C', 'G').
dna_rna('T', 'A').
dna_rna('A', 'U').
