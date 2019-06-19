% veces(Xs,Ns)

veces([],Ns):-
    !.
veces(Xs,Ns):-
    total(Xs,Xs,Ns).
 
total([],Ys,[]):-
    !.
total([X | Xs],Ys,[N | Ns]):-
    !,
    contar(X,Ys,N),
    total(Xs,Ys,Ns).
    
contar(X,[],0).
contar(X,[X | Xs],N):-
    !,
    contar(X,Xs,N1),
    N is N1 + 1.
contar(X,[Y | Xs],N):-
    contar(X,Xs,N).
