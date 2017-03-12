predicates %predicates adalah nama simbolik untuk relasi.
  posisi(symbol,symbol) - nondeterm (o,i), nondeterm (i,i) %nondeterm berfungsi untuk memberitahu ke compiler Visual Prolog bahwa predikat tersebut mempunyai lebih dari satu kemungkinan jawaban

clauses %clauses digunakan untuk mendefinisikan predikat.
  posisi(keylornavas,kiper). %penggunaan (.) sebagai DAN.
  posisi(pepe,belakang).
  posisi(ramos,belakang).
  posisi(ronaldo,penyerang).
  posisi(modric,gelandang).
  posisi(morata,penyerang).
  posisi(isco,gelandang).
  %saya memakai fakta yang contohnya adalah "pepe berposisi sebagai belakang".

goal %goal adalah tempat pernyataan (query) diberikan atau meminta prolog untuk mencapai tujuan yang dikehendaki.
  posisi(Pemain1,penyerang), %saya memakai (,) koma sebagai ATAU.
  posisi(Pemain2,kiper).
  %goal yang saya tuju adalah memilih penyerang dan kiper.