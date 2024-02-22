# Reto 1: Consultas básicas

Cristian G Guerrero.

En este reto trabajamos con la base de datos `sanitat`, que nos viene dada en el fichero `sanitat.sql`. A continuación realizamos una serie de consultas para extraer la información pedida en cada uno de los enunciados.

El código fuente correspondiente a este reto puede consultarse en: [LINK GITHUB]()

## Query 1
Para seleccionar el número, nombre y teléfono de todos los hospitales existentes, seleccionaremos estos tres atributos, que se corresponden con las columnas `HOSPITAL_COD`, `NOM`, y `TELEFON`, respectivamente, de la tabla `HOSPITAL`. Lo llevaremos a cabo con la siguiente sentencia SQL:

```SQL
SELECT HOSPITAL_COD,NOM,TELEFON FROM HOSPITAL; 
```


## Query 2
Seleccionamos los atributos codigo del hospital, nombre y telefono de la tabla HOSPITAL, el `WHERE` consultara los nombres donde su segundo caracter es A. 

```SQL
SELECT HOSPITAL_COD,NOM,TELEFON FROM HOSPITAL WHERE NOM LIKE "_a%";  
```
