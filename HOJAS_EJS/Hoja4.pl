% Programación Declarativa
% Hoja 4

% EJERCICIO 1. Indica cuáles son unificables, y encuentra el u.m.g. o justifica la respuesta.

% a.  {p(g(Y), f(X, h(X), Y)), p(X, f(g(Z), W, Z))}.

% b. {p(a, X, f(g(Y))), q(Y, f(Z), f(Z))}.

% c. {q(a, X, f(g(Y))), q(Y, f(Z), f(Z))}.

% d. {¬p(f(g(a,b), g(h(Z), b)), h(X)), p(f(X,X), h(g(Z,Z)))}.

% e. {p(X,Y), p(f(a), g(X)), p(f(Z), (f(Z)))}.

% f. {p(X, f(g(Y), b)), p(h(a,Y), f(g(k(X)), b))}.

% ¿?

% EJERCICIO 2. Convierte {F1..Fk} en P de cláusulas de Horn equivalente. Demuestra P |= G usando resolución SLD.

% F1 ≡ ∀X(p(X) → q(X))
    % F1 = ∀x(~p(X) v q(X))
% F2 ≡ ∀X(p(X) ∧ r(X))
    % F2 = ∀x(p(x) ^ r(x))
% F3 ≡ ∀X(r(X) → (s(X, a) ∧ ∀Z(q(Z) → t(a, Z))))
    % F3 = ∀x(~r(x) v (s(X,a) ^ ∀z(~q(z) v t(a,Z))))
% F4 ≡ ∀X(∃Y ∃Z(s(X, Y ) ∧ t(Y, Z)) → w(X))
% G ≡ ∃X(p(X) ∧ w(X))

% EJERCICIO 3.

nat(c).
nat(s(X)):-nat(X).


% sum(X,c,X)
% "X: primer símbolo a sumar"
% "c: segundo símbolo a sumar"
% "X: resultado"
sum(X,c,X).
sum(X,s(Y),s(Z)):- sum(X,Y,Z).

prod(X,Y,Z):-   prod(X,Y,c,Z).

prod(c,Y,Ac,Ac).
prod(s(X),Y,Ac,Z):- sum(Ac,Y,NAc),
                    prod(X,Y,NAc,Z).

% pot(X,N,Y) : X,N,Y son números naturales
%            : X != 0
%            : X^N= Y

pot(s(X),c,s(c)):-  nat(X).
pot(s(X),s(N),Y):-  pot(s(X),N,Z),
                    prod(s(X),Z,Y).

% fact(c,s(c))
% "c: resultado"
% "s(c): entrada"
fact(c,s(c)).
fact(s(X),Y):-  nat(X),
                fact(X,Z),
                prod(s(X),Z,Y).
                
fib(c,s(c)).            
fib(s(c),s(c)).
fib(s(s(X)), Y):-
    fib(s(X),Z1),
    fib(X,Z2),
    sum(Z1,Z2,Y).
    
% EJERCICIO 4.

% Árbol hecho en papel.

% EJERCICIO 5. polfib(N,X,PF)

pol_fib(c,X,s(c)):- nat(X).
pol_fib(s(N),X,M):-
    pol_fib(N,X,M1),
    fib(s(N),M2),
    pot(X,s(N),M3),
    prod(M2,M3,M4),
    sum(M1,M4,M).
    
polfib(c,X,s(c)):- nat(X).
polfib(s(N),X,M):- polfib(s(N),X,s(c),s(c), c, s(c), M).

polfib(c,X,Act,Acupot,Acu1,Acu2,Act).
polfib(s(N),X,Act,Acupot,Acu1,Acu2,M):-
    sum(Acu1, Acu2, Acu3),
    prod(Acupot, X, Acupot1),
    prod(Acu3, Acupot1, Acu4),
    sum(Act, Acu4, NAct),
    polfib(N, X, Nact, Acupot1, Acu2, Acu3, M).
    
% EJERCICIO 6.

p(a).
p(f(f(X))):- p(X).
q(a,a).
q(f(X),f(f(f(f(Y))))):- q(X,Y).
r(a,f(a)).
r(f(X),Z):- r(X,Y), q(Y,Z).

% a) ÁRBOLES EN PAPEL

% b)
% p(X)      : X es un número par.
% q(X,Y)    : Y = X * 4.
% r(X,Y)    : Y = 4^X.

