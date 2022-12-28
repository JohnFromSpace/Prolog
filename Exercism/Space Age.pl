space_age(Planet, AgeSec, Years) :- planet_years(Planet, Ratio), Years is AgeSec / (31557600 * Ratio).
