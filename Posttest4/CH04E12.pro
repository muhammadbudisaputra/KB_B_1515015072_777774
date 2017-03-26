 Project:  
 FileName: CH04E12.PRO
 Purpose: 
 Written by: PDC
 Modifyed by: Eugene Akimov
 Comments: 
******************************************************************************/

trace
domains
  name,sex,occupation,object,vice,substance = symbol /*mendeklarasikan semua tipe data menjadi symbol*/
  age=integer /*mendeklarasikan tipe data menjafi integer*/

predicates /*predikat merupakan nama simbolik untuk suatu relasi*/
  person(name,age,sex,occupation) - nondeterm (o,o,o,o), nondeterm (i,o,o,i), nondeterm (i,o,i,o) /*relasi person memiliki tipe data age(integer),name,sex,occupation(symbol)*/
  had_affair(name,name) - nondeterm (i,i), nondeterm (i,o)		/*relasi had_affair memiliki memiliki tipe data name(symbol)*/
  killed_with(name,object) - determ (i,o)				/*relasi killed_with memiliki memiliki tipe data name dan object(symbol)*/
  killed(name) - procedure (o)						/*relasi killed memiliki memiliki tipe data name(symbol)*/
  killer(name) - nondeterm (o)						/*relasi killer memiliki memiliki tipe data name(symbol)*/
  motive(vice) - nondeterm (i)						/*relasi motive memiliki memiliki tipe data vice(symbol)*/
  smeared_in(name,substance) - nondeterm (i,o), nondeterm (i,i)		/*relasi smeared_in memiliki memiliki tipe data name and subtance(symbol)*/
  owns(name,object) - nondeterm (i,i)					/*relasi owns memiliki memiliki tipe data name dan object(symbol)*/
  operates_identically(object,object) - nondeterm (o,i)			/*relasi operates_identically memiliki memiliki tipe data object dan object(symbol)*/
  owns_probably(name,object) - nondeterm (i,i)				/*relasi owns_probably memiliki memiliki tipe data name dan object(symbol)*/
  suspect(name) - nondeterm (i)						/*relasi suspect memiliki memiliki tipe data name(symbol)*/

/* * * Facts about the murder * * */ 
/*fakta tentang kasus pembunuhan ini*/
clauses /*clausa berisikan suatu fakta dan aturan yang membentuk keseluruhan program*/
  person(bert,55,m,carpenter). 		/*bert berumur 55 tahun, jenis kelamin laki-laki dan berkerja sebagai carpenter*/
  person(allan,25,m,football_player).	/*allan berumur 25 tahun, jenis kelamin laki-laki dan berkerja sebagai football_player*/
  person(allan,25,m,butcher).		/*allan berumur 25 tahun, jenis kelamin laki-laki dan berkerja sebagai butcher*/
  person(john,25,m,pickpocket).		/*john berumur 25 tahun, jenis kelamin laki-laki dan berkerja sebagai pencopet*/

  had_affair(barbara,john).		/*barbara selingkuh dengan john*/
  had_affair(barbara,bert).		/*barbara selingkuh dengan bert*/
  had_affair(susan,john).		/*susan selingkuh dengan john*/

  killed_with(susan,club).		/*korban susan terbunuh dengan pentungan*/
  killed(susan).			/*korban adalah susan*/
  /*terdapat 3 motif pembunuhan*/
  motive(money).			/*karena uang*/ 
  motive(jealousy).			/*cemburu*/
  motive(righteousness).		/*dendam*/

/*di tempat kejadian ada beberapa orang yang berlumuran :*/
  smeared_in(bert,blood). 		/*bert berlumuran darah*/
  smeared_in(susan,blood).		/*susan berlumuran darah*/
  smeared_in(allan,mud).		/*allan berlumuran lumpur*/
  smeared_in(john,chocolate).		/*john berlumuran coklat*/
  smeared_in(barbara,chocolate).	/*barbara berlumuran coklat*/

  owns(bert,wooden_leg).		/*bert mempunyai kaki kayu*/
  owns(john,pistol).			/*john mempunyai pistol*/

/* * * Background knowledge * * *//*barang bukti */

  operates_identically(wooden_leg, club).		/*kaki kayu cara kerja mirip pentungan*/
  operates_identically(bar, club).			/*balok cara kerja mirip pentungan*/
  operates_identically(pair_of_scissors, knife).	/*gunting cara kerja mirip pisau*/
  operates_identically(football_boot, club).		/*sepatu bola cara kerja mirip pentungan*/
