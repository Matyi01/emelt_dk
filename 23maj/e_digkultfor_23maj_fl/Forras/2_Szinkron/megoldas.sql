

--2heltai
select film.cim, film.eredeti from film where magyarszoveg = "Heltai Olga";

--3szinkrend
select distinct film.rendezo, film.szinkronrendezo from film where ev > 2000;

--4szoveg
select film.magyarszoveg, film.cim from film where studio = "Mafilm Audio Kft."
order by film.magyarszoveg;

--5anger
select film.cim, film.eredeti, szinkron.szinesz, szinkron.szerep from film, szinkron
where film.filmaz = szinkron.filmaz and szinkron.hang = "Anger Zsolt";

--6mennyi
select film.eredeti, film.cim, count(szinkron.filmaz) as "db" from film, szinkron
where film.filmaz = szinkron.filmaz group by film.eredeti;

--7rab
select szinkron.szerep, szinkron.szinesz, szinkron.hang from szinkron
where szinkron.szerep like "% rab%";

--8rendszin
select distinct szinkron.szinesz as "Színész-rendező" from szinkron, film
where film.rendezo = szinkron.szinesz;

--9pap
select szinkron.hang, film.cim from szinkron, film
where film.filmaz = szinkron.filmaz and szinkron.hang != "Pap Kati"
and film.filmaz in (select film.filmaz from film, szinkron
where film.filmaz = szinkron.filmaz and szinkron.hang = "Pap Kati")
order by film.cim, szinkron.hang;

--10harom
select szinkron.szinesz, szinkron.hang, count(film.filmaz) as "db" from szinkron, film
where film.filmaz = szinkron.filmaz group by szinkron.szinesz, szinkron.hang
having count(film.filmaz) > 2
order by count(film.filmaz) desc;

--11egyev
select distinct film.ev, szinkron.hang from szinkron, film
where film.filmaz = szinkron.filmaz and film.studio = "Mafilm Audio Kft."
and film.ev in (select film.ev from film, szinkron
where film.filmaz = szinkron.filmaz and film.studio != "Mafilm Audio Kft.");
