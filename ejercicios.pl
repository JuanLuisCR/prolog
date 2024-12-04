% Ejercicio 1
% flatten([1, [2, [3, 4], 5], [6]], Resultado).

% Ejemplo de uso de permutation/2
% permutation([a, b, c], Permutacion).

% Ejemplo de uso de subconjunto/2
% subset([1, 2, 3], Subconjunto).

% Check if a number is prime.
is_prime(Num) :-
    Num > 1,
    \+ has_divisor(Num, 2).

% Check if a number has a divisor starting from Div.
has_divisor(Num, Div) :-
    Div * Div =< Num,    % Only check divisors up to the square root of Num.
    Num mod Div =:= 0 ;  % Num is divisible by Div.
    NextDiv is Div + 1,  % Try the next possible divisor.
    has_divisor(Num, NextDiv).

% Find all prime numbers between 1 and 20 using findall/3.
find_primes(Primes) :-
    findall(Prime, (between(1, 20, Prime), is_prime(Prime)), Primes).