# Índices y restricciones en Oracle

## Descripción

Esta actividad se ha realizado sobre el esquema de ejemplo **HR** de Oracle utilizando **SQL Developer**. El objetivo es practicar la consulta de índices, la gestión de restricciones de integridad y el uso de transacciones sobre tablas del esquema `HR`, especialmente `EMPLOYEES` y `DEPARTMENTS`. [file:281]

Durante la práctica se consultaron los índices disponibles, se desactivaron restricciones, se insertaron registros que incumplían dichas restricciones mientras estaban deshabilitadas y posteriormente se reactivaron, corrigiendo antes los datos conflictivos. También se creó una tabla duplicada llamada `DEPARTMENTS2` para realizar pruebas con `COMMIT`, `ROLLBACK` y bloques anónimos PL/SQL. [file:281]

## Objetivos

- Iniciar sesión en SQL Developer con el usuario `HR`. [file:281]
- Consultar los índices de las tablas `EMPLOYEES` y `DEPARTMENTS`. [file:281]
- Desactivar restricciones del esquema HR en esas tablas. [file:281]
- Insertar tuplas que no cumplan las restricciones mientras estén desactivadas. [file:281]
- Volver a activar las restricciones y analizar los errores producidos. [file:281]
- Crear una copia de `DEPARTMENTS` llamada `DEPARTMENTS2`. [file:281]
- Insertar registros en `DEPARTMENTS2` y comprobar su persistencia tras cerrar sesión. [file:281]
- Implementar ejemplos de transacción con `COMMIT` y `ROLLBACK`. [file:281]
- Documentar de forma teórica el papel de los archivos Redo en Oracle. [file:281]

## Estructura de archivos

El trabajo se organiza en los siguientes scripts SQL:

- `01_indices.sql`: consulta de índices de `EMPLOYEES` y `DEPARTMENTS`.
- `02_restricciones_disable.sql`: consulta y desactivación de restricciones.
- `03_insert_invalid.sql`: inserción de filas que incumplen restricciones.
- `04_restricciones_enable.sql`: limpieza de datos conflictivos y reactivación de restricciones.
- `05_departments2.sql`: creación de `DEPARTMENTS2` e inserción de tres registros.
- `06_transacciones.sql`: ejemplos de bloque anónimo, `COMMIT` y `ROLLBACK`. [file:281]

## Requisitos

Para ejecutar la actividad se necesita:

- Oracle Database con el esquema de ejemplo **HR** instalado.
- Oracle SQL Developer.
- Acceso con el usuario `HR`.
- Conexión activa a la base de datos, normalmente mediante el servicio `XEPDB1` en entornos Oracle XE.

## Ejecución

1. Abrir SQL Developer.
2. Conectarse con el usuario `HR`.
3. Abrir cada script SQL en un Worksheet.
4. Ejecutar las sentencias en el orden indicado por el nombre de los archivos.
5. Revisar los resultados en la cuadrícula de salida y en `DBMS Output` cuando corresponda.

Orden recomendado de ejecución:

```sql
01_indices.sql
02_restricciones_disable.sql
03_insert_invalid.sql
04_restricciones_enable.sql
05_departments2.sql
06_transacciones.sql
```

## Incidencias observadas

Durante la reactivación de la clave foránea `EMP_DEPT_FK` puede aparecer el error `ORA-02298`, que indica que existen registros en `EMPLOYEES` con un `DEPARTMENT_ID` que no existe en la tabla `DEPARTMENTS`. Esto ocurre, por ejemplo, al insertar un empleado de prueba con `DEPARTMENT_ID = 9999` mientras la restricción está deshabilitada. [file:281]

La solución consiste en localizar esas filas huérfanas, eliminarlas o corregirlas y, después, volver a ejecutar `ALTER TABLE employees ENABLE CONSTRAINT EMP_DEPT_FK;`. Una vez corregidos los datos conflictivos, la restricción puede activarse correctamente. [web:324]

## Contenido de la documentación

La memoria de la actividad incluye:

- Descripción de cada tarea realizada.
- Código SQL ejecutado.
- Resultados obtenidos en SQL Developer.
- Capturas de pantalla del proceso.
- Explicación de los errores encontrados y su resolución.
- Comentario teórico sobre las transacciones y los archivos Redo. [file:281]

## Entrega

La entrega final está compuesta por:

- Los ficheros `.sql` con todas las instrucciones ejecutadas.
- La memoria explicativa con capturas de pantalla y resultados visibles. [file:281]

## Autor

Trabajo realizado por: **Víctor Manuel Sánchez Ramírez**  
Asignatura: **Base de Datos Avanzadas**  
Fecha: **Mayo 05 de 2026**
