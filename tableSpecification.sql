/*스키마의 모든 테이블 명세서내역 */
SELECT ORDINAL_POSITION 'count_number', 
table_name'tablename',
COLUMN_NAME 'fieldname',
 DATA_TYPE 'data TYPE',
 COLUMN_TYPE 'data LENGTH',
 COLUMN_KEY 'KEY',
 IS_NULLABLE 'nullable',
 EXTRA 'AutoIncrease', 
 COLUMN_DEFAULT 'default'
 
 FROM INFORMATION_SCHEMA.COLUMNS
 WHERE TABLE_SCHEMA = 'task01_intflowtest'
 ORDER BY TABLE_NAME, ORDINAL_POSITION;
