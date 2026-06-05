-- 03_insert_invalid.sql
-- Inserción de tuplas que incumplen restricciones (con restricciones desactivadas)

-- Departamento con posible duplicación de clave
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (10, 'Departamento Duplicado', NULL, NULL);

-- Empleado con department_id inexistente
INSERT INTO employees (
    employee_id, first_name, last_name, email, phone_number,
    hire_date, job_id, salary, commission_pct, manager_id, department_id
) VALUES (
    999, 'Juan', 'Prueba', 'JPRUEBA', '555.123.456',
    SYSDATE, 'IT_PROG', 5000, NULL, NULL, 9999
);

COMMIT;

-- Comprobación de las filas insertadas
SELECT * 
FROM   departments 
WHERE  department_name = 'Departamento Duplicado';

SELECT employee_id, first_name, last_name, department_id
FROM   employees
WHERE  employee_id = 999;