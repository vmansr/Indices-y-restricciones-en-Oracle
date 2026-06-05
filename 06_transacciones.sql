-- 06_transacciones.sql
-- Bloques anónimos para ilustrar COMMIT y ROLLBACK sobre DEPARTMENTS2

SET SERVEROUTPUT ON;

-- Bloque 1: transacción con COMMIT
BEGIN
    DBMS_OUTPUT.PUT_LINE('Inicio de la transaccion sobre DEPARTMENTS2');

    INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
    VALUES (310, 'Temporal', NULL, 1700);

    DBMS_OUTPUT.PUT_LINE('Insercion realizada dentro de la transaccion');

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Fin de la transaccion (COMMIT ejecutado)');
END;
/
 
-- Comprobación de la fila confirmada
SELECT * 
FROM   departments2 
WHERE  department_id = 310;

-- Bloque 2: transacción deshecha con ROLLBACK
BEGIN
    DBMS_OUTPUT.PUT_LINE('Inicio de la transaccion para ROLLBACK');

    INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
    VALUES (320, 'RollbackDept', NULL, 1700);

    DBMS_OUTPUT.PUT_LINE('Fila insertada, se va a hacer ROLLBACK');

    ROLLBACK;

    DBMS_OUTPUT.PUT_LINE('Transaccion revertida (ROLLBACK ejecutado)');
END;
/

-- Comprobación de que la fila no se ha guardado
SELECT * 
FROM   departments2 
WHERE  department_id = 320;