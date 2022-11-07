/*
	BASE DE DATOS - TABLAS
*/
CREATE DATABASE daute_project; 
USE daute_project;

CREATE TABLE roles (
	rol_id INTEGER(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    rol_type VARCHAR(20) NOT NULL
);

CREATE TABLE category_client (
	cat_id INTEGER(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cat_type VARCHAR(20) NOT NULL
);

CREATE TABLE brands (
	bra_id INTEGER(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    bra_name VARCHAR(50) NOT NULL#,
    #bra_origin VARCHAR(50) NOT NULL
);

CREATE TABLE users (
	use_id INTEGER(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    use_real_name VARCHAR(50) NOT NULL,
    use_username VARCHAR(25) NOT NULL UNIQUE,
    use_password VARCHAR(50) NOT NULL,
    use_rol_id INTEGER(10) NOT NULL,
    FOREIGN KEY (use_rol_id) REFERENCES roles(rol_id)
);

CREATE TABLE blog (
	blo_id INTEGER(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    blo_header TEXT(100) NOT NULL,
    blo_paragraph TEXT(500) NOT NULL,
    blo_publish_date DATETIME NOT NULL,
    blo_user_id INTEGER(10) NOT NULL,
    FOREIGN KEY (blo_user_id) REFERENCES users(use_id)
);

CREATE TABLE clients (
	cli_id INTEGER(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cli_name VARCHAR(50) NOT NULL,
    cli_date_birth DATE NOT NULL, #YYYY-MM-DD
    cli_dui VARCHAR(10) NOT NULL UNIQUE,
    cli_residence TEXT(100) NOT NULL,
    cli_telephone VARCHAR(15) NOT NULL UNIQUE,
    cli_category_id INTEGER(10) NOT NULL,
    FOREIGN KEY (cli_category_id) REFERENCES category_client(cat_id)
);

CREATE TABLE models (
	mod_id INTEGER(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    mod_code varchar(15) not null UNIQUE,
    mod_name VARCHAR(50) NOT NULL,
    mod_year VARCHAR(4) NOT NULL,
    mod_price DOUBLE NOT NULL,
    mod_color VARCHAR(25) NOT NULL,
    mod_brand_id INTEGER(10) NOT NULL,
    FOREIGN KEY (mod_brand_id) REFERENCES brands(bra_id)
);

CREATE TABLE sale_ticket (
	sal_id INTEGER(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    sal_date_sale DATE NOT NULL,
    sal_user_dealer varchar(25) NOT NULL, #1
    sal_client_buyer varchar(10) NOT NULL, #2
    #sal_car_details INTEGER(10) NOT NULL, #3
    sal_payment_met varchar(10) NOT NULL, #4
    sal_total decimal(10, 2) not null,
    FOREIGN KEY (sal_user_dealer) REFERENCES users(use_username), #1
    FOREIGN KEY (sal_client_buyer) REFERENCES clients(cli_dui) #2
);

CREATE TABLE sale_detail_cars (
	sdc_id INTEGER(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    sdc_cars varchar(10) NOT NULL,
    sdc_cars_qty INTEGER(6) NOT NULL, 
    sdc_cars_unit_price DOUBLE NOT NULL,
    sdc_total_product DOUBLE NOT NULL,
    sdc_sale INT NOT NULL,
    FOREIGN KEY (sdc_cars) REFERENCES models(mod_code),
    FOREIGN KEY (sdc_sale) REFERENCES sale_ticket(sal_id)
);

SELECT * FROM blog;
SELECT * FROM brands;
SELECT * FROM category_client;
SELECT * FROM clients;
SELECT * FROM models;
SELECT * FROM roles;
SELECT * FROM sale_detail_cars;
SELECT * FROM sale_ticket;
SELECT * FROM users;