--Lekérdezés  segítségével  írassa  ki  a  „Barnamalom”  nevű  településről  érkezők  nevét! 
--(2barnamalom)
select * from diakok where telepules = "Barnamalom";

--Készítsen lekérdezést, amely meghatározza, hogy mikor lehet „angol” nyelvórát látogatni! 
--A  lekérdezés  jelenítse  meg  a  dátumot,  a  terem  nevét,  valamint  az  óra  sorszámát! 
--Az eredmény a dátum és azon belül az óra sorszáma szerint növekvő sorrendbe legyen rendezve!
--(3angol)
select datum, terem, orasorszam from orak where targy = "angol" order by datum, orasorszam;

--A 9. évfolyamon látogatható „matematika” és „fizika” tanórákat lekérdezés segítségével írassa ki!
--A csoport neve, a tantárgy neve és a dátum jelenjen meg, a tantárgy neve szerinti ábécérendben!  
--Tudjuk,  hogy  minden  9.  évfolyamos  csoport  nevének  a  kezdete  „9”. 
--(4matfiz)
select csoport, targy, datum from orak where csoport like "9%" and (targy = "matematika" or targy = "fizika") order by targy;

--Lekérdezés segítségével határozza meg, hogy melyik településről hány diák érkezik a nyílt napokra!
--Az  eredmény  a  diákok  száma  szerint  csökkenő  sorrendbe  legyen  rendezve! 
--(5telepulesfo)
select telepules, count(*) as diakok_szama from diakok group by telepules order by diakok_szama desc;

--Készítsen lekérdezést, amely ábécérendben felsorolja, hogy milyen tantárgyak óráit lehet látogatni! 
--Minden tantárgy neve csak egyszer jelenjen meg!
--(6tantargyak)
select distinct targy from orak order by targy;

--Lekérdezés  segítségével  listázza  ki  az  „Angol  Anna”  tanárnő  „2028.  11.  10.”  napján 
--tartandó órájára regisztrált diákok nevét, e-mail-címét és telefonszámát! 
--(7angolanna)
select nev, email, telefon from orak, diakok, kapcsolo where orak.id = kapcsolo.oraid and diakok.id = kapcsolo.diakid
and orak.tanar = "Angol Anna" and orak.datum = "2028-11-10";

--Lekérdezés segítségével listázza ki azoknak a diákoknak a nevét, akik a „Majer Melinda”
--nevű  diákkal  azonos  településről  regisztráltak!  Majer  Melinda  neve  ne  jelenjen  meg a listában! 
--(8majer) 
select nev from diakok where telepules = (select telepules from diakok where nev = "Majer Melinda") and nev != "Majer Melinda";

--A szabad helyek áttekintéséhez készítse el a minta szerinti lekérdezést!
--Az oszlopok a minta szerinti sorrendben jelenjenek meg!
--A szabad hellyel nem rendelkező órák ne jelenjenek meg a listában!
--A számított oszlop felett a „szabad” felirat jelenjen meg!
--A sorok a szabad helyek száma szerint csökkenő sorrendben jelenjenek meg!
--(9szabad)
select orak.datum, orak.orasorszam, orak.targy, orak.tanar, (orak.ferohely - count(kapcsolo.oraid)) as szabad
from orak,kapcsolo where orak.id = kapcsolo.oraid 
group by orak.id
having szabad > 0
order by szabad desc;







