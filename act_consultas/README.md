# Reto 1: Consultas básicas

Maicol Barragán.

En este reto trabajamos con la base de datos `sanitat`, que nos viene dada en el fichero `sanitat.sql`. A continuación realizamos una serie de consultas para extraer la información pedida en cada uno de los enunciados.

El código fuente correspondiente a este reto puede consultarse en: [LINK GITLAB](https://gitlab.com/solblaze03/base-de-datos/-/tree/main/act_consultas?ref_type=heads)

## Query 1
Para seleccionar el número, nombre y teléfono de todos los hospitales existentes, seleccionaremos estos tres atributos, que se corresponden con las columnas `HOSPITAL_COD`, `NOM`, y `TELEFON`, respectivamente, de la tabla `HOSPITAL`. Lo llevaremos a cabo con la siguiente sentencia SQL:

```sql
SELECT HOSPITAL_COD,NOM,TELEFON FROM HOSPITAL; 
```


## Query 2
Seleccionamos los atributos codigo del hospital, nombre y telefono de la tabla `HOSPITAL`, el `WHERE` consultara los nombres donde su segundo caracter es A. 

```sql
SELECT HOSPITAL_COD,NOM,TELEFON FROM HOSPITAL WHERE NOM LIKE "_a%";  
```
# Query 3

En esta consulta podremos ver todos los trabajadores existentes, seleccionamos los atributos `HOSPITAL_COD`, `SALA_COD` Y `TELEFON` de la tabla `PLANTILLA`.
```sql 
SELECT HOSPITAL_COD, SALA_COD,EMPLEAT_NO,COGNOM FROM PLANTILLA;
```
# Query 4

En esta consulta seleccionamos las mismos atributos del Query3 pero agregando el atributo `TORN` de la tabla `PLANTILLA`, consultara todos los trabajadores que no tengan el turno noche. 

```sql
SELECT HOSPITAL_COD, SALA_COD,EMPLEAT_NO,COGNOM,TORN FROM PLANTILLA WHERE UPPER(TORN) <> "N";
```

# Query 5

En esta consulta los enfermos que nacieron en el año 1960, aqui con el caracter `*` seleccionaremos todos los atributos de la tabla `MALALT` y seleccionaremos solo los que nacieron en el año 1960.
```sql
SELECT * FROM MALALT where year(DATA_NAIX)like 1960;
```

# Query 6
Haremos la misma consulta del Query5 pero  aqui buscaremos los que nacieron a partir del año 1960
```sql
SELECT * FROM MALALT WHERE YEAR(DATA_NAIX) >= 1960;
```