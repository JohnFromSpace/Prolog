space_age(Planet, AgeSec, Years) :- planet_years(Planet, Ratio), Years is AgeSec / (31557600 * Ratio).

planet_years("Earth", 1).
planet_years("Mercury", 0.2408467).
planet_years("Venus", 0.61519726).
planet_years("Mars", 1.8808158).
planet_years("Jupiter", 11.862615).
planet_years("Saturn", 29.447498).
planet_years("Uranus", 84.016846).
planet_years("Neptune", 164.79132).
