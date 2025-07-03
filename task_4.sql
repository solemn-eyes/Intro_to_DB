SELECT
    COLUMN_NAME AS "Field",
    COLUMN_TYPE AS "Type",
    COLUMN_KEY AS "Null",
    COLUMN_DEFAULT AS "Default",
    IS_NULLABLE AS "Null",
    EXTRA AS "Extra"
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_SCHEMA = 'alx_book_store'
    AND TABLE_NAME = 'books';
    