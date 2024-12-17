:- discontiguous replace0/5.

eliza:-	writeln('Hola , mi nombre es  Eliza tu  chatbot,
	por favor ingresa tu consulta,
	usar solo minusculas sin . al final:'),
	readln(Input),
	eliza(Input),!.
eliza(Input):- Input == ['Adios'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['Adios', '.'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aquí es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	eliza(Input1), !.

eliza(Input) :-
    template(Stim, Resp, IndStim),
    match(Stim, Input),
    replace0(IndStim, Input, 0, Resp, R),
    writeln(R), % Mostrar respuesta correctamente
    !. % Termina después de procesar una consulta válida

process_input(Input) :-
    (   
        % Busca coincidencia en plantillas
        template(Stim, Resp, IndStim),
        match(Stim, Input) ->
        replace0(IndStim, Input, 0, Resp, R),
        writeln(R)
    ;
        % Si no coincide ninguna plantilla
        writeln('No entiendo tu consulta. Por favor, intenta nuevamente.')
    ),
    % Vuelve a leer entrada
    readln(NewInput),
    process_input(NewInput).

template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['buen dia', 'Como', estas, tu, 0, '?'], [4]).

template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buendia', 'Como', estas, tu, 0, '?'], [5]).

template([hola, _], ['Hola', 'como', estas, tu, '?'], []).
template([buendia, _], ['Buendia', 'Como', estas, tu, '?'], []).

template([yo, s(), yo, soy, s(),'.'], [por, que, 0, eres, 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], [why, do, you, 0, me ,'?'], [1]).
template([yo, soy, s(_),'.'], [porque, eres, tu, 0, '?'], [2]).

% pregunta algo que le gusta a eliza
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).
template([que, te, gusta, s(_), _], [flagLikesNew], [3]).

		 % pregunta algo que hace eliza
template([tu, eres, s(_), _], [flagDo], [2]).
% pregunta algo que es eliza
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [2]).

	% pregunta sobre sobre datos de eliza
template([donde, vives, s(_), _], [flagWhere], [2]).

template([te, gusta, ver, peliculas, de, s(_)], [flagWatch], [5]).
template([alguna, vez, has, ido, a, s(_)], [flagVisit], [5]).

template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).

% Nuevas reglas
template([alguna, vez, has, _], [no, pero, me, gustaria, algun, dia], []).
template([te, puedo, preguntar, _], [claro, puedes, preguntar], []).
template([consideras , importante,  _], [claro, es, de, suma, importancia], []).
template([como, te, llamas,  _], [mucho, gusto, mi, nombre, es, eliza], []).
template([cual , es, tu, edad,  _], [no, tengo, una, edad, existo, desde, siempre], []).

template([eres , un, ser, humano,  _], [no, fisicamente, pero, lo, intento], []).

