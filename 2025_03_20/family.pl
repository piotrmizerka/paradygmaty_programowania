:- discontiguous male/1, female/1, parent/2.

male(dicky).
male(randy).
male(mike).
male(don).
male(elmer).
female(anne).
female(rosie).
female(esther).
female(mildred).
female(greatgramma).
male(blair).

parent(don,randy).
parent(don,mike).
parent(don,anne).
parent(rosie,randy).
parent(rosie,mike).
parent(rosie,anne).
parent(elmer,don).
parent(mildred,don).
parent(esther,rosie).
parent(esther,dicky).
parent(greatgramma,esther).
parent(randy,blair).
parent(mike,juliet).

male(mel).
male(teo).
parent(melsr,mel).
parent(melsr,teo).

% father, mother, son, dauther, uncle, aunt, grandmother, grandfather, sister, brother, cousin, ancestor

father(X,Y) :- male(X),parent(X,Y).

brother(X,Y) :-
             male(X),
             parent(P,X),
             parent(P,Y),
             X \= Y.

cousin(X,Y) :-
            parent(P,X),
            parent(R,Y),
            P \= R,
            parent(S,P),
            parent(S,R).
            


