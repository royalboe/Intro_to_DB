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
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        cursor.execute("USE alx_book_store")
        
        # Cleaned up query formatting (no leading spaces)
        query = """
CREATE TABLE IF NOT EXISTS Authors (
    author_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(215) NOT NULL
);

CREATE TABLE IF NOT EXISTS Books (
    book_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(130) NOT NULL,
    author_id BIGINT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

CREATE TABLE IF NOT EXISTS Customers (
    customer_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) NOT NULL UNIQUE,
    address TEXT
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity DOUBLE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);
"""

        # Execute multiple statements
        for _ in cursor.execute(query, multi=True):
            pass

        connection.commit()
        print("Tables created successfully in 'alx_book_store' database.")

except mysql.connector.Error as e:
    print(e)
else:
    print("Database 'alx_book_store' created successfully.")
finally:
    if 'cursor' in locals() and cursor:
        cursor.close()
    if 'connection' in locals() and connection.is_connected():
        connection.close()
