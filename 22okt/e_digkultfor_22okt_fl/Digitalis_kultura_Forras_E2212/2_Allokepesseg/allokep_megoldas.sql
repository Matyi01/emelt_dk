select letszam 
from megye 
where nev = "Vas";
--2vas

select sum(aerob.letszam) 
from aerob, megye 
where aerob.mkod = megye.kod and megye.nev = "Somogy";
--3somogy

select aerob.letszam 
from aerob, megye, allapot
where aerob.mkod = megye.kod and aerob.allkod = allapot.kod
and megye.nev = "Zala" and aerob.nem = 1 and allapot.nev = "egészséges";
--4zala

select count(kod) 
from megye 
where letszam < (select letszam from megye where nev = "Heves");
--5heves

select sum(aerob.letszam) / megye.letszam 
from aerob, megye
where aerob.mkod = megye.kod and megye.nev = "Pest";
--6pest

select megye.nev, aerob.letszam 
from megye, aerob, allapot
where megye.kod = aerob.mkod and allapot.kod = aerob.allkod
and allapot.nev ="egészséges" and aerob.nem = 0
order by aerob.letszam desc;
--7egesz

select megye.nev, sum(aerob.letszam) / megye.letszam as arany 
from megye, aerob
where megye.kod = aerob.mkod
group by aerob.mkod
order by arany desc 
limit 1;
--8arany

select megye.nev as Megyenév, sum(aerob.letszam) / megye.letszam as Arány
from megye, aerob, allapot
where megye.kod = aerob.mkod and aerob.allkod = allapot.kod
and aerob.allkod > 1
group by aerob.mkod
having Arány > 0.25;

--9negyed