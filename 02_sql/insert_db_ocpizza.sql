-- Insert to product table
INSERT INTO product (product_name, price_ht, tax,description)
VALUES ('Chèvre et miel',12.45,1.10,'Pizza à base de crème et de miel AOP provenant de ruches situées dans le var'),
('Carbonara',11.09,1.10,'Pizza à base de crème de mascarpone et de pancetta AOP'),
('3 Salumi',14.27,1.10,'Pizza à base de crème de mascarpone, de sauce tomate, de jambon aux herbes, de coppa et de speck IGP'),
('Margarita',8.09,1.10,'Pizza végétarienne à base de tomates concassées'),
('Salmone E Basilico',13.36,1.10,'Pizza à base de crème mascarpone citronée et de coulis de basilic'),
('Calzone Pollo E Scamorza',12.45,1.10,'Pizza à base de crème de mascarpone, de sauce tomate et émincé de poulet. Accompagné d’une salade verte'),
('Regina',10.45,1.10,'Pizza à base de sauce tomate. A déguster ouverte ou en calzone'),
('Végétarienne',11.09,1.10,'Pizza végétarienne de sauce tomate et de mélange de légumes cuisinés (aubergines et courgettes grillées, concassées de tomates et oignons), carpaccio de courgettes, tomates cerises marinées, olives noires'),
('Vesuvio',11.09,1.10,'Pizza à base de sauce tomate et de merguez de boeuf et de mouton'),
('Pizza Catania',11.09,1.10,'Pizza à base de sauce tomate et de thon'),
('Pizza Bolognese',11.09,1.10,'Pizza à base de sauce tomate et de viande alla Bolognese'),
('Calzone 3 Fromaggi',12.45,1.10,'Pizza à base de crème de marinées. Accompagnée de pousses d’épinard'),
('Pizza 4 Stagioni',12.45,1.10,'Pizza végétarienne à base de sauce tomate et  mélanges de légumes cuisinés (courgettes et coeurs d’artichauts), tomates cerises marinées, olives noires ');


-- Insert into ingredient table
INSERT INTO ingredient (ingredient_name, quantity_min, unity)
VALUES('Farine T55',25000 ,'gramme'), -- 1
('Levure Boulangère', 10000,'gramme'),
('Sel',5000 ,'gramme'),
('Poivre', 5000,'gramme'),
('Mozzarella', 50000,'gramme'), -- 5
('Mascarpone', 25000,'gramme'),
('Gorgonzola',25000 ,'gramme'),
('Taleggio',25000 ,'gramme'),
('Fromage de Chèvre', 25000,'gramme'),
('Scamorza',25000 ,'gramme'), --10
('Parmigiano',25000,'gramme'),
('Tomates',60000 ,'Kilogramme'),
('Tomates cerises', 45000,'gramme'),
('Courgettes',30000 ,'gramme'),
('Aubergines', 25000,'gramme'), -- 15
('Coeurs Artichauts', 20000,'gramme'),
('Olives noires',35000 ,'gramme'),
('Pousses Epignards',20000 ,'gramme'),
('Basilic', 25000,'gramme'),
('Citrons',30000 ,'gramme'), -- 20
('Herbes de Provences',20000 ,'gramme'),
('Oignons Rouges', 20000,'gramme'),
('Champignons',20000 ,'gramme'),
('Ails', 15000,'gramme'),
('Thon', 20000,'gramme'), -- 25
('Speck IGP', 15000,'gramme'),
('Coppa', 15000,'gramme'),
('Jambon cuit',15000 ,'gramme'),
('Merguez de boeuf',15000 ,'gramme'),
('Merguez de mouton', 15000,'gramme'), --30
('Boeuf',25000,'gramme'),
('Pancetta',15000 ,'gramme'),
('Miel', 10000,'gramme'),
('Roquettes',20000,'gramme'),
('Laitues',20000 ,'gramme'), -- 35
('Oeufs',1000 ,'unité'),
('Huile olive', 15000,'ml'),
('Sauce tomate', 35000,'ml'),
('Crème entière',35000 , 'ml'), -- 39
('Concassées de tomates',35000 , 'gramme'), -- 40
('Saumon fumé',35000 , 'gramme'), -- 41
('Coulis de basilic',35000 , 'gramme'), -- 42
('Poulet',35000 , 'gramme'), -- 43
('Coulis de courgettes',35000 , 'gramme'), -- 44
('Spinata Piquante',35000 , 'gramme'); -- 45 chorizo


