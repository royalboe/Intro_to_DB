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
      INSERT INTO customer (customer_id, customer_name, email, address)
      VALUES (2, 'Blessing Malik', 'bmalik@sandtech.com', '124 Happiness  Ave.'),
      (3, 'Obed Ehoneah', 'eobed@sandtech.com', '125 Happiness  Ave.'),
       (4, 'Nehemial Kamolu', 'nkamolu@sandtech.com', '126 Happiness  Ave.');
      
"""
    cursor.execute("USE alx_book_store;")
    cursor.execute(query)
    connection.commit()
    print("Rows inserted successfully into Customers table.")
except mysql.connector.Error as e:
    print(f"MySQL Error: {e}")
finally:
    if 'cursor' in locals() and cursor:
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
