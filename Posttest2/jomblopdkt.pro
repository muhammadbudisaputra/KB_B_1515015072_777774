%Program ini dibuat untuk menentukan bagaimana seorang JOMBLO 
%bisa mendapatkan WANITA pujaanya namun mereka harus 
%membawa HADIAH berupa barang kesukaan wanita tersebut.
predicates
  nondeterm
  pdkt(symbol,symbol,symbol)
  jomblo(symbol)- nondeterm (o)  
  wanita(symbol)
  ingin(symbol,symbol)
  membawa(symbol,symbol) - nondeterm (i,o)
  hadiah(symbol)- nondeterm (i) 

clauses
  pdkt(X,Y,Z):-
	jomblo(X),
	wanita(Z),
	membawa(X,Y),
   	ingin(Z,Y),
   	hadiah(Y).

  jomblo(budi).
  jomblo(yogo).
  jomblo(kiwa). 
  jomblo(katon).
  
  wanita(jesica).    
  wanita(anis).
  
  membawa(budi, mobil).
  membawa(yogo, coklat).
  membawa(kiwa, mobil).
  membawa(katon, bunga).
  membawa(kiwa, coklat).
  
  ingin(jesica,mobil).
  ingin(anis,bunga).
  ingin(anis,coklat).

  hadiah(mobil).
  hadiah(coklat).
  hadiah(bunga).
  
goal
  pdkt(X,Y,jesica).%Jadi goalnya adalah "X" harus membawa "Y" jika ingin pdkt dengan "jesica".