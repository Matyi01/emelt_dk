select * from diakok where telepules = "Barnamalom";

select datum, terem, orasorszam from orak where targy = "angol" order by datum, orasorszam;

select csoport, targy, datum from orak where csoport like "9%" and (targy = "matematika" or targy = "fizika") order by targy;

select telepules, count(*) as diakok_szama from diakok group by telepules order by diakok_szama desc;

select distinct targy from orak order by targy;

select nev, email, telefon from orak, diakok, kapcsolo where orak.id = kapcsolo.oraid and diakok.id = kapcsolo.diakid
and orak.tanar = "Angol Anna" and orak.datum = "2028-11-10";

select nev from diakok where telepules = (select telepules from diakok where nev = "Majer Melinda") and nev != "Majer Melinda";

select orak.datum, orak.orasorszam, orak.targy, orak.tanar, (orak.ferohely - count(kapcsolo.oraid)) as szabad
from orak,kapcsolo where orak.id = kapcsolo.oraid 
group by orak.id
having szabad > 0
order by szabad desc;