-- Insert into Recipe
INSERT INTO recipe(id_product, id_ingredient, quantity)
VALUES (1,1, 500), -- Farine
(1,2, 8 ), -- Levure Boulangère
(1,3, 2), -- sel
(1,37, 2), -- Huile d'olive
(1,5, 200), -- Mozzarella
(1,33, 4), -- Miel
(1,39, 200), -- Crème entière
(1,26, 100), -- Speck
(1,34, 250), -- Roquettes
(1,9, 100), -- Chèvre -> Pizza Chèvre et Miel
(2,1, 500), -- Farine
(2,2, 8 ), -- Levure Boulangère
(2,3, 2), -- sel
(2,37, 2), -- Huile d'olive
(2,5, 200), -- Mozzarella
(2,32, 200), -- Pancetta
(2,36, 2), -- Oeufs
(2,6, 200), -- Crème mascarpone
(2,11, 20), -- Parmigiano -> Carbonara
(3 ,1, 500), -- Farine
(3,2, 8 ), -- Levure Boulangère
(3,3, 2), -- sel
(3,37, 2), -- Huile d'olive
(3,5, 200), -- Mozzarella
(3,38, 20), -- Sauce tomate
(3,7, 100), -- Gorgonzola
(3,26, 100), -- Speck
(3,27, 100), -- Coppa
(3,28, 100), -- Jambon cuit aux herbes -> 3 Salumi
(4 ,1, 500), -- Farine
(4,2, 8 ), -- Levure Boulangère
(4,3, 2), -- sel
(4,37, 2), -- Huile d'olive
(4,5, 200), -- Mozzarella
(4,40, 20), -- Concassées de tomates
(4,18, 50), -- Feuilles de basilic -> Margarita
(5 ,1, 500), -- Farine
(5,2, 8 ), -- Levure Boulangère
(5,3, 2), -- sel
(5,37, 2),-- Huile d'olive
(5,5, 200), -- Mozzarella
(5,6, 200), -- Crème mascarpone
(5,20, 100), -- Citron pour la crème
(5,42, 100), -- Coulis de basilic
(5,41, 200), -- Saumon fumé
(5,18, 50), -- Feuilles de basilic -> Salmone E Basilico
(6 ,1, 500), -- Farine
(6,2, 8 ), -- Levure Boulangère
(6,3, 2), -- sel
(6,37, 2), -- Huile d'olive
(6,5, 200), -- Mozzarella
(6,6, 200), -- Crème mascarpone
(6,38, 20), -- Sauce tomate
(6,10, 100), -- Scarmorza
(6,43, 200), -- Poulet
(6,35, 10), -- Salade laitue -> Calzone Pollo E Scamorza
(7 ,1, 500), -- Farine
(7,2, 8 ), -- Levure Boulangère
(7,3, 2), -- sel
(7,37, 2), -- Huile d'olive
(7,5, 200), -- Mozzarella
(7,38, 20), -- Sauce tomate
(7,23, 100), -- Champignon
(7,28, 200), -- Jambon cuit
(7,17, 10), -- Olives noires -> Regina
(8 ,1, 500), -- Farine
(8,2, 8 ), -- Levure Boulangère
(8,3, 2), -- sel
(8,37, 2), -- Huile d'olive
(8,5, 200), -- Mozzarella
(8,38, 20), -- Sauce tomate
(8,15, 100), -- Aubergines
(8,14, 200), -- Courgettes
(8,17, 10), -- Olives noires
(8,40, 100), -- Concassée de tomate
(8,13, 100), -- Tomates cerises
(8,22, 10), -- Oignons rouges
(8,44, 100), -- Coulis de courgettes -> Végétarienne
(9 ,1, 500), -- Farine
(9,2, 8 ), -- Levure Boulangère
(9,3, 2), -- sel
(9,37, 2), -- Huile d'olive
(9,5, 200), -- Mozzarella
(9,29, 20), -- Merguez de beouf
(9,30, 200), -- Merguez de mouton
(9,36, 1), -- Oeuf
(9,45, 10), -- Spinata Piquante -> Vesuvio
(10 ,1, 500), -- Farine
(10,2, 8 ), -- Levure Boulangère
(10,3, 2), -- sel
(10,37, 2), -- Huile d'olive
(10,5, 200), -- Mozzarella
(10,38, 20), -- Sauce tomate
(10,25, 100), -- Thon
(10,22, 100), -- Oignons rouges -> Catania
(11 ,1, 500), -- Farine
(11,2, 8 ), -- Levure Boulangère
(11,3, 2), -- sel
(11,37, 2), -- Huile d'olive
(11,5, 200), -- Mozzarella
(11,38, 20), -- Sauce tomate
(11,31, 200), -- Alla bolognese
(11,22, 100), -- Oignons rouges -> Alla Bolognese
(12 ,1, 500), -- Farine
(12,2, 8 ), -- Levure Boulangère
(12,3, 2), -- sel
(12,37, 2), -- Huile d'olive
(12,5, 200), -- Mozzarella
(12,6, 200), -- Crème mascarpone
(12,9, 100), -- Chèvre
(12,7, 100), -- Gorgonzola
(12,22, 100), -- Pousses epinards -> Calzone 3 Fromaggi
(13 ,1, 500), -- Farine
(13,2, 8 ), -- Levure Boulangère
(13,3, 2), -- sel
(13,37, 2), -- Huile d'olive
(13,5, 200), -- Mozzarella
(13,38, 20), -- Sauce tomate
(13,15, 100), -- Aubergines
(13,14, 200), -- Courgettes
(13,17, 10), -- Olives noires
(13,13, 100), -- Tomates cerises
(13,16, 100); -- Coeur Artichauts -> 4 Stagioni


