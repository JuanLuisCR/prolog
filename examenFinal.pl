% Ejercicio 1
% Guardianes y templos
guardianes([apolo, hecate, ares, hermes]).
templos([fuego, agua, tierra, aire]).

% Restricciones:
% Apolo no cuida el templo de fuego ni el de tierra
no_guarda(apolo, fuego).
no_guarda(apolo, tierra).

% Hécate no cuida el templo de aire
no_guarda(hecate, aire).

% Ares no cuida el templo de agua ni de aire
no_guarda(ares, agua).
no_guarda(ares, aire).

% Hermes cuida el templo de fuego o de agua
guarda_hermes(T) :- member(T, [fuego, agua]).

% Un guardián puede cuidar un templo si no tiene restricciones para ese templo
puede_guardar(Guard, Templo) :-
    \+ no_guarda(Guard, Templo),  % El guardián no tiene restricción para este templo
    (Guard \= hermes; guarda_hermes(Templo)).  % Hermes solo cuida fuego o agua

% Asignar templos a guardianes
asignar_temporales(Guardianes, Templos, Asignaciones) :-
    permutation(Guardianes, GuardianesAsignados),  % Genera una permutación de los guardianes
    maplist(puede_guardar, GuardianesAsignados, Templos),  % Verifica que cada guardián puede cuidar un templo
    zip(GuardianesAsignados, Templos, Asignaciones).  % Asigna guardianes a templos


zip([], [], []).
zip([X|Xs], [Y|Ys], [(X,Y)|Zs]) :- zip(Xs, Ys, Zs).

% Consulta para encontrar las asignaciones de templos a guardianes
consulta :-
    guardianes(Guardianes),
    templos(Templos),
    asignar_temporales(Guardianes, Templos, Asignaciones),
    write('Asignaciones: '), nl,
    write(Asignaciones).



%Ejercicio 2% Héroes y armas
heroe(aquiles).
heroe(perseo).
heroe(hercules).
heroe(teseo).

arma(espada).
arma(lanza).
arma(arco).
arma(escudo).

% Restricciones mitológicas
% Aquiles no usa el escudo ni el arco
restriccion(aquiles, escudo).
restriccion(aquiles, arco).

% Perseo no usa la espada
restriccion(perseo, espada).

% Hércules no usa la lanza ni el escudo
restriccion(hercules, lanza).
restriccion(hercules, escudo).

% Teseo usa el arco o el escudo
restriccion_extra(teseo, arco).
restriccion_extra(teseo, escudo).

% Un héroe puede usar un arma si no tiene restricciones
puede_usar(Heroe, Arma) :-
    heroe(Heroe),
    arma(Arma),
    \+ restriccion(Heroe, Arma).  % No tiene restricciones para esa arma

% Teseo tiene reglas especiales
puede_usar(teseo, Arma) :-
    restriccion_extra(teseo, Arma).  % Teseo puede usar arco o escudo

% Relación mitológica: asignar armas a héroes
asignar_armas(Asignaciones) :-
    % Listado de asignaciones de armas a héroes
    Asignaciones = [
        usa(aquiles, ArmaAquiles),
        usa(perseo, ArmaPerseo),
        usa(hercules, ArmaHercules),
        usa(teseo, ArmaTeseo)
    ],
    % Cada héroe debe poder usar su arma (según las restricciones)
    puede_usar(aquiles, ArmaAquiles),
    puede_usar(perseo, ArmaPerseo),
    puede_usar(hercules, ArmaHercules),
    puede_usar(teseo, ArmaTeseo),
    % Todas las armas deben ser únicas
    ArmaAquiles \= ArmaPerseo,
    ArmaAquiles \= ArmaHercules,
    ArmaAquiles \= ArmaTeseo,
    ArmaPerseo \= ArmaHercules,
    ArmaPerseo \= ArmaTeseo,
    ArmaHercules \= ArmaTeseo.

% Alternativamente, podemos usar predicados como append, maplist, findall, etc.

% Usamos `findall` para obtener todas las armas posibles y asegurarnos de que todas sean únicas
asignar_armas_con_findall(Asignaciones) :-
    % Lista de héroes y armas disponibles
    findall(Arma, arma(Arma), Armas),
    findall(Heroe, heroe(Heroe), Heroes),
    % Generar las posibles asignaciones de armas a héroes
    permutation(Armas, AsignacionesTemporales),
    % Comprobamos que cada héroe puede usar su arma según las restricciones
    maplist(puede_usar_h, Heroes, AsignacionesTemporales),
    % Las armas deben ser únicas
    all_different(AsignacionesTemporales),
    % Asignaciones finales
    zip(Heroes, AsignacionesTemporales, Asignaciones).

% Verificar si todos los elementos de una lista son diferentes
all_different([]).
all_different([H|T]) :-
    \+ member(H, T),
    all_different(T).

% Asignación de héroes a armas usando zip (emparejar listas)
zip([], [], []).
zip([X|Xs], [Y|Ys], [(X,Y)|Zs]) :- zip(Xs, Ys, Zs).

% Verificación de que un héroe puede usar una arma
puede_usar_h(Heroe, Arma) :-
    puede_usar(Heroe, Arma).

%Ejercicio 3
% Titanes y gemas
titan(cronos).
titan(oceano).
titan(hiperion).
titan(japeto).

gema(zafiro).
gema(rubi).
gema(esmeralda).
gema(diamante).

% Restricciones mitológicas
% Cronos no tiene el zafiro ni el diamante
restriccion(cronos, zafiro).
restriccion(cronos, diamante).

% Océano no tiene el rubí
restriccion(oceano, rubi).

% Hiperión no tiene el zafiro ni el rubí
restriccion(hiperion, zafiro).
restriccion(hiperion, rubi).

% Japeto tiene el diamante o la esmeralda
restriccion_extra(japeto, diamante).
restriccion_extra(japeto, esmeralda).

% Un titán puede poseer una gema si no tiene restricciones
puede_poseer(Titan, Gema) :-
    \+ restriccion(Titan, Gema).

% Japeto tiene reglas especiales
puede_poseer(japeto, Gema) :-
    restriccion_extra(japeto, Gema).

% Lista de titanes y gemas
titanes([cronos, oceano, hiperion, japeto]).
gemas([zafiro, rubi, esmeralda, diamante]).

% Asignar gemas usando maplist y findall
asignar_gemas(Asignaciones) :-
    titanes(Titanes),
    gemas(Gemas),
    permutacion(Gemas, Permutacion),
    maplist(verificar_asignacion, Titanes, Permutacion, Asignaciones).

% Verifica que la asignación sea válida
verificar_asignacion(Titan, Gema, posee(Titan, Gema)) :-
    puede_poseer(Titan, Gema).

% Generar todas las permutaciones de una lista
permutacion([], []).
permutacion(Lista, [Elem|Perm]) :-
    select(Elem, Lista, Resto),
    permutacion(Resto, Perm).
