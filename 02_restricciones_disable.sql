-- 02_restricciones_disable.sql
-- Consulta y desactivación de restricciones en EMPLOYEES y DEPARTMENTS

-- Listado inicial de restricciones
SELECT constraint_name, table_name, constraint_type, status
FROM   user_constraints
WHERE  table_name IN ('EMPLOYEES', 'DEPARTMENTS')
ORDER BY table_name, constraint_name;

-- Desactivar FOREIGN KEY (R) de EMPLOYEES
ALTER TABLE employees   DISABLE CONSTRAINT EMP_DEPT_FK;
ALTER TABLE employees   DISABLE CONSTRAINT EMP_JOB_FK;
ALTER TABLE employees   DISABLE CONSTRAINT EMP_MANAGER_FK;

-- Desactivar FOREIGN KEY (R) de DEPARTMENTS
ALTER TABLE departments DISABLE CONSTRAINT DEPT_LOC_FK;
ALTER TABLE departments DISABLE CONSTRAINT DEPT_MGR_FK;

-- Desactivar PRIMARY KEY (P) y UNIQUE (U)
ALTER TABLE employees   DISABLE CONSTRAINT EMP_EMP_ID_PK;
ALTER TABLE departments DISABLE CONSTRAINT DEPT_ID_PK;
ALTER TABLE employees   DISABLE CONSTRAINT EMP_EMAIL_UK;

-- Desactivar restricciones de tipo C (NOT NULL / CHECK) si se desea
ALTER TABLE departments DISABLE CONSTRAINT DEPT_NAME_NN;

ALTER TABLE employees   DISABLE CONSTRAINT EMP_EMAIL_NN;
ALTER TABLE employees   DISABLE CONSTRAINT EMP_HIRE_DATE_NN;
ALTER TABLE employees   DISABLE CONSTRAINT EMP_JOB_NN;
ALTER TABLE employees   DISABLE CONSTRAINT EMP_LAST_NAME_NN;
ALTER TABLE employees   DISABLE CONSTRAINT EMP_SALARY_MIN;

-- Comprobación del estado tras desactivar
SELECT constraint_name, table_name, constraint_type, status
FROM   user_constraints
WHERE  table_name IN ('EMPLOYEES', 'DEPARTMENTS')
ORDER BY table_name, constraint_name;