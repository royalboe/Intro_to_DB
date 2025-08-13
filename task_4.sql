import mysql.connector

try:
    # Connect to MySQL server
    connection = mysql.connector.connect(
        host="localhost",
        port="3306",
        user="root",
        password="password123"
    )
    cursor = connection.cursor()

    # Query column details from INFORMATION_SCHEMA
    query = """
    SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_KEY, COLUMN_DEFAULT, EXTRA
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_SCHEMA = %s
      AND TABLE_NAME = 'books'
    ORDER BY ORDINAL_POSITION;
    """
    cursor.executre("USE alx_book_store;")
    cursor.execute(query)
    results = cursor.fetchall()

except mysql.connector.Error as e:
    print(f"MySQL Error: {e}")
finally:
    if 'cursor' in locals() and cursor:
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