-- Insert to address table
INSERT INTO address (num, street, zip_code, city)
VALUES(20,'Boulevard Saint-Michel','75006','PARIS'), -- address store
(2,'Boulevard Haussmann','75009','PARIS'),
(8,'Quai Marcel Boyer','94200','IVRY SUR SEINE'),
(2,'Avenue de la cité','78140','VELIZY VILLACOUBLAY'),
(27,'Jules Ferry','93110','ROSNY SOUS BOIS'),
(31,'Marché Couvert','92190','MEUDON'),
(12,'Rue Nationale','75013','PARIS'), -- address founder -> 7
(6,'Rue de Meudon','92140','CLAMART'),
(351,'Marcel Sembat','78140','VELIZY VILLACOUBLAY'), -- address customer -> 9
(24,'Rue Nationale','75013','PARIS'),
(55,'Henri Barbusse','92240','MALAKOFF'),
(33,'Rue Mouchez','75013','PARIS'),
(82,'Rue Boileau','75016','PARIS'),
(41,'Rue Meaux','75019','PARIS'), -- address pizzaiolo -> 14
(70,'Rue Didot','75014','PARIS'),
(197,'Rue Tolbiac','75013','PARIS'),
(18,'Rue Crussol','75111','PARIS'),
(25,'Rue Diderot','92130','ISSY LES MOULINEAUX'),
(1,'Rue Martin','92140','CLAMART'),
(22,'Rue Carreau','92350','LE PLESSIS ROBINSON'),
(19,'Rue Vignon','75008','PARIS'), -- Deliver -> 21
(14,'Place Nation','75012','PARIS'),
(102,'Boulevard Galliéni','92130','ISSY LES MOULINEAUX'),
(2,'Rue  Convention','75015','PARIS'),
(2,'Avenue Raymond Aron','92160','ANTHONY'),
(6,'Rue Longchamp','92200','NEUILLY SUR SEINE'),
(112,'Rue Saint Placide','75006','PARIS'), -- Receptionnist -> 27
(41,'Rue Meaux','75019','PARIS'),
(18,'Rue Poterie','92600','SURESNE'),
(113,'Rue Cambronne','75015','PARIS'); -- 30