/*merupakan kemungkinan-kemungkinan mengenai barang bukti yang ditemukan*/
  owns_probably(X,football_boot):-			/*"X" kemungkinan memiliki sepatu bola*/
  person(X,_,_,football_player).			/*"X" orang yang memiliki profesi sebagai pemain bola*/
  owns_probably(X,pair_of_scissors):-			/*"X" kemungkinan memiliki sepatu gunting*/
  person(X,_,_,hairdresser).				/*"X" orang yang memiliki profesi sebagai pekerja salon*/
  owns_probably(X,Object):-				/*"X" kemungkinan memiliki benda*/
	owns(X,Object).					/*"X" memiliki benda*/

/* * * * * * * * * * * * * * * * * * * * * * *
 * Suspect all those who own a weapon with   *
 * which Susan could have been killed.       *
 * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-					/*dicurigai adalah "X"*/
	killed_with(susan,Weapon) ,		/*susan dibunuh dengan menggunakan senjata*/
	operates_identically(Object,Weapon) ,	/*benda yang digunakan memiliki cara kerja mirip senjata*/
	owns_probably(X,Object).		/*"X" kemungkinan memiliki benda*/

/* * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect men who have had an affair with Susan.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-				/*dicurigai adalah "X"*/
	motive(jealousy),		/*"X" memiliki motif cemburu*/
	person(X,_,m,_),		/*"X" merupakan laki-laki*/
	had_affair(susan,X).		/*susan selingkuh dengan "X"*/

/* * * * * * * * * * * * * * * * * * * * *
 * Suspect females who have had an       *
 * affair with someone that Susan knew.  *
 * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-				/*dicurigai adalah "X"*/
	motive(jealousy),		/*memiliki motif cemburu*/
	person(X,_,f,_),		/*"X" merupakan seorang perempuan*/
	had_affair(X,Man),		/*"X" selingkuh dengan Laki-laki*/
	had_affair(susan,Man).		/*Susan selingku dengan laki-laki*/

/* * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Suspect pickpockets whose motive could be money.  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * */

  suspect(X):-				/*dicurigai adalah "X"*/
	motive(money),			/*memiliki motif Uang*/
	person(X,_,_,pickpocket).	/*dicurigai "X" seorang pencopet*/

  killer(Killer):- 			/*dari fakta pembunuh ini terdapat pernyataan syarat dan prolog akan melakukan unifikasi terhadap pernyataan syarat-syarat tersebut*/
	person(Killer,_,_,_),		/*tersangka merupakan seseorang*/
	killed(Killed),			/*sedangkan korban adalah susan*/
	Killed <> Killer,		/* It is not a suicide *//*Korban bukan bunuh diri*/
	suspect(Killer),		/*Tersangkanya adalah Killer*/
	smeared_in(Killer,Goo),		/*Tersangka berlumuran sesuatu dan korban pun berlumuran sesuatu yang sama dengan tersangka*/
	smeared_in(Killed,Goo).

goal /*GOAL merupakan pertanyaan yang ditanyakan kepada hasil yang diingikan.*/
  killer(X)./* Goalnya adalah pembunuhnya si "X"
  	Bert terpilih sebagai tersangka karena fakta pertama pembunuh merupakan seseorang.
  Pernyataan syarat pertama adalah siti dibunuh dengan senjata
  Prolog akan memanggil fakta terbunuh_dengan untuk mengetahui senjata yang dipakai
  Fakta yang didapat adalah siti terbunuh dengan pentungan 
  Kemudian prolog akan mencari fakta dari benda yang kerjanya mirip senjata
  Lalu prolog akan memanggil fakta cara kerja mirip untuk mengetahui benda apa yang cara kerjanya mirip pentungan
  Fakta yang didapat adalah kaki kayu yang cara kerja mirip pentungan
  Selanjutnya sesuai benda yang di temukan prolog akan mencari siapa yang memiliki benda tersebut dari pernyataan dan fakta yang ada dicari bahwa siapa pemilik kaki kayu ternyata adalah bert
  Lalu prolog akan memanggil fakta berlumuran untuk melihat apa yang menodai bert, dan didapat fakta bahwa bert berlumuran darah 
  Stelah itu prolog akan memeriksa fakta terakir yaitu Berlumuran(Terbunuh, Zat) dan didapat fakta bahwa berlumuran(Susan, Darah)
  Dari fakta ini ditemukan bahwa susan mempunyai noda yang sama dengan bert
  Brdasarkan kecocokan dari fakta-fakta diatas dari awal hingga akhir, prolog menetapkan bahwa pembunuh Susan adalah bert.