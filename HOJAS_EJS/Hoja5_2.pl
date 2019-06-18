%% EJERCICIO 1

% sumintersec(L1,L2,N)
% "L1 y L2 listas de enteros ascendentes"
% "N suma de los elementos intersección"

sumintersec([],L,0):-
    !.
sumintersec(L,[],0):-
    !.
sumintersec([X | Xs], [X | Ys], N):-
    sumintersec(Xs,Ys,N1),
    N is N1 + X.
sumintersec([X | Xs], [Y | Ys], N):-
    ((X > Y) -> sumintersec([X | Xs], Ys, N);
    sumintersec(Xs, [Y | Ys], N)).
    
%% EJERCICIO 2

% nomiembro(X,L)
% "X no es un elemento de L"

nomiembro(X,[]):-
    !.
nomiembro(X,[Y | Ys]):-
    X \= Y, nomiembro(X,Ys).
    
% hazconjunto(L,C)
% "C es un conjunto que representa lista C"
    
hazconjunto([],[]):-
    !.
hazconjunto([X|L],[X|C]):-
    nomiembro(X,L), 
    !, 
    hazconjunto(L,C).
hazconjunto([X|L ],C):-
    hazconjunto(L,C).
    
% union(C1,C2,C)
% "C conjunto unión de C1 y C2"

union([],C,C):-
    !.
union([X | C1], C2, [X | C]):-
    nomiembro(X,C2),
    !,
    union(C1,C2,C).
union([X | C1], C2, C):-
    union(C1,C2,C).

% interseccion(C1,C2,C)
% "C conjunto intersección de C1 y C2"

interseccion([],C,C):- 
    !.
interseccion([X|C1],C2,[X|C] ):-
    member(X,C2),
    !,
    interseccion(C1,C2,C).
interseccion([X|C1],C2,C):-
    interseccion(C1,C2,C).
    
%% EJERCICIO 3
% treeSort(L,LO)
% "LO lista resultante de hacer treeSort sobre L"

treeSort(L,LO):-
    listArbolOrd(L,AO),
    inorden(AO,LO).

% listArbolOrd(XS,AO)
% "Transforma árbol XS en lista AO"

listArbolOrd([],void):-
    !.
listArbolOrd([X | Xs], AO):-
    listArbolOrd(Xs,A),
    insertOrd(X,A,AO).
    
% insertOrd(X,A,AO)
% "AO árbol resultante de insertar"
% "elemento X en árbol A"
insertOrd(X,void,arbol(X,void,void)):-
    !.
insertOrd(X,arbol(Y,HI,HD),arbol(Y,NHI,NHD)):-
    X @< Y,
    !,
    insertOrd(X,HI,NHI).
insertOrd(X,arbol(Y,HI,HD),arbol(Y,NHI,NHD)):-
    insertOrd(X,HD,NHD).
    
%% EJERCICIO 4


    
    


