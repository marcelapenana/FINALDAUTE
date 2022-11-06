CREATE DATABASE daute_project; 
USE daute_project;

CREATE TABLE roles (
	rol_id INTEGER(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    rol_type VARCHAR(20) NOT NULL
);
insert into roles(rol_type) values ('Admin'), ('Cashier');
insert into roles(rol_type) values ('Gerent');
select * from roles;

CREATE TABLE category_client (
	cat_id INTEGER(10) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    cat_type VARCHAR(20) NOT NULL
);

insert category_client(cat_type) values("M");
UPDATE category_client SET cat_type="N" WHERE cat_id=1;

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

insert into users(use_real_name, use_username, use_password, use_rol_id) values 
('Esteban', 'Alvarenga144', 'Alvarenga144', 1), ('Luis', 'luis22', '1234', 1), ('Gerardo', 'cajero22', '1234', 2);
select * from users;

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

insert into clients(cli_name, cli_date_birth, cli_dui, cli_residence, cli_telephone, cli_category_id) values
('Esteban Vladimir Alvarenga Gutiérrez', '2002-10-17', '06379722-6', 'San Rafael, Chalatenango, El Salvador', '7576-8136', 1),
('Pamela Lisbeth Perez Mejía', '2004-06-08', '34379722-7', 'Centro Urbano de Santa Tecla, La Libertad, El Salvador', '2234-4321', 1),
('Marcela Beatriz Nájera Peña', '2002-05-17', '06239232-4', 'Santo Tómas, Cuscatlán, El Salvador', '8897-3445', 1),
('Bryan Aaron Ramirez Barrientos', '2001-11-23', '06323422-3', 'Colonia Santa Lucia, Soyapango, El Salvador', '5554-5665', 1),
('Luis Gerardo Henriquez Rodriguez', '2002-09-04', '06301149-2', 'San Miguel de Mercedez, Chalatenango, El Salvador', '9899-0988', 1);

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


### QUERIES

#AUTH
SELECT u.*, r.rol_type
FROM users u
JOIN roles r on u.use_rol_id = r.rol_id
WHERE u.use_username = 'luis22' and u.use_password = '1234';

#Clients
SELECT * FROM clients;

SELECT * FROM clients c INNER JOIN category_client k ON c.cli_category_id = k.cat_id;

#Blogs
insert into blog(blo_header, blo_paragraph, blo_publish_date, blo_user_id) values
("Los nuevos autos para 2023", "Parrafo Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in iaculis ex. Etiam volutpat laoreet urna. Morbi ut tortor nec nulla commodo malesuada sit amet vel lacus. Fusce eget efficitur libero. Morbi dapibus porta quam laoreet placerat.Parrafo Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in iaculis ex. Etiam volutpat laoreet urna. Morbi ut tortor nec nulla commodo malesuada sit amet vel lacus. Fusce eget efficitur libero. Morbi dapibus porta quam laoreet",
"2022-11-04 01:47:00", 4);
insert into blog(blo_header, blo_paragraph, blo_publish_date, blo_user_id) values
("Autos más Vendidos del año de la Pandemia", "Parrafo Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in iaculis ex. Etiam volutpat laoreet urna. Morbi ut tortor nec nulla commodo malesuada sit amet vel lacus. Fusce eget efficitur libero. Morbi dapibus porta quam laoreet placerat.Parrafo Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur in iaculis ex. Etiam volutpat laoreet urna. Morbi ut tortor nec nulla commodo malesuada sit amet vel lacus. Fusce eget efficitur libero. Morbi dapibus porta quam laoreet",
"2022-11-05 23:56:05", 1);
select * from blog;

SELECT * FROM blog b INNER JOIN users u ON b.blo_user_id = u.use_id;

SELECT * FROM clients WHERE cli_dui = "06379722-6";
