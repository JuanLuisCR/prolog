% Hechos
hombre(juanluis).
hombre(zaragoza).
hombre(juangabriel).
hombre(gabriel).
hombre(gabrieljr).
hombre(gabriel_a).
mujer(cecilia).
mujer(ivonne).
mujer(graciela).
mujer(cecilia_jr).

padre(gabriel,gabrieljr).
padre(juangabriel, juanluis).
madre(cecilia,cecilia_jr).
madre(ivonne, juanluis).
madre(ivonne, gabrielr_a).


% abuelos
padre(zaragoza, juangabriel).
padre(gabriel, ivonne).
madre(cecilia, juangabriel).
madre(graciela, ivonne).

% Regla para abuelos
abuelo(X, Y) :- padre(X, Z), padres(Z, Y).
abuela(X, Y) :- madre(X, Z), padres(Z, Y).

% Regla para padres 
padres(X, Y) :- padre(X, Y); madre(X, Y).

% Consultas de ejemplo:
% - hombre(juanluis).
% - madre(ivonne, juanluis).
% - abuelo(gabriel, ivonne).

% Hermano, tio, primo, cuñado, sobrino,