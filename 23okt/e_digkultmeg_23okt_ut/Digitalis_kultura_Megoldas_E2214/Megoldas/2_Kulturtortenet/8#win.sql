SELECT nevado, COUNT(*)
FROM feladatsor, feladat
WHERE feladatsor.id=feladatsorid
   AND feladat.id NOT IN
(
   SELECT feladatid
   FROM megoldas, csapat
   WHERE csapat.id=csapatid
   AND nev="#win"
)
GROUP BY nevado;
