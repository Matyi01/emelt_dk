SELECT nevado, ag, SUM(pontszam)
FROM feladatsor, feladat
WHERE feladatsor.id=feladatsorid
GROUP BY feladatsorid
HAVING SUM(pontszam)<>150;
