real((Real, _), Real).

imaginary((_, Imaginary), Imaginary).

conjugate((Real, Imaginary), (Real, Complex)) :- Complex is -1 * Imaginary.

abs((Real, Imaginary), A) :- A is sqrt(Real * Real + Imaginary * Imaginary).

add((Real1, Imaginary1), (Real2, Imaginary2), (RReal, RImaginary)) :- RReal is Real1 + Real2, RImaginary is Imaginary1 + Imaginary2.

sub((Real1, Imaginary1), (Real2, Imaginary2), (RReal, RImaginary)) :- RReal is Real1 - Real2, RImaginary is Imaginary1 - Imaginary2.

mul((Real1, Imaginary1), (Real2, Imaginary2), (RReal, RImaginary)) :- RReal is Real1 * Real2 - Imaginary1 * Imaginary2, RImaginary is Imaginary1 * Real2 + Imaginary2 * Real1.

div((Real1, Imaginary1), (Real2, Imaginary2), (RReal, RImaginary)) :- Divided is Real2 * Real2 + Imaginary2 * Imaginary2, RReal is (Real1 * Real2 + Imaginary1 * Imaginary2)/Divided, RImaginary is (Imaginary1 * Real2 - Real1 * Imaginary2)/Divided.
