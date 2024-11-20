% La primer linea eliza:- writeln es la regla con la que se inicializa el eliza.
% Es decir, al ejecutar el programa, lo primero que veremos serán las líneas de código de la 3 a la 5
eliza:-	writeln('Hola , mi nombre es  Eliza tu  chatbot,
	por favor ingresa tu consulta,
	usar solo minúsculas sin . al final:'),
	readln(Input),
	eliza(Input),!.
% Esta segunda y tercer regla detecta un input del usuario diciendo Adios con punto o sin el punto, y manda el mensaje
% Adios. espero poder verte ayudado. 	
eliza(Input):- Input == ['Adios'],
	writeln('Adios. espero poder verte ayudado.'), !.
eliza(Input):- Input == ['Adios', '.'],
	writeln('Adios. espero poder verte ayudado.'), !.
% Aquí empieza a detectar los template entreparéntesis detecta el input del usuario, lo que responde el chatbot, y un indice
% al final de la oración por si debe guardar valores
% Luego, el predicado match(Stim, Input) verifica si el Input del usuario coincide con el patrón Stim.
% Si hay coincidencia, el predicado replace0(IndStim, Input, 0, Resp, R) construye la respuesta final (R) 
% según el patrón y la entrada del usuario.
% Imprime la respuesta generada (R) y espera una nueva entrada del usuario, volviendo a llamarse recursivamente.
eliza(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aquí es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	eliza(Input1), !.

template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
template([buendia, mi, nombre, es, s(_), '.'], ['buen dia', 'Como', estas, tu, 0, '?'], [4]).

template([hola, ',', mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [5]).
template([buendia, ',', mi, nombre, es, s(_), '.'], ['Buendia', 'Como', estas, tu, 0, '?'], [5]).

template([hola, _], ['Hola', 'como', estas, tu, '?'], []).
template([buendia, _], ['Buendia', 'Como', estas, tu, '?'], []).

template([yo, s(_), yo, soy, s(_),'.'], [por, que, 0, eres, 1, '?'], [1, 4]).
template([yo, s(_), tu, '.'], [why, do, you, 0, me ,'?'], [1]).
template([yo, soy, s(_),'.'], [porque, eres, tu, 0, '?'], [2]).

% pregunta algo que le gusta a eliza
template([te, gustan, las, s(_), _], [flagLike], [3]).
template([te, gustan, los, s(_), _], [flagLike], [3]).

% preguntar donde vive eliza
template([vives, en, s(_), _], [flagLive], [2]).
template([vives, en, s(_), ?], [flagLive], [2]).
template([tu,vives,en,s(_),?], [flagLive], [3]).

% pregunta que come eliza
template([te,gusta,comer,s(_),?], [flagEat], [3]).
template([tu,comes,s(_)], [flagEat], [2]).
template([tu,comes,s(_),_], [flagEat], [2]).

% pregunta que tipo de musica escucha
template([te,gusta,escuchar,s(_),_], [flagListen], [3]).
template([te,gusta,el,genero,s(_),_], [flagListen], [4]).

		 % pregunta algo que hace eliza
template([tu, eres, s(_), _], [flagDo], [2]).
% pregunta algo que es eliza
template([que, eres, tu, s(_)], [flagIs], [2]).
template([eres, s(_), '?'], [flagIs], [2]).

template([como, estas, tu, '?'], [yo, estoy, bien, ',', gracias, por, preguntar, '.'], []).

template([yo, pienso, que, _], [bueno, esa, es, tu, opinion], []).
template([porque, _], [esa, no, es, una, buena, razon, '.'], []).
template([i, have, s(_), with, s(_), '.'], ['You', have, to, deal, with, your, 0, and, your, 1, in, a, mature, way, '.'], [2, 4]).
template([i, s(_),  _], [i, can, recommend, you, a, book, about, that, issue], []).
template([please, s(_), _], ['No', i, can, not, help, ',', i, am, just, a, machine], []). 
		 template([tell, me, a, s(_), _], ['No', i, can, not, ',', i, am, bad, at, that], []).

% Templates añadidos por mi sin variable anonima
template([conoces,el,pais,mexico,'?'],[si,aunque,quiero,conocer,mas],[]).
template([conoces, de , mexico,'?'],[si, un, poco], []).
template([conoces, mexico,'?'],[si,lo,conozco],[]).
template([te, gustaria, conocer, mexico, '?'],[ya,lo,conozco],[]).

template([que,opinas,de,morelia],[una,ciudad,bonita],[]).

% Templates añadidos por mi con variable anonima
template([haz, visitado , el, pais , s(_),'?'],[no, conozco, ese, pais],[]).

				  
template(_, ['Please', explain, a, little, more, '.'], []). 
% Lo que le gusta a eliza : flagLike
elizaLikes(X, R):- likes(X), R = ['Yeah', i, like, X].
elizaLikes(X, R):- \+likes(X), R = ['Nope', i, do, not, like, X].
likes(apples).
likes(ponies).
likes(zombies).
likes(manzanas).
likes(computadoras).
like(carros).

% Donde vive eliza: flagLive
elizaLive(X, R):- live(X), R = ['Si', vivo, en, X].
elizaLive(X, R):- \+live(X), R = ['No', no, vivo, en, X].
live(mexico).
live(morelia).
live(michoacan).
live(itm).

% lo que le gusta comer a Eliza: flagEat
elizaEat(X, R):- eat(X), R = ['Si', me, gusta, comer, X].
elizaEat(X, R):- \+eat(X), R = ['No', no, me, gusta, comer, X].
eat(hamburguesa).
eat(pizza).
eat(sandwich).
eat(tacos).

% lo que le gusta escuchar a Eliza: flagListen
elizaListen(X, R):- listen(X), R = ['Si', me, gusta, escuchar, X].
elizaListen(X, R):- \+listen(X), R = ['No', no, me, gusta, escuchar, X].
listen(rock).
listen(pop).
listen(hiphop).

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

% Eliza live:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagLive,
	elizaLive(Atom, R).

% Eliza eat:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagEat,
	elizaEat(Atom, R).	

% Eliza listen:
replace0([I|_], Input, _, Resp, R):-
	nth0(I, Input, Atom),
	nth0(0, Resp, X),
	X == flagListen,
	elizaListen(Atom, R).	

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
