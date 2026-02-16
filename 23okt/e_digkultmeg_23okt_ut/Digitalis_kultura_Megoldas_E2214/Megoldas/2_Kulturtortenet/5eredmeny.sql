SELECT nev, SUM(pontszam)
FROM csapat, megoldas
WHERE csapat.id=csapatid
GROUP BY csapatid
ORDER BY 2 DESC;
