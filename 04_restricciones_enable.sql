-- 04_restricciones_enable.sql
-- Reactivación de restricciones y corrección de filas que las incumplen

-- 1) Localizar empleados cuyo department_id no existe en DEPARTMENTS
SELECT e.employee_id,
       e.first_name,
       e.last_name,
       e.department_id
FROM   employees e
WHERE  e.department_id IS NOT NULL
AND    NOT EXISTS (
  SELECT 1
  FROM   departments d
  WHERE  d.department_id = e.department_id
);

-- 2) Eliminar las filas conflictivas (por ejemplo, employee_id = 999)
DELETE FROM employees
WHERE  employee_id = 999;

-- Si hubiera más filas conflictivas, se podrían borrar con este patrón:
-- DELETE FROM employees e
-- WHERE  e.department_id IS NOT NULL
-- AND    NOT EXISTS (
--   SELECT 1
--   FROM   departments d
--   WHERE  d.department_id = e.department_id
-- );

-- Eliminar también el departamento duplicado si se creó
DELETE FROM departments
WHERE  department_name = 'Departamento Duplicado';

COMMIT;

-- 3) Reactivar restricciones en el orden adecuado

-- PK de DEPARTMENTS y EMPLOYEES
ALTER TABLE departments ENABLE CONSTRAINT DEPT_ID_PK;
ALTER TABLE employees   ENABLE CONSTRAINT EMP_EMP_ID_PK;

-- FKs de DEPARTMENTS
ALTER TABLE departments ENABLE CONSTRAINT DEPT_LOC_FK;
ALTER TABLE departments ENABLE CONSTRAINT DEPT_MGR_FK;

-- FKs de EMPLOYEES
ALTER TABLE employees   ENABLE CONSTRAINT EMP_DEPT_FK;
ALTER TABLE employees   ENABLE CONSTRAINT EMP_JOB_FK;
ALTER TABLE employees   ENABLE CONSTRAINT EMP_MANAGER_FK;

-- UNIQUE y CHECK/NN de EMPLOYEES y DEPARTMENTS
ALTER TABLE employees   ENABLE CONSTRAINT EMP_EMAIL_UK;
ALTER TABLE employees   ENABLE CONSTRAINT EMP_EMAIL_NN;
ALTER TABLE employees   ENABLE CONSTRAINT EMP_HIRE_DATE_NN;
ALTER TABLE employees   ENABLE CONSTRAINT EMP_JOB_NN;
ALTER TABLE employees   ENABLE CONSTRAINT EMP_LAST_NAME_NN;
ALTER TABLE employees   ENABLE CONSTRAINT EMP_SALARY_MIN;

ALTER TABLE departments ENABLE CONSTRAINT DEPT_NAME_NN;

-- 4) Comprobación final
SELECT constraint_name, table_name, constraint_type, status
FROM   user_constraints
WHERE  table_name IN ('EMPLOYEES', 'DEPARTMENTS')
ORDER BY table_name, constraint_name;