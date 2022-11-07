/*
	DATOS DE PRUEBA - BASE DE DATOS
*/

USE daute_project;

INSERT INTO roles(rol_type) VALUES ('Admin'), ('Cashier'), ('Gerent'), ('Dealer');
INSERT INTO category_client(cat_type) VALUES ("Normal"), ("Ocasional"), ("Frecuente"), ("Privilegiado"), ("VIP");
INSERT INTO brands (bra_name) VALUES ("TOYOTA"), ("NISSAN"), ("KIA"), ("HYUNDAI"), ("TESLA"), ("CHEVROLETTE"), ("MAZDA"),
("MERCEDEZ BENZ"), ("LAMBORGHINI"), ("FERRARI"), ("VOLVO"), ("BMW"), ("DODGE"), ("FORD");

INSERT INTO users(use_real_name, use_username, use_password, use_rol_id) VALUES 
('Luis', 'luis22', '1234', 1), 
('Marcela', 'Marcela11', '1234', 1), 
('Pamela', 'Pamela33', '1234', 1), 
('Bryan', 'Bryan44', '1234', 1), 
('Gerardo', 'cajero22', '1234', 2),
('Esteban', 'Alvarenga144', 'Alvarenga144', 1) ;

INSERT INTO blog(blo_header, blo_paragraph, blo_publish_date, blo_user_id) VALUES
("¡Los autos más esperados para 2023!", "Estos son 8 de los autos que seguramente podremos ver en EL SALVADOR y que traen muchos caballos de fuerza, así como también una amplia comunidad que desea adquirirlos, fans fieles a ellos, y vaya, como no serlo... Estos son, lo más esperados: Toyota GR Corolla, Honda Civic Type R, Ferrari Purosangue, Alfa Romeo Tonale, Dodge Hornet, BMW XM, BMW M2, Chevrolet Corvete Z06 y por último BMW M4 CSL... Sin duda que es una lista pequeña, pero con precios muy altos... ¿Y tú, cuál te comprarás?", "2022-10-17 01:47:00", 1),
("¡Toyota Rush, la Nueva Dueña de las calles!", "Fiel a su intención de ser una mini SUV, la Toyota Rush no es demasiado grande pero sí goza de un gran espacio interior que le permite instalar siete asientos en cabina. Cuenta con una parrilla en «V» de rejillas en negro mate que se integra muy bien a la forma de los faros, dando como resultado un efecto visual de ave en vuelo. Los ítems de tecnología presentes en la Toyota Rush se limitan al arranque por botón, la llave inteligente, y el ya mencionado aire acondicionado digital bizona.", "2022-11-01 12:32:00", 2),
("El vehículo más vendido del 2022 ¿Será...?", "El Hyundai Tucson está a punto de lograr un hito histórico en España al convertirse en el primer SUV compacto que consigue ser el coche más vendido del año en nuestro país. Agosto no suele ser un buen mes para la venta de coches, pero hay marcas y modelos que no entienden de vacaciones. Uno de estos coches que no 'descansan' nunca es el Hyundai Tucson, que está manteniendo una línea muy regular durante todo el año y ya es el favorito para convertirse en el coche más vendido de 2022 en España.", "2022-11-07 02:22:00", 3),
("¿Como seleccionar tu primer automovil? Lee esto!!", "Hacerse con el primer coche es símbolo de independencia y libertad. Y es que poder ir a donde quieras con tu vehículo es una realidad. Pero, el desconocimiento podría llevarte a pagar un precio realmente elevado, además, saber escoger el modelo perfecto con un presupuesto ajustado es un arte que, por lo general, los principiantes no dominan. Lo más sabio, en estos casos, es recurrir a la voz de la experiencia para que os comparta algunos consejos para elegir correctamente tu primer vehículo.", "2022-09-24 09:55:00", 4),
("¿Toyota Hilux o Nissan Frontier? La batalla eterna", "Durante décadas, Nissan ha liderado con la mano en la cintura el segmento de las pickups medianas en México. Mucho de ello, tiene que ver con la gran tradición y fama que se ha forjado desde aquellas antecesoras que datan de la época de Datsun. Una de las principales características que la hicieron famosas, fue la economía, sencillez y fácil mantenimiento, lo cual permitió que muchos mexicanos la adoptaran como una compañera de trabajo en sus emprendimientos o negocios.", "2022-10-24 14:10:00", 5);

