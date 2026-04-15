node('alpha').
node('beta').
node('a').
node('b').
node('c').
node('d').

parent('alpha','a').
parent('a','b').
parent('b','a').
parent('b','c').
parent('c','d').

test_case_1 :-
    ancestor('a','d').

ancestor_not_guarded(X,Y) :-
    parent(X,Y).

ancestor_not_guarded(X,Y) :-
    parent(X,Z),
    ancestor_not_guarded(Z,Y).
              
test_case_2 :-
    ancestor_not_guarded('a','d').