-- insert to store
INSERT INTO store (store_name, phone, email,id_address)
VALUES('Villa Medicis Da Napoli by OcPizza', '0943060808', 'villamedicisdanapoli@ocpizza.com',1),
('Giacomo & Gusto Italia by OcPizza', '0940599668', 'Giacomobygustoitalia@ocpizza.com',2),
('La Stella by OcPizza', '0982315047', 'lastella@ocpizza.com',3),
('Pizzeria Oscia by OcPizza', '0942602380', 'pizzeriaoscia@ocpizza.com',4),
('Cinque Pizza by OcPizza', '0943316820', 'cinquepizza@ocpizza.com',5);

-- Insert into stock table
INSERT INTO stock(id_store, id_ingredient, quantity)
VALUES (1,1,100000),
(1,2,100000),
(1,3,100000),
(1,4,100000),
(1,5,100000),
(1,6,100000),
(1,7,100000),
(1,8,100000),
(1,9,100000),
(1,10,100000),
(1,11,100000),
(1,12,100000),
(1,13,100000),
(1,14,100000),
(1,15,100000),
(1,16,100000),
(1,17,100000),
(1,18,100000),
(1,19,100000),
(1,20,100000),
(1,21,100000),
(1,22,100000),
(1,23,100000),
(1,24,100000),
(1,25,100000),
(1,26,100000),
(1,27,100000),
(1,28,100000),
(1,29,100000),
(1,30,100000),
(1,31,100000),
(1,32,100000),
(1,33,100000),
(1,34,100000),
(1,35,100000),
(1,36,100000),
(1,37,100000),
(1,38,100000),
(1,39,100000),
(1,40,100000),
(1,41,100000),
(1,42,100000),
(1,43,100000),
(1,44,100000),
(1,45,100000),
(2,1,100000),
(2,2,100000),
(2,3,100000),
(2,4,100000),
(2,5,100000),
(2,6,100000),
(2,7,100000),
(2,8,100000),
(2,9,100000),
(2,10,100000),
(2,11,100000),
(2,12,100000),
(2,13,100000),
(2,14,100000),
(2,15,100000),
(2,16,100000),
(2,17,100000),
(2,18,100000),
(2,19,100000),
(2,20,100000),
(2,21,100000),
(2,22,100000),
(2,23,100000),
(2,24,100000),
(2,25,100000),
(2,26,100000),
(2,27,100000),
(2,28,100000),
(2,29,100000),
(2,30,100000),
(2,31,100000),
(2,32,100000),
(2,33,100000),
(2,34,100000),
(2,35,100000),
(2,36,100000),
(2,37,100000),
(2,38,100000),
(2,39,100000),
(2,40,100000),
(2,41,100000),
(2,42,100000),
(2,43,100000),
(2,44,100000),
(2,45,100000),
(3,1,100000),
(3,2,100000),
(3,3,100000),
(3,4,100000),
(3,5,100000),
(3,6,100000),
(3,7,100000),
(3,8,100000),
(3,9,100000),
(3,10,100000),
(3,11,100000),
(3,12,100000),
(3,13,100000),
(3,14,100000),
(3,15,100000),
(3,16,100000),
(3,17,100000),
(3,18,100000),
(3,19,100000),
(3,20,100000),
(3,21,100000),
(3,22,100000),
(3,23,100000),
(3,24,100000),
(3,25,100000),
(3,26,100000),
(3,27,100000),
(3,28,100000),
(3,29,100000),
(3,30,100000),
(3,31,100000),
(3,32,100000),
(3,33,100000),
(3,34,100000),
(3,35,100000),
(3,36,100000),
(3,37,100000),
(3,38,100000),
(3,39,100000),
(3,40,100000),
(3,41,100000),
(3,42,100000),
(3,43,100000),
(3,44,100000),
(3,45,100000),
(4,1,100000),
(4,2,100000),
(4,3,100000),
(4,4,100000),
(4,5,100000),
(4,6,100000),
(4,7,100000),
(4,8,100000),
(4,9,100000),
(4,10,100000),
(4,11,100000),
(4,12,100000),
(4,13,100000),
(4,14,100000),
(4,15,100000),
(4,16,100000),
(4,17,100000),
(4,18,100000),
(4,19,100000),
(4,20,100000),
(4,21,100000),
(4,22,100000),
(4,23,100000),
(4,24,100000),
(4,25,100000),
(4,26,100000),
(4,27,100000),
(4,28,100000),
(4,29,100000),
(4,30,100000),
(4,31,100000),
(4,32,100000),
(4,33,100000),
(4,34,100000),
(4,35,100000),
(4,36,100000),
(4,37,100000),
(4,38,100000),
(4,39,100000),
(4,40,100000),
(4,41,100000),
(4,42,100000),
(4,43,100000),
(4,44,100000),
(4,45,100000),
(5,1,100000),
(5,2,100000),
(5,3,100000),
(5,4,100000),
(5,5,100000),
(5,6,100000),
(5,7,100000),
(5,8,100000),
(5,9,100000),
(5,10,100000),
(5,11,100000),
(5,12,100000),
(5,13,100000),
(5,14,100000),
(5,15,100000),
(5,16,100000),
(5,17,100000),
(5,18,100000),
(5,19,100000),
(5,20,100000),
(5,21,100000),
(5,22,100000),
(5,23,100000),
(5,24,100000),
(5,25,100000),
(5,26,100000),
(5,27,100000),
(5,28,100000),
(5,29,100000),
(5,30,100000),
(5,31,100000),
(5,32,100000),
(5,33,100000),
(5,34,100000),
(5,35,100000),
(5,36,100000),
(5,37,100000),
(5,38,100000),
(5,39,100000),
(5,40,100000),
(5,41,100000),
(5,42,100000),
(5,43,100000),
(5,44,100000),
(5,45,100000);



