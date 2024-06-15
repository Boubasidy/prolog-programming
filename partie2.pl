%1 commenta
inf(X,Y):-
X<Y.
liste_triee([]).
liste_triee([X]).
liste_triee([X,X|L]):-
liste_triee([X|L]).
liste_triee([L,X|R]):-
 inf(L,X),
 liste_triee(R).


%2

place(X,[],[X]).
place(X,[X|T],[X,X|T]).%SI XL EST TRIE ALORS ELLE RESTE TRIE

place(X,[Y|T],[X,Y|T]):-
inf(X,Y).

place(X,[Y|T],[Y|TX]):-
inf(Y,X),place(X,T,TX).


%3

dped(P,[],[],[],[]).

dped(P,[X|L],PPP,EP,PGP):
-P=X,dped(P,L,PPP,EP,PGP).

dped(P,[X|L],[X,|PPP],EP,PGP):-
inf(X,P),dped(P,L,PPP,EP,PGP).

dped(P,[X|L],PPP,EP,[X|PGP]):-
inf(P,X),dped(P,L,PPP,EP,PGP).

%4

fusion([],[],[]).
fusion(T,[],T):-
T=[_|_].


fusion([],[X|T],[X|T],[X|T]).


fusion([X|T1],[X|T2],[X,X|T]):-
fusion(T1,T2,T).

fusion([X|T1],[Y|T2],[X|T]):-
inf(X,Y),fusion(T1,[Y|T2],T)

fusion([X|T1],[Y|T2],[Y|T]):-
inf(Y,X),fusion([X|T1],T2,T).


%5

tri_permutation(L,T):-
    permutation(L,T),%VOIR LA CORRECTION DU TD PASSE
    liste_triee(T).


%6

tri_insertion([X|L],TX):-
    tri_insertion(L,T),
    place(X,,TX).


%7
tri_fusion([],[]).
tri_fusion([X],[X]).
tri_fusion(L,T):-
L=[_|_],partage(L,L1,L2),%DEJA FAIT
tri_fusion(L1,T1),
tri_fusion(L2,T2),
fusion(T1,T2,T).

%8
%append(L1,L2,L1L2).=(L1L2=(L10L2))

tri_rapide([],[]).
tri_rapide([P|L],T):-

dped(P,L,PPP,EP,PGP),
tri_rapide(PPP,PPPT),
tri_rapide(PGP,PGPT),
append(PPPT,[P|EP],I),
append(I,PGPT,T).





