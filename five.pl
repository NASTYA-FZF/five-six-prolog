%one

name("Петя").
name("Лена").
name("Таня").

pet("собака").
pet("кошка").
pet("хомяк").

rule1(N,P):-
    name(N), N="Петя",
    pet(P), not(P="кошка"), not(P="хомяк").

rule1(N,P):-
    name(N), N="Таня",
    pet(P), P="кошка".

rule1(N,P):-
    name(N), N="Лена",
    pet(P).

one:-
    N1="Петя", rule1(N1,P1),
    N2="Таня", rule1(N2,P2),
    N3="Лена", rule1(N3,P3),
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

left("Юра", "Миша").
right("Юра", "Витя").

%X,Y,Z
%Y слева от Z, Y справа от X
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

%1-цвет, 2-национальность, 3-напиток, 4-марка сигарет, 5-животное

three:-
    Houses=[_,_,_,_,_],

    part(["Красный","Англичанин",_,_,_],Houses),

    part([_,"Швед",_,_,"Собака"],Houses),

    part([_,"Датчанин","Чай",_,_],Houses),

    left(["Зеленый",_,_,_,_],["Белый",_,_,_,_],Houses),

    part(["Зеленый",_,"Кофе",_,_],Houses),

    part([_,_,_,"PallMall","Птица"],Houses),

    Houses=[_,_,[_,_,"Молоко",_,_],_,_],

    part(["Желтый",_,_,"Dunhill",_],Houses),

    Houses=[[_,"Норвежец",_,_,_],_,_,_,_],

    neighbors([_,_,_,"Malboro",_],[_,_,_,_,"Кошка"],Houses),

    neighbors([_,_,_,_,"Лошадь"],[_,_,_,"Dunhill",_],Houses),

    part([_,_,"Пиво","Winfield",_],Houses),

    neighbors([_,"Норвежец",_,_,_],["Голубой",_,_,_,_],Houses),

    part([_,"Немец",_,"Rothmans",_],Houses),

    neighbors([_,_,_,"Malboro",_],[_,_,"Вода",_,_],Houses),

    part([Color,Nation,Drink,Sigar,"Рыба"],Houses),

    write("Держит рыбу: "), write(Nation), nl,
    write("Цвет дома: "), write(Color), nl,
    write("Напиток: "), write(Drink), nl,
    write("Марка сигарет: "), write(Sigar), nl,

    write("Все дома!"), nl, write(Houses),!.

%шестая

name6("Катя").
name6("Егор").
name6("Кира").
name6("Захар").
name6("Лера").

ogorod("Морковь").
ogorod("Капуста").

scoreM([],0):-!.

scoreM(["Морковь"|T],N):-
    !,
    scoreM(T,N1),
    N is N1+1.

scoreM(["Капуста"|T],N):-
    !,
    scoreM(T,N1),
    N is N1.

six:-
    name6(N), N="Егор", ogorod(O),
    name6(N1), N1="Катя", ogorod(O1), O1\=O,
    name6(N2), N2="Кира", ogorod(O2), O2\=O,
    name6(N3), N3="Захар", ogorod(O3), O3\=O2,
    name6(N4), N4="Лера", ogorod(O4), O4=O3,
    List = [O,O1,O2,O3,O4],
    scoreM(List,M), M=3,
    write("У Киры на грядке "), write(O2), nl,
    ListN = [N,N1,N2,N3,N4],
    write(ListN), nl, write(List), !.
