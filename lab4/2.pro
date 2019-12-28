predicates

nondeterm likes(symbol,symbol)
nondeterm can_buy(symbol, symbol)
nondeterm person(symbol)
nondeterm exist(symbol)
nondeterm haveMoney(symbol)

clauses

person(vlad).
person(christina).
person(den).
person(ruslan).
person(eduard).
person(caesar).
person(roman).

haveMoney(christina).
haveMoney(ruslan).
haveMoney(caesar).
haveMoney(roman).
haveMoney(eduard).

likes(vlad, juice).
likes(christina, milk).
likes(den, apple).
likes(ruslan, orange).
likes(eduard, melon).
likes(caesar, bun).

exist(juice).
exist(milk).
exist(apple).
exist(orange).
exist(bun).

can_buy(X, Y) :-
	person(X),
	exist(Y),
	likes(X, Y),
	haveMoney(X).

goal

can_buy(X, Y).