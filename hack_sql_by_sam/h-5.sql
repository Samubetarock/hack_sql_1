CREATE TABLE roles (
id_role SERIAL PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE countries (
id_country SERIAL PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE customers (
email SERIAL PRIMARY KEY,
id_country INTEGER,
id_role INTEGER,
name VARCHAR(50),
age INTEGER,
password VARCHAR(50),
address VARCHAR(50),
FOREIGN KEY (id_country) REFERENCES countries(id_country),
FOREIGN KEY (id_role) REFERENCES roles(id_role)
);


CREATE TABLE payments (
id_payment SERIAL PRIMARY KEY,
type VARCHAR(50)
);


CREATE TABLE invoice_status (
id_invoice_status SERIAL PRIMARY KEY,
status BOOLEAN
);


CREATE TABLE invoices (
id_invoice SERIAL PRIMARY KEY,
id_customer INTEGER,
id_payment INTEGER,
id_invoice_status INTEGER,
date TIMESTAMP,
total_to_pay DECIMAL(10, 2),
total_without_tax DECIMAL(10, 2),
FOREIGN KEY (id_payment) REFERENCES payments(id_payment),
FOREIGN KEY (id_invoice_status) REFERENCES invoice_status(id_invoice_status),
foreign key (id_customer) REFERENCES customers(email)
);


CREATE TABLE discounts (
id_discount SERIAL PRIMARY KEY,
status BOOLEAN,
percentage DECIMAL(10, 2)
);


CREATE TABLE offers (
id_offer SERIAL PRIMARY KEY,
status BOOLEAN
);


CREATE TABLE taxes (
id_tax SERIAL PRIMARY KEY,
percentage DECIMAL(10, 2)
);


CREATE TABLE products (
id_product SERIAL PRIMARY KEY,
name VARCHAR(50) not NULL,
description TEXT not NULL,
minimum_stock INTEGER not NULL,
maximum_stock INTEGER not NULL,
current_stock INTEGER not NULL,
price DECIMAL(10, 2) not NULL,
price_with_tax DECIMAL(10, 2),
id_discount INT,
id_offer INTEGER,
id_tax INTEGER,
foreign key (id_discount) references discounts(id_discount),
foreign key (id_offer) references offers(id_offer),
foreign key (id_tax) references taxes(id_tax)
);


CREATE TABLE orders (
id_order SERIAL PRIMARY KEY,
id_product INTEGER,
id_invoice INTEGER,
detail VARCHAR(50),
amount INTEGER not NULL,
price DECIMAL(10, 2) not NULL,
FOREIGN KEY (id_product) REFERENCES products(id_product),
foreign key (id_invoice) REFERENCES invoices(id_invoice)
);


CREATE TABLE products_customers (
id_product INTEGER,
id_customer INTEGER,
FOREIGN KEY (id_product) REFERENCES products(id_product),
FOREIGN KEY (id_customer) REFERENCES customers(email)
);