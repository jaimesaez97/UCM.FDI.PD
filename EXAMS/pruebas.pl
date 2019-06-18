veces(X,[],0).
veces(X, [X | Xs], N):-
	veces(X,Xs,N1),
	N1 is N + 1.

veces(X,[Y | Xs], N):-
	veces(X,Xs,N).