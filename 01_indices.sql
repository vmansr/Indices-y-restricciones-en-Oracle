-- 01_indices.sql
-- Consulta de índices de las tablas EMPLOYEES y DEPARTMENTS

-- Índices definidos en EMPLOYEES y DEPARTMENTS
SELECT index_name, table_name, uniqueness, status
FROM   user_indexes
WHERE  table_name IN ('EMPLOYEES', 'DEPARTMENTS')
ORDER BY table_name, index_name;

-- Columnas que componen cada índice
SELECT index_name, table_name, column_name, column_position
FROM   user_ind_columns
WHERE  table_name IN ('EMPLOYEES', 'DEPARTMENTS')
ORDER BY table_name, index_name, column_position;