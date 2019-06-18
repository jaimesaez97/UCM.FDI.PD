%% EJERCICIO 1

% sumintersec(L1,L2,N)
% "L1 y L2 son dos listas de enteros," 
% "ordenadas de menor a mayor y N es "
% "la suma de los elementos de su    "
% "intersección."

% Casos Base: alguna de las listas es vacía
sumintersec([],L,0).
sumintersec(L,[],0).

% Casos Recursivos: 
% 1. Hay un elemento igual en las listas
sumintersec([X | L1], [X | L2], N):-
	sumintersec(L1,L2,N1),
	N is N1 + X.

% 2. Hay un elemento desigual en las listas
sumintersec([X | L1], [Y | L2], N):-
	((X > Y), sumintersec([X | L1], L2, N));
	(sumintersec(L1,[Y | L2],N)).


%% EJERCICIO 2

% nomiembro(X,L)
% "X no es elemento de lista L"

nomiembro(X,[]):- !.
nomiembro(X,[Y | L]):-
	X \= Y, nomiembro(X,L).

% hazconjunto(L,C)
% "C conjunto (lista), que tiene iguales"
% "elementos que L sin repetir"

hazconjunto(_,C).	% Si se acaba la lista hemois creado conjunto entero
hazconjunto([X | L], [X | C]):-
	momiembro(X,L),
	!,
	hazconjunto(X,C).
hazconjunto([X | L], C):-
	hazconjunto(L,C).

% union(C1,C2,C)
% "C es conjunto unión de C1 y C2"

union([],C,C):- !.
union([X | C1], C2, [X | C]):-	
	nomiembro(X,C2),
	!,
	union(C1,C2,C).
union([X | C1], C2, C):-
	union(C1,C2,C).  

% intersección(C1,C2,C)
% "C es conjunto intersección de C1 y C2"

interseccion([],C,C):- !.
interseccion([X|C1],C2,[X|C]):- 
	member(X,C2),  
	!,  
	interseccion(C1,C2,C) .
interseccion([X|C1],C2,C):-
	interseccion(C1,C2,C).

%% EJERCICIO 3

% treeSort(L,LO)
% "LO resultado aplicar TreeSort a L"

treeSort(L,LO):-
	listArbolOrd(L,AO),
	inorden(AO,LO).		% primero izq, luego raíz, luego der

% listArbolOrd(XS,AO)
% "Transforma árbol XS en lista ordenada AO"
listArbolOrd([],void):-
	!.
listArbolOrd([X | XS], AO):-
	listArbolOrd(XS,A),
	insertOrd(X,A,AO).

% insertOrd(X,A,AO)
% "AO resultado de insertar elemento X en A"
insertOrd(X,void,arbol(X,void,void)):-	
	!.
insertOrd(X,arbol(Y,HI,HD),arbol(Y,NHI,NHD)):-
	X @< Y, 
	!,
	insertOrd(X,HI,NHI).
insertOrd(X,arbol(Y,HI,HD),arbol(Y,NHI,NHD)):-
	insertOrd(X,HD,NHD). 

%% EJERCICIO 3

% simetrico(A1,A2)
% "A1 y A2 árboles simétricos"

simetrico(void, void):-
	!.
simetrico(arbol(X,HI,HD),arbol(Y,NHI,NHD)):-
	X == Y,
	simetrico(HI,NHI),
	simetrico(HD,NHD).

% sumatree(A,N)
% "N suma de elementos de A"

sumatree(void,0):-
	!.
sumatree(arbol(X,HI,HD),N):-
	sumatree(HI,N1),
	sumatree(HD,N2),
	N is N1 + N2 + X.

% maxveces(A,X)
% "X elemento más repetido en A"

maxveces(A,X):-
	arbolToList(A,L),
	ordena(L,LO),
	maxAparece(LO,X).

maxAparece([C | RS], X):-
	maxAparece(RS,C,1,C,1,X).

% maxAparece(A,B,C,D,E,F)
% "A: lista en la que se busca"
% "B: elemento que aparece más veces (por ahora)"
% "C: número de veces que aparece B"
% "D: "
maxAparece([],_,_,Z,_,Z):-	
	!.
maxAparece([C | RS],C,N,Z,M,X):-
	!,
	N1 is N + 1,
	maxAparece(RS,C,N1,Z,M,X)
maxAparece([C | RS],Y,N,Z,M,X):-
	N > M, !,
	maxAparece(RS,C,1,Y,N,X).





