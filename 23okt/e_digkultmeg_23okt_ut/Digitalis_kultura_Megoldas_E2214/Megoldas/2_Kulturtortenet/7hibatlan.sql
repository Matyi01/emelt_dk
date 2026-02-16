SELECT DISTINCT nev
FROM csapat, megoldas, feladat
WHERE csapat.id=megoldas.csapatid
   AND megoldas.feladatid=feladat.id
   AND megoldas.pontszam=feladat.pontszam;
