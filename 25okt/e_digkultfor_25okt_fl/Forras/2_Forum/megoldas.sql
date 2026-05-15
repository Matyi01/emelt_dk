select megnevezes, veznev, utonev
from hirfolyam, felhasznalo
where hirfolyam.moderator = felhasznalo.id;

select tartalom
from uzenet
where tartalom LIKE "%bike%" or tartalom LIKE "%bicikli%";

SELECT DISTINCT f1.veznev, f1.utonev
FROM felhasznalo f1
JOIN felhasznalo f2
on f1.veznev = f2.veznev
and f1.utonev = f2.utonev
and f1.id != f2.id
order by f1.veznmev, f1,utonev;

select megnevezes, count(uzenet.id)
from hirfolyam, uzenet
where hirfolyam.id = uzenet.h_id
group by megnevezes
order by count(uzenet.id) desc;

select veznev, utonev, tartalom, kuldido
from uzenet, hirfolyam, felhasznalo
where felhasznalo.id = uzenet.f_id
and uzenet.tartalom like concat("%", hirfolyam.megnevezes, "%");

select count(DISTINCT f_id)
from uzenet;

select veznev, utonev
from felhasznalo
where utolso < "2010-01-01"
and id not in (select f_id from uzenet);

select veznev, utonev, count(uzenet.id)
from uzenet, hirfolyam, felhasznalo
where hirfolyam.id = uzenet.h_id
and felhasznalo.id = uzenet.f_id
and megnevezes = "e-bike"
and kuldido >= "12:00:00"
and kuldido <= "16:00:00"
group by f_id;

select kuldido
from uzenet
where f_id = (select f_id from uzenet order by kuldido limit 1)
order by kuldido desc
limit 1;