-- Insert to customer table
INSERT INTO customer (first_name, last_name, phone, birth_date, email, password,id_address)
VALUES('Darryl','Macleod','0644560808','1975-12-24', 'darrylmacleod@mail.com','U2@2412',9 ),
('Linus','Franklin','0664060812','1985-04-21','linusfranklin@mail.com', 'Bauhaus@2104',10),
('Gabrielle','Coet','0665860833','1980-06-21','gabriellecoet@mail.com', 'Dam@20404',11 ),
('Xavier','Noé','0622061212','1981-11-09','xaviernoe@mail.com','Dassault@2104',12),
('Annie','Méré','0723101212','1983-07-14','anniemere@mail.com', 'Helo@0603',13),
('Annie','Méré','0723101212','1983-07-14','anniemere@mail.com', 'Helo@0603',13);

-- insert to founder table
INSERT INTO founder (first_name, last_name, phone, birth_date, email, password,id_address, salary, start_date, end_date, id_store)
VALUES('Lola', 'Righini', '0644250810','1985-06-22', 'lolarighini@mail.com','Lola@founder22', 7,4000,'1995-01-12', NULL,NULL ),
('Franck', 'Martin', '0644330845','1982-04-14', 'franckmartin@mail.com','Franck@founder14',8 ,4000 ,'1995-01-12', NULL, NULL);

-- insert into pizzaiolo table
INSERT INTO pizzaiolo (first_name, last_name, phone, birth_date, email, password,id_address, salary, start_date, end_date, id_store)
VALUES('Guiseppe', 'Martini', '0658560808','1975-06-12','guiseppemartini@mail.com', 'Guiseppe@06', 14, 3000,'1995-06-22', NULL, 1),
('Giacomo', 'Fiorantino', '0644230808','1990-05-03','giacomofiorentino@mail.com', 'Giacomo@05', 15,3000 ,'1995-07-23', NULL,2 ),
('Paolo', 'Napoli', '0744230508','1970-03-13','paolonapoli@mail.com', 'Paolo@01', 16,3000 ,'1995-07-23', NULL,3 ),
('Claudia', 'Rigatoni', '0744230859','1995-02-28','claudiarigatoni@mail.com', 'Claudia@28', 17,3000 ,'2010-04-10', NULL,4 ),
('Helena', 'Fiorantino', '0744280808','1995-11-03','helenafiorentino@mail.com', 'Helena@11', 18,3000 ,'2012-07-23', NULL,5 ),
('Lionel', 'Dupont', '0744230808','1975-05-03','lioneldupont@mail.com', 'Giacomo@05', 20,3000 ,'2019-07-23', '2020-01-12',NULL );

