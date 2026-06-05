-- 05_departments2.sql
-- Creación de DEPARTMENTS2 e inserción de filas de prueba

-- Crear DEPARTMENTS2 como copia de DEPARTMENTS
CREATE TABLE departments2 AS
SELECT * FROM departments;

-- Insertar tres nuevas filas en DEPARTMENTS2
INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
VALUES (280, 'Investigacion', NULL, 1700);

INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
VALUES (290, 'Innovacion', NULL, 1700);

INSERT INTO departments2 (department_id, department_name, manager_id, location_id)
VALUES (300, 'Analitica', NULL, 1700);

COMMIT;

-- Comprobación de las filas insertadas
SELECT * 
FROM   departments2
WHERE  department_id IN (280, 290, 300)
ORDER BY department_id;