template([yo, pienso, que, _], [bueno, esa, es, tu, opinion], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([i, have, s(), with, s(), '.'], ['You', have, to, deal, with, your, 0, and, your, 1, in, a, mature, way, '.'], [2, 4]).
template([i, s(_),  _], [i, can, recommend, you, a, book, about, that, issue], []).
template([please, s(_), _], ['No', i, can, not, help, ',', i, am, just, a, machine], []). 
		 template([tell, me, a, s(_), _], ['No', i, can, not, ',', i, am, bad, at, that], []).

% Template medicos
template([que, especialidad, tiene, s(_)], [flagEspecialidad], [3]).
template([en, hospital, trabaja, s(_)], [flagHospital], [3]).
template([que, equipo, utiliza, s(_)], [flagEquipo], [3]).
template([que, interes, de, investigacion, tiene, s(_)], [flagInteres], [5]).

% Templates para consultas
template([que, habilidades, tiene, la, clase, s(_), de, la, raza, s(_)], [flagclassskills], [5, 9]).
template([que, clases, tiene, la, raza, s(_)], [flagraceclasses], [5]).
template([que, razas, tienen, la, clase, s(_)], [flagclassraces], [5]).
template([que, razas, tienen, la, habilidad, s(_)], [flagabilityraces], [5]).

template([cuales, son, los, personajes, que, pertenecen, a, la, raza, s(_), y, tienen, la, clase, s(_)], [flagraceclass], [9, 14]).


% Templates de familia
template([quien, es, el, padre, de, s(_)], [flagfather], [5]).
template([quien, es, la, madre, de, s(_)], [flagmother], [5]).
template([quienes, son, los, hermanos, de, s(_)], [flagsiblings], [5]).
template([quienes, son, los, primos, de, s(_)], [flagcousins], [5]).

% Template general
template(_, ['Por favor, explica un poco mas.'], []).




% Hechos
doctor(ana).
doctor(bruno).
doctor(carla).
doctor(diego).
doctor(elena).

especialidad(cardiologia).
especialidad(neurologia).
especialidad(oncologia).
especialidad(pediatria).
especialidad(dermatologia).

hospital(general).
hospital(regional).
hospital(universitario).
hospital(privado).
hospital(militar).

equipo(ecografo).
equipo(resonancia).
equipo(tomografo).
equipo(dermatoscopio).
equipo(electrocardiografo).

interes(genetica).
interes(farmacologia).
interes(inmunologia).
interes(bioetica).
interes(microbiologia).


% Hechos para árbol de lisp
% Definición de razas
raza(humano).
raza(elfo).
raza(ogro).
raza(enano).

% Definición de clases
clase(mago).
clase(caballero).
clase(arquero).
clase(asesino).

% Definición de habilidades
habilidad(fuego).
habilidad(hielo).
habilidad(tierra).
habilidad(aire).
habilidad(rayo).
habilidad(espada).
habilidad(lanza).
habilidad(hacha).
habilidad(martillo).
habilidad(escudo).
habilidad(arco).
habilidad(ballesta).
habilidad(flecha_fuego).
habilidad(flecha_hielo).
habilidad(flecha_veneno).
habilidad(sigilo).
habilidad(daga).
habilidad(veneno).
habilidad(sombra).
habilidad(golpe_letal).

% Relación entre raza, clase y habilidad
personaje(humano, mago, fuego).
personaje(humano, mago, hielo).
personaje(humano, mago, tierra).
personaje(humano, mago, aire).
personaje(humano, mago, rayo).
personaje(humano, caballero, espada).
personaje(humano, caballero, lanza).
personaje(humano, caballero, hacha).
personaje(humano, caballero, martillo).
personaje(humano, caballero, escudo).
personaje(humano, arquero, arco).
personaje(humano, arquero, ballesta).
personaje(humano, arquero, flecha_fuego).
personaje(humano, arquero, flecha_hielo).
personaje(humano, arquero, flecha_veneno).
personaje(humano, asesino, sigilo).
personaje(humano, asesino, daga).
personaje(humano, asesino, veneno).
personaje(humano, asesino, sombra).
personaje(humano, asesino, golpe_letal).

personaje(elfo, mago, fuego).
personaje(elfo, mago, hielo).
personaje(elfo, mago, tierra).
personaje(elfo, mago, aire).
personaje(elfo, mago, rayo).
personaje(elfo, caballero, espada).
personaje(elfo, caballero, lanza).
personaje(elfo, caballero, hacha).
personaje(elfo, caballero, martillo).
personaje(elfo, caballero, escudo).
personaje(elfo, arquero, arco).
personaje(elfo, arquero, ballesta).
personaje(elfo, arquero, flecha_fuego).
personaje(elfo, arquero, flecha_hielo).
personaje(elfo, arquero, flecha_veneno).
personaje(elfo, asesino, sigilo).
personaje(elfo, asesino, daga).
personaje(elfo, asesino, veneno).
personaje(elfo, asesino, sombra).
personaje(elfo, asesino, golpe_letal).

personaje(ogro, mago, fuego).
personaje(ogro, mago, hielo).
personaje(ogro, mago, tierra).
personaje(ogro, mago, aire).
personaje(ogro, mago, rayo).
personaje(ogro, caballero, espada).
personaje(ogro, caballero, lanza).
personaje(ogro, caballero, hacha).
personaje(ogro, caballero, martillo).
personaje(ogro, caballero, escudo).
personaje(ogro, arquero, arco).
personaje(ogro, arquero, ballesta).
personaje(ogro, arquero, flecha_fuego).
personaje(ogro, arquero, flecha_hielo).
personaje(ogro, arquero, flecha_veneno).
personaje(ogro, asesino, sigilo).
personaje(ogro, asesino, daga).
personaje(ogro, asesino, veneno).
personaje(ogro, asesino, sombra).
personaje(ogro, asesino, golpe_letal).

personaje(enano, mago, fuego).
personaje(enano, mago, hielo).
personaje(enano, mago, tierra).
personaje(enano, mago, aire).
personaje(enano, mago, rayo).
personaje(enano, caballero, espada).
personaje(enano, caballero, lanza).
personaje(enano, caballero, hacha).
personaje(enano, caballero, martillo).
personaje(enano, caballero, escudo).
personaje(enano, arquero, arco).
personaje(enano, arquero, ballesta).
personaje(enano, arquero, flecha_fuego).
personaje(enano, arquero, flecha_hielo).
personaje(enano, arquero, flecha_veneno).
personaje(enano, asesino, sigilo).
personaje(enano, asesino, daga).
personaje(enano, asesino, veneno).
personaje(enano, asesino, sombra).
personaje(enano, asesino, golpe_letal).



% Hechos árbol genealógico
hombre(juanluis).
hombre(juangabriel).
hombre(gabriel).
hombre(gabrielabuelo).
hombre(rodolfo).
hombre(gerardo).
hombre(emiliano).
mujer(ivonne).
mujer(graciela).
mujer(daniela).

padre(juangabriel, juanluis).
padre(gabrielabuelo, ivonne).
padre(gabrielabuelo, gerardo).
padre(gabrielabuelo, rodolfo).
padre(gabriel,emiliano).
padre(gerardo,daniela).

madre(ivonne, gabriel).
madre(ivonne, juanluis).
madre(graciela, ivonne).
madre(graciela, rodolfo).
madre(graciela, gerardo).

esposos(gabrielabuelo, graciela).
esposos(juangabriel,ivonne).


% Solución del problema
resolver(Resultado) :-
    % Creamos una lista de médicos con sus atributos
    write('Cargando resultados...'),nl,
    Resultado = [
        [ana, EspecialidadAna, HospitalAna, EquipoAna, InteresAna],
        [bruno, EspecialidadBruno, HospitalBruno, EquipoBruno, InteresBruno],
        [carla, EspecialidadCarla, HospitalCarla, EquipoCarla, InteresCarla],
        [diego, EspecialidadDiego, HospitalDiego, EquipoDiego, InteresDiego],
        [elena, EspecialidadElena, HospitalElena, EquipoElena, InteresElena]
    ],
    
    % Valores únicos para cada atributo
    especialidad(EspecialidadAna), especialidad(EspecialidadBruno), especialidad(EspecialidadCarla), especialidad(EspecialidadDiego), especialidad(EspecialidadElena),
    all_different([EspecialidadAna, EspecialidadBruno, EspecialidadCarla, EspecialidadDiego, EspecialidadElena]),

    hospital(HospitalAna), hospital(HospitalBruno), hospital(HospitalCarla), hospital(HospitalDiego), hospital(HospitalElena),
    all_different([HospitalAna, HospitalBruno, HospitalCarla, HospitalDiego, HospitalElena]),

    equipo(EquipoAna), equipo(EquipoBruno), equipo(EquipoCarla), equipo(EquipoDiego), equipo(EquipoElena),
    all_different([EquipoAna, EquipoBruno, EquipoCarla, EquipoDiego, EquipoElena]),

    interes(InteresAna), interes(InteresBruno), interes(InteresCarla), interes(InteresDiego), interes(InteresElena),
    all_different([InteresAna, InteresBruno, InteresCarla, InteresDiego, InteresElena]),

    % Restricciones dadas por el enunciado:
    % 1. Carla no trabaja en el Hospital General ni en el Privado, y no estudia neurología.
    HospitalCarla \= general, HospitalCarla \= privado, EspecialidadCarla \= neurologia,

    % 2. La persona que utiliza el electrocardiógrafo trabaja en cardiología en el Hospital Militar, pero no es Diego.
    member([_, cardiologia, militar, electrocardiografo, _], Resultado),
    not(member([diego, cardiologia, militar, electrocardiografo, _], Resultado)),

    % 3. Bruno está interesado en farmacología, pero no trabaja en el Hospital Regional ni en el Militar.
    InteresBruno = farmacologia, HospitalBruno \= regional, HospitalBruno \= militar,

    % 4. La persona que utiliza el ecógrafo trabaja en pediatría y no es del Hospital Universitario ni del Militar.
    member([_, pediatria, HospitalPediatria, ecografo, _], Resultado), HospitalPediatria \= universitario, HospitalPediatria \= militar,

    % 5. El especialista en oncología trabaja en el Hospital General y utiliza un tomógrafo.
    member([_, oncologia, general, tomografo, _], Resultado),

    % 6. El médico interesado en inmunología usa el resonador magnético, pero no es Elena.
    member([_, _, _, resonancia, inmunologia], Resultado), not(member([elena, _, _, resonancia, inmunologia], Resultado)),

    % 7. El médico del Hospital Regional se dedica a dermatología.
    member([_, dermatologia, regional, _, _], Resultado),

    % 8. Elena está interesada en bioética y no utiliza el electrocardiógrafo.
    InteresElena = bioetica, EquipoElena \= electrocardiografo,

    % 9. Diego es el experto en microbiología.
    InteresDiego = microbiologia,

    % 10. El médico del Hospital Universitario utiliza un dermatoscopio.
    member([_, _, universitario, dermatoscopio, _], Resultado).

% Predicado para asegurar valores únicos en una lista
all_different([]).
all_different([H|T]) :- not(member(H, T)), all_different(T).



% Lo que le gusta a eliza : flagLike
elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].
likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
likes(carros).

