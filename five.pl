%one

name("����").
name("����").
name("����").

pet("������").
pet("�����").
pet("�����").

rule1(N,P):-
    name(N), N="����",
    pet(P), not(P="�����"), not(P="�����").

rule1(N,P):-
    name(N), N="����",
    pet(P), P="�����".

rule1(N,P):-
    name(N), N="����",
    pet(P).

one:-
    N1="����", rule1(N1,P1),
    N2="����", rule1(N2,P2),
    N3="����", rule1(N3,P3),
    P1\=P2, P2\=P3, P1\=P3, !,
    write(N1), write("-"), write(P1), nl,
    write(N2), write("-"), write(P2), nl,
    write(N3), write("-"), write(P3).

one1:-
    rule1(N1,P1), rule1(N2,P2), rule1(N3,P3),
    P1\=P2, P2\=P3, P1\=P3, !,
    write(N1), write("-"), write(P1), nl,
    write(N2), write("-"), write(P2), nl,
    write(N3), write("-"), write(P3).

%two

left("���", "����").
right("���", "����").

%X,Y,Z
%Y ����� �� Z, Y ������ �� X
two:-
    left(Y,Z), right(Y,X), !,
    write(X), write("-"), write(Y), write("-"),
    write(Z).

%three

part(House, [H|_]):-
    H=House.

part(House, [_|T]):-
    part(House, T).

left(Lhouse, Rhouse, [L, R|_]):-
    L=Lhouse, R=Rhouse.

left(Lhouse, Rhouse, [_|T]):-
    left(Lhouse, Rhouse, T).

neighbors(House1, House2, Houses):-
    left(House1, House2, Houses).

neighbors(House1, House2, Houses):-
    left(House2, House1, Houses).

%1-����, 2-��������������, 3-�������, 4-����� �������, 5-��������

three:-
    Houses=[_,_,_,_,_],

    part(["�������","����������",_,_,_],Houses),

    part([_,"����",_,_,"������"],Houses),

    part([_,"��������","���",_,_],Houses),

    left(["�������",_,_,_,_],["�����",_,_,_,_],Houses),

    part(["�������",_,"����",_,_],Houses),

    part([_,_,_,"PallMall","�����"],Houses),

    Houses=[_,_,[_,_,"������",_,_],_,_],

    part(["������",_,_,"Dunhill",_],Houses),

    Houses=[[_,"��������",_,_,_],_,_,_,_],

    neighbors([_,_,_,"Malboro",_],[_,_,_,_,"�����"],Houses),

    neighbors([_,_,_,_,"������"],[_,_,_,"Dunhill",_],Houses),

    part([_,_,"����","Winfield",_],Houses),

    neighbors([_,"��������",_,_,_],["�������",_,_,_,_],Houses),

    part([_,"�����",_,"Rothmans",_],Houses),

    neighbors([_,_,_,"Malboro",_],[_,_,"����",_,_],Houses),

    part([Color,Nation,Drink,Sigar,"����"],Houses),

    write("������ ����: "), write(Nation), nl,
    write("���� ����: "), write(Color), nl,
    write("�������: "), write(Drink), nl,
    write("����� �������: "), write(Sigar), nl,

    write("��� ����!"), nl, write(Houses),!.

%������

name6("����").
name6("����").
name6("����").
name6("�����").
name6("����").

ogorod("�������").
ogorod("�������").

scoreM([],0):-!.

scoreM(["�������"|T],N):-
    !,
    scoreM(T,N1),
    N is N1+1.

scoreM(["�������"|T],N):-
    !,
    scoreM(T,N1),
    N is N1.

six:-
    name6(N), N="����", ogorod(O),
    name6(N1), N1="����", ogorod(O1), O1\=O,
    name6(N2), N2="����", ogorod(O2), O2\=O,
    name6(N3), N3="�����", ogorod(O3), O3\=O2,
    name6(N4), N4="����", ogorod(O4), O4=O3,
    List = [O,O1,O2,O3,O4],
    scoreM(List,M), M=3,
    write("� ���� �� ������ "), write(O2), nl,
    ListN = [N,N1,N2,N3,N4],
    write(ListN), nl, write(List), !.