INSERT INTO clients(cli_name, cli_date_birth, cli_dui, cli_residence, cli_telephone, cli_category_id) VALUES
('Esteban Vladimir Alvarenga Gutiérrez', '2002-10-17', '06379722-6', 'San Rafael, Chalatenango, El Salvador', '7576-8136', 5),
('Pamela Lisbeth Perez Mejía', '2004-06-08', '34379722-7', 'Centro Urbano de Santa Tecla, La Libertad, El Salvador', '2234-4321', 1),
('Marcela Beatriz Nájera Peña', '2002-05-17', '06239232-4', 'Santo Tómas, Cuscatlán, El Salvador', '8897-3445', 2),
('Bryan Aaron Ramirez Barrientos', '2001-11-23', '06323422-3', 'Colonia Santa Lucia, Soyapango, El Salvador', '5554-5665', 4),
('Luis Gerardo Henriquez Rodriguez', '2002-09-04', '06301149-2', 'San Miguel de Mercedez, Chalatenango, El Salvador', '9899-0988', 3);

INSERT INTO models(mod_code, mod_name, mod_year, mod_price, mod_color, mod_brand_id) VALUES 
("1", "Picanto EX", "2022", "14599", "GRIS", 3),
("2", "Sentra LS","2018","16222","BLANCO", 2),
("3", "Model 3", "2021", "31893", "AZUL", 5),
("4", "GLE 450 AMG","2022","125499","NEGRO", 8),
("5", "Camaro", "2019", "23432", "VERDE", 6),
("6", "Challenger","2020","80322","ROJO", 13),
("7", "Frontier Pro 4-EX", "2022", "42.599", "GRIS", 2),
("8", "Urus", "2018", "159876", "GRIS", 9),
("9", "840i sDrive","2022","88151","AZUL", 12),
("10", "Elantra GT","2018","12359","CAFE", 7);

SELECT * FROM users;
SELECT * FROM roles;
SELECT * FROM brands;
SELECT * FROM models;
SELECT * FROM category_client;
SELECT * FROM clients;
SELECT * FROM blog;
SELECT * FROM sale_detail_cars;
SELECT * FROM sale_ticket;

select * from models p INNER JOIN brands d ON p.bra_id = d.mod_brand_id where d.mod_brand_id = 3;
SELECT * FROM models mo INNER JOIN brands br ON br.bra_id = mo.mod_brand_id WHERE mo.mod_brand_id = 3;
SELECT * FROM models mo INNER JOIN brands br ON br.bra_id = mo.mod_brand_id WHERE mo.mod_brand_id = 3;
SELECT * FROM clients c INNER JOIN category_client kc ON kc.cat_id = c.cli_category_id WHERE c.cli_category_id = 1;

/* 
### QUERIES

#AUTH
SELECT u.*, r.rol_type
FROM users u
JOIN roles r on u.use_rol_id = r.rol_id
WHERE u.use_username = 'luis22' and u.use_password = '1234';

#Clients
SELECT * FROM clients;
SELECT * FROM clients c INNER JOIN category_client k ON c.cli_category_id = k.cat_id;
SELECT * FROM blog b INNER JOIN users u ON b.blo_user_id = u.use_id;
SELECT * FROM clients WHERE cli_dui = "06379722-6";



QUERYS PARA REPORTES

# reporte 1	Autos filtrados por marca
SELECT * FROM models mo INNER JOIN brands br ON br.bra_id = mo.mod_brand_id WHERE mo.mod_id = 3;

# Reporte 	Ventas realizadas a cada cliente
SELECT * FROM sale_ticket st INNER JOIN clients c ON st.sal_client_buyer = c.cli_dui;

# Reporte 3 de clientes filtrados por categoría
SELECT * FROM clients c INNER JOIN category_client kc ON kc.cat_id = c.cli_category_id WHERE c.cli_category_id = 1;

# Reporte 4 Reporte de ventas totales (diarias)
SELECT * FROM sale_ticket WHERE sal_date_sale BETWEEN "2022-11-06 00:00:00" AND "2022-11-07 00:00:00";

# Reporte 5 de ventas totales (a la fecha)
SELECT * FROM sale_ticket ORDER BY sal_date_sale ASC;















-- repote 2 ventas por cliente 
select sdc.*, st.sal_user_dealer as usuario, st.sal_client_buyer as cliente, st.sal_date_sale, m.mod_name 
                     from sale_detail_cars sdc
                     join sale_ticket st on sdc.sdc_sale = st.sal_id
                     join models m on sdc.sdc_cars = m.mod_code
                     
                     
                     where sdc.sdc_sale = ?;
                     
 
 
 
 
 
 
 
 
-- reporte 4 ventas totales por dia.                   
select sum(sal_total) as sal_total, sal_date_sale, sal_client_buyer, sal_id
                    from sale_ticket 
                    where sal_date_sale <= curdate()
                    
					group by sal_date_sale;
				
--  reporte 5 a la fecha sin el group by.









# Reporte 	Ventas realizadas a cada cliente
SELECT * FROM sale_ticket st INNER JOIN clients c ON st.sal_client_buyer = c.cli_dui;

*/