elizaLikesNew(_, R) :-
    findall(["A Eliza le gusta ", Gusto], likes(Gusto), Results), 
    flatten(Results, R). 

% lo que hace eliza: flagDo
elizaDoes(X, R):- does(X), R = ['Yes', i, X, and, i, love, it].
elizaDoes(X, R):- \+does(X), R = ['No', i, do, not, X ,'.', it, is, too, hard, for, me].
does(study).
does(cook).
does(work).

% lo que es eliza: flagIs
elizaIs(X, R):- is0(X), R = ['Yes', yo, soy, X].
elizaIs(X, R):- \+is0(X), R = ['No', i, am, not, X].
is0(dumb).
is0(weird).
is0(nice).
is0(fine).
is0(happy).
is0(redundant).

% Predicado para responder dónde vive Eliza
elizaLives(X, R):- livesIn(X), R = ['Yes', yo, vivo, en, X].
elizaLives(X, R):- \+livesIn(X), R = ['No', yo, no, vivo, en, X].
livesIn(puruandiro).
livesIn(nuevaYork).
livesIn(mexico).

elizaWatch(X, R):- watch(X), R = ['Yes', me ,gustan, las, peliculas, de, X].
elizaWatch(X, R):- \+watch(X), R = ['No', me ,gustan, las, peliculas, de, X].
watch(terror).
watch(anime).
watch(romance).
watch(comedia).

