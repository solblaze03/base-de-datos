-- Query 16 años que hemos dado en alta a trabajadores
use empresa;
-- DINSTICT NO REMPITE VALORES
SELECT DISTINCT  year(DATA_ALTA) FROM EMP;
