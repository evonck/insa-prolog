% 1. Thème de la généalogie

% Needs to be done

% 2. Manipulation de listes

elem(Obj, [Obj|R], R).
elem(Obj, [T|Q], [T|R]) :- elem(Obj, Q, R).


% Concatenation de listes
appnd([], L, L).
appnd([Head|T], Lo, [Head|Ln]) :- appnd(T, Lo, Ln).

% Inversion de liste
inv([], []).
inv([Head|Tail], Res) :- inv(Tail, Inv), appnd(Inv,[Head], Res). 

% replacetitution dans une liste
replaceAll(Old, New, [], Res).
replaceAll(Old, New, [Old|Q], [New|T]) :- replaceAll(Old, New, Q, T).
replaceAll(Old, New, [H|T1], [H|T2]) :- H \= Old, replaceAll(Old, New, T1, T2).



% 3. Thème arithmétique

element(1,X,[X|_]).
element(I,X,[_|Q]):- (integer(I), I1 is I-1, element(I1,X,Q)), ! ;(element(I1,X,Q), I is I1+1).

% 4. Thème « ensembles »


enlever_doublon([],[]).
enlever_doublon([X|L],R):- enlever_doublon(L,R), member(X,R).
enlever_doublon([X|L],[X|R]):- enlever_doublon(L,R), not(member(X,R)).


has_duplicates([X|T]):- member(X,T).
has_duplicates([_|T]):- has_duplicates(T).


long([], 0).
long([_|Q], N) :-long(Q, N1), N is N1 + 1. 

equal(L1, L2) :- long(L1, N1), long(L2,N2), N1 is N2.
equal([L1|R1], L2) :- member(L1,L2), equal(R1,L2).
% -> pb vu que la taille de L1 diminue donc le premier prédicat est faux a la 2eme itération...