-- insert into receptionnist table
INSERT INTO receptionnist (first_name, last_name, phone, birth_date, email, password,id_address, salary, start_date, end_date, id_store)
VALUES('Madeline', 'Martini', '0744280855','1975-05-03', 'madelinemartini@mail.com','madeline@75', 27,2500 ,'1999-01-01', NULL,1 ),
('Nathan', 'Eboué', '074338808','1982-09-22','nathaneboue@mail.com', 'nathan@09', 28,2500 ,'2000-07-23', NULL,4),
('Reine', 'Otis', '0778124532','1980-12-24','reineotis@mail.com', 'reine@02', 29,2500 ,'2000-07-23', NULL,3);



-- insert into deliver table
INSERT INTO deliver (first_name, last_name, phone, birth_date,email, password, id_address, salary, start_date, end_date, id_store)
VALUES('Alex', 'Kaloustian', '0743558832','1995-02-22','alexkaloustian@mail.com', 'alex@02', 21,2500 ,'2015-07-23', NULL,1),
('Henri', 'Renan', '0769528832','1992-02-22','henrirenan@mail.com', 'renan@22', 22,2500 ,'2020-06-15', NULL,2),
('Sophie', 'Garmin', '0787453622','1992-02-25','sophiegarmin@mail.com', 'sophie@02', 23,2500 ,'2015-07-23', NULL,3),
('Héloise', 'Narche', '0699221423','1995-12-22','alexkaloustian@mail.com', 'narche@02', 24,2500 ,'2017-07-23', NULL,4),
('François', 'Lamarque', '0689741122','1975-02-22','francoislamarque@mail.com', 'lamarque@12', 25,2500 ,'1996-07-23', NULL,5),
('Loic', 'Papaoui', '0658231433','1997-02-22','loicpapaoui@mail.com', 'loic@85', 26,2500 ,'2020-07-23', NULL,3);

-- insert into Ordered
INSERT INTO ordered(date_order,id_pizzaiolo, id_store, id_customer)
VALUES ('2021-03-03 12:20:35',8, 1, 1), -- 1
('2021-03-10 21:20:35',9, 2, 3),-- 2
('2021-03-10 20:20:35',10, 3, 2),-- 3
('2021-03-10 19:20:35',11, 4, 4),-- 4
('2021-03-12 14:20:35',12, 5, 5),-- 5
('2021-03-12 11:20:35',9, 1, 1),-- 6
('2021-03-12 11:20:35',9, 1, 1),-- 7
('2021-03-12 14:20:35',10, 3, 2);-- 8

-- Insert into Ordered On line
INSERT INTO ordered_online(id_ordered, status,id_address,id_deliver)
VALUES(25,'completed',9,17 ),
(26,'on the way', 11,19),
(27,'preparing', 10,18),
(31,'preparing',14,21);

-- Insert into Ordered Take Away
INSERT INTO ordered_takeaway (id_ordered, status,id_receptionnist)
VALUES (31,'preparing',16);-- 9
-- Insert into Ordered Click & Collect
INSERT INTO ordered_clickcollect (id_ordered, status,id_receptionnist)
VALUES
(28,'order placed',16),
(29,'ready to pick up',15),
(30,'order placed',16),
(32,'preparing',16);

-- Insert into Order_Detail
INSERT INTO ordered_detail(id_product, id_ordered,quantity, price_ht, tax )
VALUES (1, 25, 1,12.45,1.10),-- 1
(5,25,2, 13.36, 1.10),
(9,26,1, 11.09, 1.10),
(8,26,1, 11.09, 1.10),
(4,26,1, 8.09, 1.10),
(7,27,2, 10.45, 1.10),
(13,28,1, 12.45, 1.10),
(3,28,1, 14.27, 1.10),
(2,29,2, 11.09, 1.10),
(5,30,1, 13.36, 1.10),
(8,30,1, 11.09, 1.10),
(11,31,1, 11.09, 1.10),
(7,32,2, 10.45, 1.10);










