#Reto 2: consultas

Maicol Barragán

En este reto rabajaremos con la base de datos de `EMPRESA` y `VIDEOCLUB` y realizaremos cada unas de las consultas pedidas.

El codigo fuente correspondiente a este reto puede consultarse: []()


## Query 1
En esta consulta seleccionaremos la base de datos `EMPRESA`  y la seleccionaremos con comando `USE EMPRESA` y consultaremos el numero de producto y la descripción de la tabla `PRODUCTE`

```sql
select PROD_NUM,DESCRIPCIO from PRODUCTE;
```
## Query 2
Haremos la misma consulta del anterior pero solo consultaremos los que en la descripcion contengan la palabra `TENNIS`.
```sql
select PROD_NUM,DESCRIPCIO from PRODUCTE WHERE UPPER(DESCRIPCIO) LIKE "%TENNIS%";
``` 

## Query 3
En esta consulta seleccionaremos los atributos `CLIENT_COD`, `NOM,AREA` y `TELEFON` de la tabla `cliente`

```sql
SELECT CLIENT_COD,NOM,AREA,TELEFON FROM CLIENT;
```

## Query 4
Consultaremos lo mismo del query 3, pero consultaremos los que el area sea distinto a 636.
```sql
SELECT CLIENT_COD,NOM,AREA,TELEFON FROM CLIENT WHERE AREA <> 636; 
```
## Query 5
Seleccionaremos los atributos `COM_NUM`, `DATA_TRAMESA` de la tabla `COMANDA`
```sql
SELECT COM_NUM, DATA_TRAMESA FROM COMANDA;
```

## Query 6
Aqui nos iremos a base de datos `videoclub` con `use videoclub`
```sql
SELECT NOM,TELEFON FROM CLIENT;
```
## Query 7
Listaremos la fecha y importe de la tabla `FACTURA`
```sql
SELECT import,data FROM FACTURA;
```

## Query 8
Listaremos la 
```sql
SELECT DESCRIPCIO FROM DETALLFACTURA WHERE CodiFactura = 3;
```
