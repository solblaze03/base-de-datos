# Reto 2: consultas

Maicol Barragán

En este reto trabajaremos con la base de datos de `EMPRESA` y `VIDEOCLUB` y realizaremos cada unas de las consultas pedidas.

El código fuente correspondiente a este reto puede consultarse: [link gitlab](https://gitlab.com/solblaze03/base-de-datos/-/tree/main/consultas2?ref_type=heads)


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
Consultaremos lo mismo del query 3, pero consultaremos los que el área sea distinto a 636.
```sql
SELECT CLIENT_COD,NOM,AREA,TELEFON FROM CLIENT WHERE AREA <> 636;
```
## Query 5
Seleccionaremos los atributos `COM_NUM`, `DATA_TRAMESA` de la tabla `COMANDA`
```sql
SELECT COM_NUM, DATA_TRAMESA FROM COMANDA;
```

## Query 6
Aquí nos iremos a base de datos `videoclub` con `use videoclub`
```sql
SELECT NOM,TELEFON FROM CLIENT;
```
## Query 7
Listaremos la fecha y importe de la tabla `FACTURA`
```sql
SELECT import,data FROM FACTURA;
```

## Query 8
Listaremos la descripción de la tabla `DETALLFACTURA` donde el atributo `CodiFactura` sea igual a 3.
```sql
SELECT DESCRIPCIO FROM DETALLFACTURA WHERE CodiFactura = 3;
```

# Query 9
Listaremos todos los datos de la tabla `factura` pero ordenado el importe de forma descendente
```sql
SELECT * FROM FACTURA ORDER BY IMPORT DESC ;
```
# Query 10
Listaremos todos los datos de la tabla `FACTURA` donde su nombre inicie con la letra x.
```sql
SELECT * FROM ACTOR WHERE NOM LIKE "X%"
```

# Query 11
Aquí insertaremos dos registros siendo el primer valor el código de actor y el segundo el nombre.
```sql
INSERT INTO ACTOR VALUES(7,"XAMO"),(8,"ximena");
```
# Query 12
Aquí eliminaremos de la tabla `ACTOR` donde el `codiActor`  este en la lista, en este caso 7 o 8.
```sql
DELETE FROM ACTOR WHERE CodiActor in (7,8);
```

# Query 13
Aquí eliminamos el registro de la tabla `ACTOR` donde el `codiactor` sea igual a 7 o 8.  
```sql
DELETE FROM ACTOR WHERE CodiActor = 7 or CodiActor = 8;
```

<!--  El Query 14 no la alcance a escuchar   -->

# Query 15
Cambiaremos el nombre del actor por CHAMO donde el codiActor sea igual a 4.
```sql
UPDATE ACTOR SET NOM = "CHAMO" WHERE CodiActor = 4;
```

# Query 16
Cambiamos a la bases de datos de empresa y listaremos el año de la fecha de alta sin repetir los datos de la tabla `EMP`.
```sql
SELECT DISTINCT  year(DATA_ALTA) FROM EMP;
```

# Query 17
Aquí contaremos cuantos oficios sin repetir hay en la tabla `EMP`. 
```sql
SELECT count(DISTINCT OFICI) from EMP;
```

# Query 18
Seleccionamos todos los datos de la tabla comissio donde el valor no sea nulo, ordenado de forma descendente con un limite de 2 registros.
```sql
select * from  EMP where comissio is not null order by comissio desc  limit 2 ;
```
