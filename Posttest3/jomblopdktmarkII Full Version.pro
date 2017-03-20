%Program ini dibuat untuk menentukan bagaimana seorang JOMBLO 
%bisa mendapatkan WANITA pujaanya namun mereka harus 
%membawa HADIAH berupa barang kesukaan wanita tersebut.
domains
orang=symbol
predicates
  nondeterm pdkt(orang,orang,orang)
  nondeterm jomblo(orang)  
  nondeterm wanita(orang)
  nondeterm ingin(orang,orang)
  nondeterm membawa(orang,orang)
  nondeterm hadiah(orang)

clauses
  pdkt(Cowok,Hadiah,Wanita):-
	jomblo(Cowok),
	wanita(Wanita),
	membawa(Cowok,Hadiah),
   	ingin(Wanita,Hadiah),
   	hadiah(Hadiah).

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
  write("Jadi yang berhasil mendapatkan Jesica adalah"),
  nl, pdkt(Cowok,Hadiah,jesica).