elizaVisit(X, R):- visit(X), R = ['Yes', he,ido ,a, X].
elizaVisit(X, R):- \+visit(X), R = ['No', he, ido, a, X].
visit(alemania).
visit(peru).
visit(argentina).

match([],[]).
match([], _):- true.

match([S|Stim],[I|Input]) :-
	atom(S), % si I es un s(X) devuelve falso
	S == I,
	match(Stim, Input),!.

match([S|Stim],[_|Input]) :-
% I es un s(X), lo ignoro y continúo con el resto de la lista
	\+atom(S),
	match(Stim, Input),!.

replace0([], _, _, Resp, R):- append(Resp, [], R),!.

% Eliza likes:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLike,
	elizaLikes(Atom, R).
	
% Eliza likesNew:
% Reemplazo en la respuesta
replace0([], _, _, Resp, Resp).
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, _), % No es relevante el contenido del token aquí
    Resp = [flagLikesNew | _],
    elizaLikesNew(_, R), !.


% Eliza does:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagDo,
	elizaDoes(Atom, R).

% Eliza is:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagIs,
	elizaIs(Atom, R).

% ELiza lives:
replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Atom),        
    nth0(0, Resp, X),  
	X == flagWhere,
	elizaLives(Atom, R).      

% Eliza watch

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Atom),        
    nth0(0, Resp, X),  
	X == flagWatch,
	elizaWatch(Atom, R).

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Atom),        
    nth0(0, Resp, X),  
	X == flagVisit,
	elizaVisit(Atom, R).

