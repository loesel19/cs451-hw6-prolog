%problem1 FIN
isMember(X, [X | _]).
isMember(X, [_| Tail]):-
    member(X, Tail).
%problem2 FIN
addElem(X, List, [X | List]).
%problem3 X
delElem(X, [X | Tail], Tail).
delElem(X, [Head | Tail], L) :-  delElem(X, Tail, [Head, L]).
%problem4 FIN
prodList([], 1).
prodList([Head | Tail], P) :-
    prodList(Tail, P1),
    P is Head * P1.
%problem5 FIN
prodScalar([], [], 0).
prodScalar([H | T], [H1 | T1], P) :-
    prodScalar(T, T1, P1),
    P is (H * H1) + P1.
%problem6 FIN
prodVector([], [], []).
prodVector([H | T], [H1 | T1], P) :-
    prodVector(T, T1, P1),
    X is H * H1,
    addElem(X, P1, P).
%problem7
unionList([],[],[]).
unionList([], [H | T], U):-
    isMember(H, U) = false, !,
    addElem(H, U, U1),
    U is U1,
    unionList([], T, U1).
unionList([H | T], L, U):-
    delElem(H, L, L1),
    print(L1),
    unionList(T, L1, U1),
    addElem(H, U1, U).
