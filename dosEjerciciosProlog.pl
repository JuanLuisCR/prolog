% Variables individuales de hermano Mascota mascota
hermano(ana).
hermano(bruno).
hermano(carla).
hermano(daniel).

mascota(perro).
mascota(gato).
mascota(loro).
mascota(pez).


% Asignación de mascotas a cada hermano, la variable Hermano es para hermano y la Mascota para mascota
tiene_mascota(Hermano,Mascota) :- hermano(Hermano), mascota(Mascota).

% Ana no tiene ni perro ni pez
condicionUno(Hermano,Mascota) :- Hermano = ana, Mascota \= perro, Hermano \= pez.

% Bruno no tiene un gato
condicionDos(Hermano,Mascota) :- Hermano = bruno, Mascota \= gato.

% Carla tiene un animal que no es el pez
condicionTres(Hermano,Mascota) :- Hermano = carla, Mascota \= pez.

% Daniel tiene un loro o un pez
condicionCuatro(Hermano,Mascota) :- Hermano = daniel, (Hermano = loro; Mascota = pez).

% Regla para verificar si la asignación cumple con todas las pistas
solucion(Hermano1, Mascota1, Hermano2, Mascota2, Hermano3, Mascota3, Hermano4, Mascota4) :-
    tiene_mascota(Hermano1, Mascota1), condicionUno(Hermano1, Mascota1),
    tiene_mascota(Hermano2, Mascota2), condicionDos(Hermano2, Mascota2),
    tiene_mascota(Hermano3, Mascota3), condicionTres(Hermano3, Mascota3),
    tiene_mascota(Hermano4, Mascota4), condicionCuatro(Hermano4, Mascota4),
    
    % Nos aseguramos de que cada hermano tiene una mascota única
    Hermano1 \= Hermano2, Hermano1 \= Hermano3, Hermano1 \= Hermano4,
    Hermano2 \= Hermano3, Hermano2 \= Hermano4,
    Hermano3 \= Hermano4,

    % Nos aseguramos de que cada mascota es única
    Mascota1 \= Mascota2, Mascota1 \= Mascota3, Mascota1 \= Mascota4,
    Mascota2 \= Mascota3, Mascota2 \= Mascota4,
    Mascota3 \= Mascota4.