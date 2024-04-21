INSERT INTO roles (name) VALUES ('Admin'), ('User'), ('Guest');

INSERT INTO countries (name) VALUES ('USA'), ('Canada'), ('Mexico');

INSERT INTO customers (id_country, id_role, name, age, password, address) VALUES
(1, 1, 'John Doe', 30, 'password123', '123 Main St'),
(2, 2, 'Jane Doe', 25, 'password456', '456 Elm St'),
(3, 3, 'Jim Smith', 35, 'password789', '789 Oak St');

INSERT INTO payments (type) VALUES ('Credit Card'), ('Debit Card'), ('Cash');

INSERT INTO invoice_status (status) VALUES (true), (false);

INSERT INTO discounts (status, percentage) VALUES (true, 0.10), (false, 0.05);

INSERT INTO offers (status) VALUES (true), (false);

INSERT INTO taxes (percentage) VALUES (0.05), (0.08), (0.12);

INSERT INTO products (name, description, minimum_stock, maximum_stock, current_stock, price, id_discount, id_offer, id_tax) VALUES
('Product 1', 'Description 1', 10, 50, 30, 100.00, 1, 1, 1),
('Product 2', 'Description 2', 5, 25, 15, 50.00, 2, 2, 2),
('Product 3', 'Description 3', 20, 100, 80, 200.00, 3, 3, 3);

INSERT INTO orders (id_product, id_invoice, detail, amount, price) VALUES
(1, 1, 'Order 1', 2, 100.00),
(2, 2, 'Order 2', 1, 50.00),
(3, 3, 'Order 3', 4, 200.00);

INSERT INTO products_customers (id_product, id_customer) VALUES
(1, 1),
(2, 2),
(3, 3);



INSERT INTO invoices (id_customer, id_payment, id_invoice_status, date, total_to_pay, total_without_tax) VALUES
(1, 1, 1, NOW(), 250.00, 225.00),
(2, 2, 2, NOW(), 150.00, 135.00),
(3, 3, 1, NOW(), 400.00, 360.00);




DELETE FROM customers WHERE email = (SELECT MAX(email) FROM customers);



UPDATE customers SET name = 'Jane Doe 2', age = 26, password = 'password123', address = '456 Elm St 2' WHERE email = (SELECT MAX(email) FROM customers);



UPDATE taxes SET percentage = 0.06 WHERE id_tax IN (1, 2, 3);


UPDATE products SET price = price * 1.10 WHERE id_product IN (1, 2, 3);