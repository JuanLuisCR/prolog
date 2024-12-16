% Hechos y posibles opciones
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

% Solución del problema
resolver(Resultado) :-
    % Creamos una lista de médicos con sus atributos
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
