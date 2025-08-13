import mysql.connector

try:
    connection = mysql.connector.connect(
        host="localhost",
        port="3306",
        user="root",
        password="password123",
        database="alx_book_store"
    )

    if connection.is_connected():
        cursor = connection.cursor()
        # List tables in DATABASE
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()
        print("Tables in the database:", tables)