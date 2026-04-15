ancestor(X,Y, _) :-
    parent(X,Y).

ancestor(X,Y, Visited) :-
    parent(X,Z),
    \+ member(Z, Visited),
    ancestor(Z,Y, [Z|Visited]).
	
ancestor(X,Y) :-
    ancestor(X,Y, []).

task_4 :- 
    ancestor('1432866014','1268649062').

exists_not_ancestor(A) :-
    node(Y),
    A \= Y,
    \+ ancestor(A, Y).

task_5 :- 
    exists_not_ancestor('1432866014').