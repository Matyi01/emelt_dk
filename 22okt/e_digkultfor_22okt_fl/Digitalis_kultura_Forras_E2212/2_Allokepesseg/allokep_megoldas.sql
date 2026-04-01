select letszam from megye where nev = "Vas";
--2vas

select sum(aerob.letszam) from aerob, megye 
where aerob.mkod = megye.kod and megye.nev = "Somogy";
--3somogy

select aerob.letszam from aerob, megye, allapot
where aerob.mkod = megye.kod and aerob.allkod = allapot.kod
and megye.nev = "Zala" and aerob.nem = 1 and allapot.nev = "egészséges";
--4zala

select count(kod) from megye 
where letszam < (select letszam from megye where nev = "Heves");
--5heves


--6pest


--7egesz


--8arany


--9negyed