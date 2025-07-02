-- Create the database and switch to it
CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

-- Table 1: Authors
CREATE TABLE IF NOT EXISTS Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Table 2: Books
CREATE TABLE IF NOT EXISTS Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Table 3: Customers
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE,
    address TEXT
);

-- Table 4: Orders
CREATE TABLE IF NOT EXISTS Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Table 5: Order_Details
CREATE TABLE IF NOT EXISTS Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Optional: Insert sample data to test
INSERT INTO Authors (author_name) VALUES ('George Orwell'), ('Jane Austen');

INSERT INTO Books (title, author_id, price, publication_date)
VALUES
  ('1984', 1, 15.99, '1949-06-08'),
  ('Pride and Prejudice', 2, 12.49, '1813-01-28');

INSERT INTO Customers (customer_name, email, address)
VALUES
  ('Alice Smith', 'alice@example.com', '123 Book Lane'),
  ('Bob Johnson', 'bob@example.com', '456 Novel Rd');

INSERT INTO Orders (customer_id, order_date)
VALUES
  (1, CURDATE()),
  (2, CURDATE());

INSERT INTO Order_Details (order_id, book_id, quantity)
VALUES
  (1, 1, 2),
  (2, 2, 1);
