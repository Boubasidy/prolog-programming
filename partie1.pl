dernier(X,[X],[]).
dernier(X,[Y|L],[Y|L_]):- dernier(X,L,L_).
rang_pair([],[]).
rang_pair([_],[]).
rang_pair([X,_|L1],[X|L2]):- rang_pair(L1,L2).
%insertion
insertion([],X,[X]).
insertion([Y|L1],X,[X,Y|L1]).
insertion([Y|L1],X,[Y|L2]):- insertion(L1,X,L2).
%partage
partage([],[],[]).
partage([X,Y|L],[X|L1],[Y|L2]) :- partage(L,L2,L1).
%suppression
suppression([X|L1],X,L1).
suppression([Y|L1],X,[Y|L2]) :- suppression(L1,X,L2).
%permutation
permutation([],[]).
permutation([X|L1],L2) :- permutation(L1,L3),insertion(L3,X,L2).
%palyndrome
append([], L, L).
append([X|Rest], List2, [X|Result]) :-
    append(Rest, List2, Result).



palyndrome([]).
palyndrome([_]).
palyndrome([X|L1]) :- 
    append(Middle, [X], L1),
    palyndrome(Middle).

    insertion([], _, []).
insertion([[Y]|Rest], X, [[X,Y]|Result]) :-
    insertion(Rest, X, Result).
append([[]], L, L).
append([X|Rest], List2, [X|Result]) :-
    append(Rest, List2, Result).

tous_les_mots(dic('*',false,Dico),L):-
    mots_dico(Dico,L),
mots_dico([],[[]]).
mots_dico([Dic|Rest],L):-
    mots_branche(Dic,Lb),
    mots_dico(Rest,Ld),
    append(Lb,Ld,L).

mots_branche(dic(X,true,Dico),L):-
    mots_dico(Dico,Ld),
    insertion(Ld,X,Nld),
    append([[X]],Nld,L).

mots_branche(dic(X,false ,Dico),L):-
    mots_dico(Dico,Ld),
    insertion(Ld,X,L).
tostring([],[]).
tostring([X|R],[SX|SR]):-
string_chars(SX,X),
tosring(R,SR).

inserer(String,dic('*',false,Dico),_Dico):-
    string_chars(String, List)
    predicat(List,Dico,_Dico).

predicat([X|RestL],[dic(X,_,Dico)|_],_Dico):-
    predicat(RestL,Dico,_Dico).

predicat([X|RestL],[dic(Y,_,_)|RestD],_Dico):-
    X \= Y, predicat([X|RestL],RestD,_Dico).

predicat([X|RestL],[],Ndic):-
    creer_dic([X|RestL],Ndic).
creer_dic([X],dic(X,true,[])).
creer_dic([X|R],dic(X,false,Dico)):-
    creer_dic(R,Dico).

    inserer(String, dic('*', false, Dico), Dico_) :-
    string_chars(String, List),
    predicat(List, Dico, Dico_).

predicat([X|RestL], [dic(X, _, Dico)|_], Dico_) :-
    predicat(RestL, Dico, Dico_).

predicat([X|RestL], [dic(Y, _, _)|RestD], Dico_) :-
    X \= Y,
    predicat([X|RestL], RestD, Dico_).

predicat([X|RestL], [], Ndic) :-
    creer_dic([X|RestL], Ndic).

creer_dic([X], dic(X, true, [])).
creer_dic([X|R], dic(X, false, Dico)) :-
    creer_dic(R, Dico).