% Manejo específico para flagfather
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom), % Obtén el nombre de la persona
    Resp = [flagfather | _], % Verifica que sea la bandera correcta
    ( padre(Padre, Atom) -> 
        format(atom(R), 'El padre de ~w es ~w.', [Atom, Padre]) % Respuesta formateada
    ; 
        format(atom(R), 'Lo siento, no sé quién es el padre de ~w.', [Atom]) % Caso donde no hay datos
    ), !.

% Manejo específico para flagmother
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom), % Obtén el nombre de la persona
    Resp = [flagmother | _], % Verifica que sea la bandera correcta
    ( madre(Madre, Atom) -> 
        format(atom(R), 'La madre de ~w es ~w.', [Atom, Madre]) % Respuesta formateada
    ; 
        format(atom(R), 'Lo siento, no sé quién es la madre de ~w.', [Atom]) % Caso donde no hay datos
    ), !.

% Manejo específico para hermanos
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom), % Obtén el nombre de la persona
    Resp = [flagsiblings | _], % Verifica que sea la bandera correcta
    findall(Hermano, hermanos(Atom, Hermano), ListaHermanos), % Obtén todos los hermanos
    ( ListaHermanos \= [] -> 
        atomic_list_concat(ListaHermanos, ', ', ListaHermanosStr), % Convierte la lista a cadena
        format(atom(R), 'Los hermanos de ~w son: ~w.', [Atom, ListaHermanosStr]) % Respuesta formateada
    ; 
        format(atom(R), 'Lo siento, no sé quiénes son los hermanos de ~w.', [Atom]) % Caso donde no hay datos
    ), !.

% Manejo específico para primos
replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom), % Obtén el nombre de la persona
    Resp = [flagcousins | _], % Verifica que sea la bandera correcta
    findall(Primo, primos(Atom, Primo), ListaPrimos), % Obtén todos los primos
    ( ListaPrimos \= [] -> 
        atomic_list_concat(ListaPrimos, ', ', ListaPrimosStr), % Convierte la lista a cadena
        format(atom(R), 'Los primos de ~w son: ~w.', [Atom, ListaPrimosStr]) % Respuesta formateada
    ; 
        format(atom(R), 'Lo siento, no sé quiénes son los primos de ~w.', [Atom]) % Caso donde no hay datos
    ), !.

% Manejo específico para las banderas
replace0([I1, I2|_], Input, _, [flagclassskills|_], R) :-
    nth0(I1, Input, Clase), nth0(I2, Input, Raza),
    findall(Habilidad, personaje(Raza, Clase, Habilidad), Lista),
    sort(Lista, ListaUnica),
    ( ListaUnica \= [] -> 
        atomic_list_concat(ListaUnica, ', ', HabilidadesStr),
        format(atom(R), 'Las habilidades de la clase ~w de la raza ~w son: ~w.', [Clase, Raza, HabilidadesStr])
    ; 
        format(atom(R), 'No se encontraron habilidades para la clase ~w de la raza ~w.', [Clase, Raza])
    ), !.

replace0([I|_], Input, _, [flagclassraces|_], R) :-
    nth0(I, Input, Clase),
    findall(Raza, personaje(Raza, Clase, _), Lista),
    sort(Lista, ListaUnica), % Elimina duplicados y ordena la lista
    ( ListaUnica \= [] -> 
        atomic_list_concat(ListaUnica, ', ', RazasStr),
        format(atom(R), 'Las razas con la clase ~w son: ~w.', [Clase, RazasStr])
    ; 
        format(atom(R), 'No se encontraron razas con la clase ~w.', [Clase])
    ), !.


