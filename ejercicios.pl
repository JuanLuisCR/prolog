% Ejercicio 1
% flatten([1, [2, [3, 4], 5], [6]], Resultado).

% Ejemplo de uso de permutation/2
% permutation([a, b, c], Permutacion).

% Ejemplo de uso de subconjunto/2
% subset([1, 2, 3], Subconjunto).

%Encontrar primos
es_primo(N) :- N > 1, \+ (between(2, N1, N), N1 < N, N mod N1 =:= 0).
findall(Primo, (between(1, 20, Primo), es_primo(Primo)), Primos).

%Concatenar dos listas
append([1, 2], [3, 4], Result).

%
findall(X, member(X, [1, 2, 2, 3, 3, 3, 4]), Soluciones).

