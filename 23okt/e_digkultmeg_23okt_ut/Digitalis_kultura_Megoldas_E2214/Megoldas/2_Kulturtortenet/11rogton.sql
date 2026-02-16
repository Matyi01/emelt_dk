SELECT kovetkezo.nevado, kovetkezo.kituzes
FROM feladatsor AS kovetkezo, feladatsor AS elozo
WHERE DATEDIFF(kovetkezo.kituzes, elozo.hatarido)=1;
