import mysql.connector as connector
from mysql.connector import Error



try:
    connection = connector.connect(
    host="localhost",
    port="3306",
    user="root",
    password="password123")

    if connection.is_connected():
        cursor = connection.cursor()
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        cursor.execute("USE alx_book_store")

except Error as e:
    print(e)
else:
    print("Database 'alx_book_store' created successfully.")
finally:
    if 'cursor' in locals() and cursor:
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()