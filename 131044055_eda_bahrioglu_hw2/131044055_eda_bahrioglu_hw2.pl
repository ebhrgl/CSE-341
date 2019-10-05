%PROGRAMLAMA DÝLLERÝ HW2 PROLOG
%Created by Eda BAHRIOGLU 
%Number 131044055
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NOT
%Buyuk harflerden kaynakli cok fazla warning aldigim icin kucuk herflere donusturup %o sekilde test ettim.

flight(istanbul,izmir,3).
flight(izmir,istanbul,3).
flight(istanbul,ankara,5).
flight(ankara,istanbul,5).
flight(istanbul,trabzon,3).
flight(trabzon,istanbul,3).
flight(edirne,edremit,5).
flight(edremit,edirne,5).
flight(edremit,erzincan,7).
flight(erzincan,edremit,7).
flight(ankara,izmir,6).
flight(izmir,ankara,6).
flight(ankara,konya,8).
flight(konya,ankara,8).
flight(ankara,trabzon,2).
flight(trabzon,ankara,2).
flight(izmir,antalya,1).
flight(antalya,izmir,1).
flight(antalya,diyarbakir,5).
flight(diyarbakir,antalya,5).
flight(konya,diyarbakir,1).
flight(diyarbakir,konya,1).
flight(konya,kars,5).
flight(kars,konya,5).
flight(kars,gaziantep,3).
flight(gaziantep,kars,3).

%rota sartlari gosterilmistir.Belirtilen bir node tan diger noda gidis sartina göre %rota %bulunur.

%PART1

%Direk rotalar
route(X,Y,C):-flight(X,Y,C).  
route(X,Z,C3):-flight(X,Y,C),flight(Y,Z,C2),
			C3 is C + C2. 
%farkli sehirlere ugrayip devam eden rotalar.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%		

%PART2
%En kisa mesafeyle en ucuz rotonin bulundugu kisimdir.

shortestroute(City1,City2,Route) :-flight(City1,City2,Route), 
						   !.	
shortestroute(City1,City2,Route) :- flight(City1, X, Route1),
						    flight(X,City2, Route2),
						    Route is Route1 + Route2.
croute(City1,City2,Route) :- shortestroute(City1,City2,Route).
	

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%					   
%PART3
%3.0 Farkli saatlerde, en az 5 katilimcinin bulundugu var olan roomlarin kullanildigi 3 oturum daha olusturuldu.

%hangi oturumun hangi saatte oldugu durumlarin tanimlanmasi.
when(a,10).
when(b,12).
when(c,11).
when(d,16).
when(e,17).
when(f,19).
when(g,21).
when(h,22).

%hangi oturumun hangi sinifta oldugu durumlarin tanimlanmasi.
where(a,101).
where(b,104).
where(c,102).
where(d,103).
where(e,103).
where(f,101).
where(g,104).
where(h,102).

%hangi katilimcinin hangi oturuma katildigi durumlarin tanimlanmasi.
enroll(1,a).
enroll(1,b).
enroll(2,a).
enroll(3,b).
enroll(4,c).
enroll(5,d).
enroll(6,d).
enroll(6,a).
enroll(5,f).
enroll(6,g).
enroll(8,h).


%3.1
%Bu bolumde belirtilen katilimcinin nerede hangi zamanda  bulundugu durumlari            belirlenir.

schedule(S,P,T):-
	enroll(S,X),where(X,P),when(X,T).

%3.2
%Bu bolumde verilen salonda hangi zamanlarda oturum oldugu durumlar bulunur.

usage(P,T):-
	where(C,P),when(C,T).

%3.3
%Bu bolumde ayni salonda ayni saatte yada ayni yerde oturum olup olmama durumu kontrol %edilir.Cakisma varsa true doner.

conflict(X,Y):-
	when(X,T),when(Y,T);
	where(X,P),where(Y,P).

%3.4
%Bu bolumde iki katilimcinin ayni zamanlarda ayni yerde olma durumlari kontrol edilir.

meet(X,Y):-enroll(X,C),enroll(Y,C),when(C,T),
	 enroll(X,C),enroll(Y,C),where(C,P).

%PART4

%4.1 iki listenin birlesim kumesi

union([], L, L).
union([Head|L1],L2,U) :- member(Head,L2),
       			    union(L1,L2,U),
					!.
union([Head|L1],L2,[Head|U]) :- union(L1,L2,U).

%4.2 iki listenin kesisim kumesi
intersect([],_,[]).
intersect([Head|L1],L2,[Head|I]) :- member(Head,L2),
						   intersect(L1,L2,I),
						   !.
intersect([_|L1],L2,I) :- intersect(L1,L2,I).


%4.3 flatten function
%L1 deki elemanlari listesiz sekliyle yazar.

flatten(L1,L2):- flatten(L1,L2,[]).
flatten([], Result, Result):- !.
flatten([Head|T], Result, Cont):- !,
       				  flatten(Head, Result, Cont1),
        				  flatten(T, Cont1, Cont).
				 	  flatten(Term, [Term|Cont], Cont).
			 





