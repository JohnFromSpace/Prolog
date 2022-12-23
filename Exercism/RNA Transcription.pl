rna_transcription(Dna, Rna) :-
    string_chars(Dna, Xs),
    maplist(dna_rna, Xs, Ys),
    string_chars(Rna, Ys).
    
