%problem1 FIN 'maybe add bang in base case
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
%problem7 X
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

%problem8 X
dice(1).
dice(2).
dice(3).
dice(4).
dice(5).
dice(6).
getDices(0, 0, []).
getDices(Sum, N, Res) :-
    dice(X),
    Sum > X, Sum > 0,
    N1 is N - 1,
    Sum1 is Sum - X,
    addElem(X, Res, Res1),
    getDices(Sum1, N1, Res1).
%problem9 Fin
max([], Max):- print('base'),!, nl, Max = 0.
max([H | T], Max):-
    max(T, Max1),
    H > Max1, !,
    print('H > Max,   '), print(H), print(' : '), print(Max1),nl,
    Max = H.
max([H | T], Max):-
    max(T, Max1),
    print('Max > H,   '), print(Max1), print(' : '), print(H), nl,
    Max = Max1.
%problem10
sumOfOthers([L]) :-
    max([L], Max),
    sumOHelp([L], Max).
sumOHelp([H | T], Max) :-
    delElem(Max, [H | T], L),
    sumList(L, Sum),
    Sum = Max.
sumList([H | T], Sum):-
    
