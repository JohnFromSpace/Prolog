real((Real, _), Real).
imaginary((_, Imaginary), Imaginary).

conjugate((Real, Imaginary), (Real, Complex)) :- Complex is -1 * Imaginary.

abs((Real, Imaginary), A) :- A is sqrt(Real * Real + Imaginary * Imaginary).
