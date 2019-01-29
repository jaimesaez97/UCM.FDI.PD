% EJERCICIO 2
contenida([],_).
contenida([X|XS],[Y|YS]):-
		X == Y,contenida(XS,YS).
contenida([X|XS],[Y|YS]):-
		X > Y,contenida([X|XS],[YS]).
% EJERCICIO 3
sumintersec2(_,[],0).
sumintersec2([],_,0).
sumintersec2([X|XS],[Y|YS],N):-
		X == Y,sumintersec2(XS,YS,N1),N is N1+X.
sumintersec2([X|XS],[Y|YS],N):-
		X < Y,sumintersec2(XS,[Y|YS],N).
sumintersec2([X|XS],[Y|YS],N):-
		X > Y,sumintersec2([X|XS],YS,N).
% EJERCICIO 4
elimina([],_,[]).
elimina([X|XS],Y,LS):-
		X == Y,elimina(XS,Y,LS).
elimina([X|XS],Y,[X|LS]):-
		X \== Y,elimina(XS,Y,LS).

% EJERCICIO 5
subtermino(T, T).
subtermino(S, T):- functor(T, F, NA), sub(S, T, NA).
sub(S, T, N) :- arg(N, T, A), subtermino(S, A).
sub(S, T, N) :- N > 1, N1 is N - 1, sub(S, T, N1).

subtermino2(T, T).
subtermino2(S, T):- T =..
[F | LA], subtermlist(S, LA).
subtermlist(S, [A | LA] ) :- subtermino2(S, A).
subtermlist(S, [A | LA] ) :- subtermlist(S, LA).

subst(T, S, T, S).
subst(T, S, E, E) :- T /= E, atomic(E).
subst(T, S, E, NE):- E =.. [F | LA], substlist(T, S, LA, NLA), NE =..
[F | NLA].
substlist(T, S, [ ], [ ]).
substlist(T, S, [A | LA], [NA | NLA]) :- subst(T, S, A, NA), substlist(T, S, LA, NLA).