replace0([I|_], Input, _, [flagraceclasses|_], R) :-
    nth0(I, Input, Raza),
    findall(Clase, personaje(Raza, Clase, _), Lista),
    sort(Lista, ListaUnica), % Elimina duplicados y ordena la lista
    ( ListaUnica \= [] -> 
        atomic_list_concat(ListaUnica, ', ', ClasesStr),
        format(atom(R), 'Las clases de la raza ~w son: ~w.', [Raza, ClasesStr])
    ; 
        format(atom(R), 'No se encontraron clases para la raza ~w.', [Raza])
    ), !.


replace0([I|_], Input, _, [flagabilityraces|_], R) :-
    nth0(I, Input, Habilidad),
    findall(Raza, personaje(Raza, _, Habilidad), Lista),
    sort(Lista, ListaUnica),
    ( ListaUnica \= [] -> 
        atomic_list_concat(ListaUnica, ', ', RazasStr),
        format(atom(R), 'Las razas con la habilidad ~w son: ~w.', [Habilidad, RazasStr])
    ; 
        format(atom(R), 'No se encontraron razas con la habilidad ~w.', [Habilidad])
    ), !.

replace0([I1, I2|_], Input, _, [flagraceclass|_], R) :-
    nth0(I1, Input, Raza), nth0(I2, Input, Clase),
    findall(Habilidad, personaje(Raza, Clase, Habilidad), Lista),
    sort(Lista, ListaUnica),
    ( ListaUnica \= [] -> 
        atomic_list_concat(ListaUnica, ', ', HabilidadesStr),
        format(atom(R), 'Los personajes de la raza ~w con la clase ~w tienen las habilidades: ~w.', [Raza, Clase, HabilidadesStr])
    ; 
        format(atom(R), 'No se encontraron personajes para la raza ~w y clase ~w.', [Raza, Clase])
    ), !.




replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Nombre),  
    nth0(0, Resp, X), 
    X == flagEspecialidad,  
    resolver(Resultado),             
    (member([Nombre, Especialidad, _, _, _], Resultado) -> 
        R = ['La especialidad de', Nombre, 'es', Especialidad]
    ;   
        R = ['Lo siento, no encontre informacion sobre', Nombre]).    

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Nombre),  
    nth0(0, Resp, X), 
    X == flagHospital,  
    resolver(Resultado),             
    (member([Nombre, _,Hospital, _, _], Resultado) -> 
        R = [Nombre,'trabaja en', Hospital]
    ;   
        R = ['Lo siento, no encontre informacion sobre', Nombre]).  

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Nombre),  
    nth0(0, Resp, X), 
    X == flagEquipo,  
    resolver(Resultado),             
    (member([Nombre,_,_, Equipo, _], Resultado) -> 
        R = ['El equipo favorito de',Nombre,'es', Equipo]
    ;   
        R = ['Lo siento, no encontre informacion sobre', Nombre]).  

replace0([I|_], Input, _, Resp, R):- 
    nth0(I, Input, Nombre),  
    nth0(0, Resp, X), 
    X == flagInteres,  
    resolver(Resultado),             
    (member([Nombre,_, _,_, Interes], Resultado) -> 
        R = ['El interes de',Nombre,'es', Interes]
    ;   
        R = ['Lo siento, no encontre informacion sobre', Nombre]). 



replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagmother | _], madre(Atom, R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagsiblings | _], findall(X, hermanos(Atom, X), R), !.

replace0([I|_], Input, _, Resp, R) :-
    nth0(I, Input, Atom),
    Resp = [flagcousins | _], findall(X, primos(Atom, X), R), !.
	

replace0([I|Index], Input, N, Resp, R):-
	length(Index, M), M =:= 0,
	nth0(I, Input, Atom),
	select(N, Resp, Atom, R1), append(R1, [], R),!.

replace0([I|Index], Input, N, Resp, R):-
	nth0(I, Input, Atom),
	length(Index, M), M > 0,
	select(N, Resp, Atom, R1),
	N1 is N + 1,
	replace0(Index, Input, N1, R1, R),!.