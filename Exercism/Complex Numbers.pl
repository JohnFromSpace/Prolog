real((Real, _), Real).
imaginary((_, Imaginary), Imaginary).

conjugate((Real, Imaginary), (Real, Complex)) :- Complex is -1 * Imaginary.

abs((Real, Imaginary), A) :- A is sqrt(Real * Real + Imaginary * Imaginary).

add((Real1, Imaginary1), (Real2, Imaginary2), (RReal, RImaginary)) :- RReal is Real1 + Real2, RImaginary is Imaginary1 + Imaginary2.
