DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
\c shop;

CREATE DOMAIN tinyint AS SMALLINT
CHECK (VALUE BETWEEN 0 AND 255);


CREATE TABLE categories(
    id SERIAL,
    description VARCHAR(45),
    state TINYINT,
    CONSTRAINT categories_pk PRIMARY KEY (id)
);

CREATE TABLE products(
    id SERIAL,
    name VARCHAR(45),
    id_category INT,
    bar_code VARCHAR(150),
    sale_price DECIMAL(16,2),
    stock INT,
    state TINYINT,
    CONSTRAINT products_pk PRIMARY KEY (id),
    CONSTRAINT fk_products_categories FOREIGN KEY (id_category) REFERENCES categories(id)
);

CREATE TABLE clients(
    id SERIAL,
    firstname VARCHAR(40),
    lastname VARCHAR(100),
    cellphone DECIMAL(10,0),
    address VARCHAR(80),
    email VARCHAR(70),
    CONSTRAINT clients_pk PRIMARY KEY (id)
);

CREATE TABLE purchases(
    id SERIAL,
    id_client INT,
    date TIMESTAMP,
    payment_method CHAR(1),
    comment VARCHAR(300),
    state VARCHAR(1),
    CONSTRAINT purchases_pk PRIMARY KEY (id),
    CONSTRAINT fk_purchases_clients FOREIGN KEY (id_client) REFERENCES clients(id)
);

CREATE TABLE purchases_products(
    id_purchases INT,
    id_products INT,
    quantity INT,
    total DECIMAL(16,2),
    state TINYINT,
    CONSTRAINT purchases_products_pk PRIMARY KEY (id_purchases,id_products),
    CONSTRAINT fk_purchases_products_products FOREIGN KEY (id_products) REFERENCES products(id),
    CONSTRAINT fk_purchases_products_purchases FOREIGN KEY (id_purchases) REFERENCES purchases(id)
);