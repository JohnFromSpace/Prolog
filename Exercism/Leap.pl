leap(Y) :- 0 is mod(Y, 4) -> (0 is mod(Y, 100) -> (0 is mod(Y, 400)); true).
