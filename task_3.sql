import mysql.connector

try:
    connection = mysql.connector.connect(
        host="localhost",
        port="3306",
        user="root",
        password="password123"
    )

    if connection.is_connected():
        cursor = connection.cursor()
        # Create database and select it
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store;")
        cursor.execute("USE alx_book_store;")
        # List tables in DATABASE
        cursor.execute("SHOW TABLES;")
        tables = cursor.fetchall()
        print("Tables in the database:", tables)
except mysql.connector.Error as e:
    print("Error:", e)
else:
    print("Database 'alx_book_store' created successfully.")
finally:
    if 'cursor' in locals() and cursor:
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
