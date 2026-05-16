select ev, versenyszam.nev 
from jatekos, bajnok, versenyszam
where jatekos.id = bajnok.jatekos_id
and versenyszam.id = bajnok.vsz_id
and jatekos.nev = "Harczi Zsolt";

select min(ev) 
from bajnok, versenyszam
where versenyszam.id = bajnok.vsz_id
and versenyszam.nev = "vegyes páros";

select count(id), if(neme = 0, "női", "férfi")
from jatekos
group by neme;

select distinct egyesulet.orszag
from egyesulet, bajnok
where egyesulet.id = bajnok.egyesulet_id
and ev > 2000
and orszag != "Magyarország";

select distinct jatekos.nev
from jatekos, bajnok, egyesulet
where jatekos.id = bajnok.jatekos_id
and egyesulet.id = bajnok.egyesulet_id
and egyesulet.nev = "MTK"
order by neme, jatekos.nev;

select jatekos.nev, bajnok.ev, versenyszam.nev
from jatekos, bajnok, versenyszam
where jatekos.id = bajnok.jatekos_id
and versenyszam.id = bajnok.vsz_id;

select jatekos.nev, max(b2.ev) - min(b1.ev)
from bajnok as b1, bajnok as b2, jatekos
where jatekos.id = b1.jatekos_id
and jatekos.id = b2.jatekos_id
and b1.jatekos_id = b2.jatekos_id
group by jatekos.nev
having max(b2.ev) - min(b1.ev) > 9;

select distinct j2.nev
from jatekos as j1, jatekos as j2, bajnok as b1, bajnok as b2, versenyszam
where j1.id = b1.jatekos_id
and versenyszam.id = b1.vsz_id
and j2.id = b2.jatekos_id
and versenyszam.id = b2.vsz_id
and j1.nev = "Pergel Szandra"
and j2.nev != "Pergel Szandra"
and b1.ev = b2.ev
and versenyszam.nev = "vegyes páros";






