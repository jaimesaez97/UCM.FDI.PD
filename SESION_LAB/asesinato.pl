profesion(juan,informatico).
profesion(alfonso,carnicero).
profesion(roberto,carpintero).

tiene_pasado_turbio(juan).

tuvo_relacion_sentimental(alfonso, filomena).

quizas_tenga(informatico, ordenador).
quizas_tenga(informatico, portatil).
quizas_tenga(carnicero, cuchillo).
quizas_tenga(carnicero, bata).
quizas_tenga(carpintero, lija_del_ocho).
quizas_tenga(carpintero, sierra).
quizas_tenga(carpintero, taladro).

es(cuchillo, arma_blanca).
es(tijeras, arma_blanca).
es(sierra, arma_blanca).


asesinado_con(rosa, arma_blanca).
asesinado_con(filomena, cuchillo).

% sospechoso X de matar a Y debido al razonamiento Z
sospechoso(X, Y, mismo_objeto):-
	asesinado_con(Y,Obj),
	profesion(X,Prof),
	quizas_tenga(Prof,Obj).
sospechoso(X, Y, mismo_tipo_objeto):-
	asesinado_con(Y, Tipo_obj),
	profesion(X, Prof),
	quizas_tenga(Prof, Obj),
	es(Obj, Tipo_obj).
sospechoso(X,Y, pasado_turbio):-
	asesinado_con(Y,_),
	tiene_pasado_turbio(X).
sospechoso(X,Y, relacion_sentimental):-
	asesinado_con(Y,_),
	tuvo_relacion_sentimental(X,Y).
	
	fin.