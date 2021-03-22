-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.2
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: db_ocpizza | type: DATABASE --
-- -- DROP DATABASE IF EXISTS db_ocpizza;
-- CREATE DATABASE db_ocpizza
-- 	OWNER = postgres;
-- -- ddl-end --
-- 

-- object: public.product | type: TABLE --
-- DROP TABLE IF EXISTS public.product CASCADE;
CREATE TABLE public.product (
	id serial NOT NULL,
	product_name varchar(255) NOT NULL,
	price_ht money NOT NULL,
	tax decimal(5,2) NOT NULL,
	description text NOT NULL,
	CONSTRAINT product_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.product OWNER TO postgres;
-- ddl-end --

-- object: public.ingredient | type: TABLE --
-- DROP TABLE IF EXISTS public.ingredient CASCADE;
CREATE TABLE public.ingredient (
	id serial NOT NULL,
	ingredient_name varchar(255) NOT NULL,
	quantity_min integer NOT NULL,
	unity varchar(255) NOT NULL,
	CONSTRAINT ingredient_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.ingredient OWNER TO postgres;
-- ddl-end --

-- object: public.store | type: TABLE --
-- DROP TABLE IF EXISTS public.store CASCADE;
CREATE TABLE public.store (
	id serial NOT NULL,
	store_name varchar(255) NOT NULL,
	phone varchar(10) NOT NULL,
	email varchar(255) NOT NULL,
	id_address integer,
	CONSTRAINT store_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.store OWNER TO postgres;
-- ddl-end --

-- object: public.ordered | type: TABLE --
-- DROP TABLE IF EXISTS public.ordered CASCADE;
CREATE TABLE public.ordered (
	id serial NOT NULL,
	date_order timestamp NOT NULL,
	id_store integer,
	id_pizzaiolo integer,
	id_customer integer,
	CONSTRAINT ordered_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.ordered OWNER TO postgres;
-- ddl-end --

-- object: public.address | type: TABLE --
-- DROP TABLE IF EXISTS public.address CASCADE;
CREATE TABLE public.address (
	id serial NOT NULL,
	num integer NOT NULL,
	street varchar(255) NOT NULL,
	zip_code varchar(5) NOT NULL,
	city varchar(100) NOT NULL,
	CONSTRAINT adress_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.address OWNER TO postgres;
-- ddl-end --

-- object: public.person | type: TABLE --
-- DROP TABLE IF EXISTS public.person CASCADE;
CREATE TABLE public.person (
	id serial NOT NULL,
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	phone varchar(10) NOT NULL,
	birth_date date NOT NULL,
	email varchar(255) NOT NULL,
	password varchar(255) NOT NULL,
	id_address integer,
	CONSTRAINT person_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.person OWNER TO postgres;
-- ddl-end --

-- object: public.customer | type: TABLE --
-- DROP TABLE IF EXISTS public.customer CASCADE;
CREATE TABLE public.customer (

-- 	id integer NOT NULL,
-- 	first_name varchar(100) NOT NULL,
-- 	last_name varchar(100) NOT NULL,
-- 	phone varchar(10) NOT NULL,
-- 	birth_date date NOT NULL,
-- 	email varchar(255) NOT NULL,
-- 	password varchar(255) NOT NULL,
-- 	id_address integer,
	CONSTRAINT customer_pk PRIMARY KEY (id)

)
 INHERITS(public.person);
-- ddl-end --
-- ALTER TABLE public.customer OWNER TO postgres;
-- ddl-end --

-- object: public.employee | type: TABLE --
-- DROP TABLE IF EXISTS public.employee CASCADE;
CREATE TABLE public.employee (
	salary decimal(6,2) NOT NULL,
	start_date date NOT NULL,
	end_date date,
	id_store integer,

-- 	id integer NOT NULL,
-- 	first_name varchar(100) NOT NULL,
-- 	last_name varchar(100) NOT NULL,
-- 	phone varchar(10) NOT NULL,
-- 	birth_date date NOT NULL,
-- 	email varchar(255) NOT NULL,
-- 	password varchar(255) NOT NULL,
-- 	id_address integer,
	CONSTRAINT employee_pk PRIMARY KEY (id)

)
 INHERITS(public.person);
-- ddl-end --
-- ALTER TABLE public.employee OWNER TO postgres;
-- ddl-end --

-- object: public.receptionnist | type: TABLE --
-- DROP TABLE IF EXISTS public.receptionnist CASCADE;
CREATE TABLE public.receptionnist (

-- 	salary decimal(6,2) NOT NULL,
-- 	start_date date NOT NULL,
-- 	end_date date,
-- 	id_store integer,
-- 	id integer NOT NULL,
-- 	first_name varchar(100) NOT NULL,
-- 	last_name varchar(100) NOT NULL,
-- 	phone varchar(10) NOT NULL,
-- 	birth_date date NOT NULL,
-- 	email varchar(255) NOT NULL,
-- 	password varchar(255) NOT NULL,
-- 	id_address integer,
	CONSTRAINT receptionnist_pk PRIMARY KEY (id)

)
 INHERITS(public.employee);
-- ddl-end --
-- ALTER TABLE public.receptionnist OWNER TO postgres;
-- ddl-end --

-- object: store_fk | type: CONSTRAINT --
-- ALTER TABLE public.employee DROP CONSTRAINT IF EXISTS store_fk CASCADE;
ALTER TABLE public.employee ADD CONSTRAINT store_fk FOREIGN KEY (id_store)
REFERENCES public.store (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: address_fk | type: CONSTRAINT --
-- ALTER TABLE public.person DROP CONSTRAINT IF EXISTS address_fk CASCADE;
ALTER TABLE public.person ADD CONSTRAINT address_fk FOREIGN KEY (id_address)
REFERENCES public.address (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.enum | type: TYPE --
-- DROP TYPE IF EXISTS public.enum CASCADE;
CREATE TYPE public.enum AS
 ENUM ('order placed','preparing','on the way','ready to pick up','completed');
-- ddl-end --
-- ALTER TYPE public.enum OWNER TO postgres;
-- ddl-end --

-- object: public.ordered_takeaway | type: TABLE --
-- DROP TABLE IF EXISTS public.ordered_takeaway CASCADE;
CREATE TABLE public.ordered_takeaway (
	id_ordered integer NOT NULL,
	status public.enum NOT NULL,
	id_receptionnist integer,
	CONSTRAINT ordered_takeaway_pk PRIMARY KEY (id_ordered)

);
-- ddl-end --
-- ALTER TABLE public.ordered_takeaway OWNER TO postgres;
-- ddl-end --

-- object: public.ordered_clickcollect | type: TABLE --
-- DROP TABLE IF EXISTS public.ordered_clickcollect CASCADE;
CREATE TABLE public.ordered_clickcollect (
	id_ordered integer NOT NULL,
	status public.enum NOT NULL,
	id_receptionnist integer,
	CONSTRAINT ordered_clickcollect_pk PRIMARY KEY (id_ordered)

);
-- ddl-end --
-- ALTER TABLE public.ordered_clickcollect OWNER TO postgres;
-- ddl-end --

-- object: public.recipe | type: TABLE --
-- DROP TABLE IF EXISTS public.recipe CASCADE;
CREATE TABLE public.recipe (
	id_product integer NOT NULL,
	id_ingredient integer NOT NULL,
	quantity integer NOT NULL,
	CONSTRAINT recipe_pk PRIMARY KEY (id_product,id_ingredient)

);
-- ddl-end --

-- object: product_fk | type: CONSTRAINT --
-- ALTER TABLE public.recipe DROP CONSTRAINT IF EXISTS product_fk CASCADE;
ALTER TABLE public.recipe ADD CONSTRAINT product_fk FOREIGN KEY (id_product)
REFERENCES public.product (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: ingredient_fk | type: CONSTRAINT --
-- ALTER TABLE public.recipe DROP CONSTRAINT IF EXISTS ingredient_fk CASCADE;
ALTER TABLE public.recipe ADD CONSTRAINT ingredient_fk FOREIGN KEY (id_ingredient)
REFERENCES public.ingredient (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public.stock | type: TABLE --
-- DROP TABLE IF EXISTS public.stock CASCADE;
CREATE TABLE public.stock (
	id_store integer NOT NULL,
	id_ingredient integer NOT NULL,
	quantity integer NOT NULL,
	CONSTRAINT stock_pk PRIMARY KEY (id_store,id_ingredient)

);
-- ddl-end --

-- object: store_fk | type: CONSTRAINT --
-- ALTER TABLE public.stock DROP CONSTRAINT IF EXISTS store_fk CASCADE;
ALTER TABLE public.stock ADD CONSTRAINT store_fk FOREIGN KEY (id_store)
REFERENCES public.store (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: ingredient_fk | type: CONSTRAINT --
-- ALTER TABLE public.stock DROP CONSTRAINT IF EXISTS ingredient_fk CASCADE;
ALTER TABLE public.stock ADD CONSTRAINT ingredient_fk FOREIGN KEY (id_ingredient)
REFERENCES public.ingredient (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: public.ordered_detail | type: TABLE --
-- DROP TABLE IF EXISTS public.ordered_detail CASCADE;
CREATE TABLE public.ordered_detail (
	id_product integer NOT NULL,
	id_ordered integer NOT NULL,
	quantity integer NOT NULL,
	price_ht money NOT NULL,
	tax decimal(5,2) NOT NULL,
	CONSTRAINT ordered_detail_pk PRIMARY KEY (id_ordered,id_product)

);
-- ddl-end --

-- object: ordered_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered_detail DROP CONSTRAINT IF EXISTS ordered_fk CASCADE;
ALTER TABLE public.ordered_detail ADD CONSTRAINT ordered_fk FOREIGN KEY (id_ordered)
REFERENCES public.ordered (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: product_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered_detail DROP CONSTRAINT IF EXISTS product_fk CASCADE;
ALTER TABLE public.ordered_detail ADD CONSTRAINT product_fk FOREIGN KEY (id_product)
REFERENCES public.product (id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: address_fk | type: CONSTRAINT --
-- ALTER TABLE public.store DROP CONSTRAINT IF EXISTS address_fk CASCADE;
ALTER TABLE public.store ADD CONSTRAINT address_fk FOREIGN KEY (id_address)
REFERENCES public.address (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: store_uq | type: CONSTRAINT --
-- ALTER TABLE public.store DROP CONSTRAINT IF EXISTS store_uq CASCADE;
ALTER TABLE public.store ADD CONSTRAINT store_uq UNIQUE (id_address);
-- ddl-end --

-- object: public.founder | type: TABLE --
-- DROP TABLE IF EXISTS public.founder CASCADE;
CREATE TABLE public.founder (

-- 	salary decimal(6,2) NOT NULL,
-- 	start_date date NOT NULL,
-- 	end_date date,
-- 	id_store integer,
-- 	id integer NOT NULL,
-- 	first_name varchar(100) NOT NULL,
-- 	last_name varchar(100) NOT NULL,
-- 	phone varchar(10) NOT NULL,
-- 	birth_date date NOT NULL,
-- 	email varchar(255) NOT NULL,
-- 	password varchar(255) NOT NULL,
-- 	id_address integer,
	CONSTRAINT founder_pk PRIMARY KEY (id)

)
 INHERITS(public.employee);
-- ddl-end --
-- ALTER TABLE public.founder OWNER TO postgres;
-- ddl-end --

-- object: public.deliver | type: TABLE --
-- DROP TABLE IF EXISTS public.deliver CASCADE;
CREATE TABLE public.deliver (

-- 	salary decimal(6,2) NOT NULL,
-- 	start_date date NOT NULL,
-- 	end_date date,
-- 	id_store integer,
-- 	id integer NOT NULL,
-- 	first_name varchar(100) NOT NULL,
-- 	last_name varchar(100) NOT NULL,
-- 	phone varchar(10) NOT NULL,
-- 	birth_date date NOT NULL,
-- 	email varchar(255) NOT NULL,
-- 	password varchar(255) NOT NULL,
-- 	id_address integer,
	CONSTRAINT deliver_pk PRIMARY KEY (id)

)
 INHERITS(public.employee);
-- ddl-end --
-- ALTER TABLE public.deliver OWNER TO postgres;
-- ddl-end --

-- object: public.pizzaiolo | type: TABLE --
-- DROP TABLE IF EXISTS public.pizzaiolo CASCADE;
CREATE TABLE public.pizzaiolo (

-- 	salary decimal(6,2) NOT NULL,
-- 	start_date date NOT NULL,
-- 	end_date date,
-- 	id_store integer,
-- 	id integer NOT NULL,
-- 	first_name varchar(100) NOT NULL,
-- 	last_name varchar(100) NOT NULL,
-- 	phone varchar(10) NOT NULL,
-- 	birth_date date NOT NULL,
-- 	email varchar(255) NOT NULL,
-- 	password varchar(255) NOT NULL,
-- 	id_address integer,
	CONSTRAINT pizzaiolo_pk PRIMARY KEY (id)

)
 INHERITS(public.employee);
-- ddl-end --
-- ALTER TABLE public.pizzaiolo OWNER TO postgres;
-- ddl-end --

-- object: store_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered DROP CONSTRAINT IF EXISTS store_fk CASCADE;
ALTER TABLE public.ordered ADD CONSTRAINT store_fk FOREIGN KEY (id_store)
REFERENCES public.store (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.ordered_online | type: TABLE --
-- DROP TABLE IF EXISTS public.ordered_online CASCADE;
CREATE TABLE public.ordered_online (
	id_ordered integer NOT NULL,
	status public.enum NOT NULL,
	id_address integer,
	id_deliver integer,
	CONSTRAINT ordered_online_pk PRIMARY KEY (id_ordered)

);
-- ddl-end --
-- ALTER TABLE public.ordered_online OWNER TO postgres;
-- ddl-end --

-- object: address_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered_online DROP CONSTRAINT IF EXISTS address_fk CASCADE;
ALTER TABLE public.ordered_online ADD CONSTRAINT address_fk FOREIGN KEY (id_address)
REFERENCES public.address (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: receptionnist_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered_clickcollect DROP CONSTRAINT IF EXISTS receptionnist_fk CASCADE;
ALTER TABLE public.ordered_clickcollect ADD CONSTRAINT receptionnist_fk FOREIGN KEY (id_receptionnist)
REFERENCES public.receptionnist (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: receptionnist_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered_takeaway DROP CONSTRAINT IF EXISTS receptionnist_fk CASCADE;
ALTER TABLE public.ordered_takeaway ADD CONSTRAINT receptionnist_fk FOREIGN KEY (id_receptionnist)
REFERENCES public.receptionnist (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: deliver_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered_online DROP CONSTRAINT IF EXISTS deliver_fk CASCADE;
ALTER TABLE public.ordered_online ADD CONSTRAINT deliver_fk FOREIGN KEY (id_deliver)
REFERENCES public.deliver (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: pizzaiolo_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered DROP CONSTRAINT IF EXISTS pizzaiolo_fk CASCADE;
ALTER TABLE public.ordered ADD CONSTRAINT pizzaiolo_fk FOREIGN KEY (id_pizzaiolo)
REFERENCES public.pizzaiolo (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: ordered_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered_online DROP CONSTRAINT IF EXISTS ordered_fk CASCADE;
ALTER TABLE public.ordered_online ADD CONSTRAINT ordered_fk FOREIGN KEY (id_ordered)
REFERENCES public.ordered (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: ordered_online_uq | type: CONSTRAINT --
-- ALTER TABLE public.ordered_online DROP CONSTRAINT IF EXISTS ordered_online_uq CASCADE;
ALTER TABLE public.ordered_online ADD CONSTRAINT ordered_online_uq UNIQUE (id_ordered);
-- ddl-end --

-- object: ordered_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered_clickcollect DROP CONSTRAINT IF EXISTS ordered_fk CASCADE;
ALTER TABLE public.ordered_clickcollect ADD CONSTRAINT ordered_fk FOREIGN KEY (id_ordered)
REFERENCES public.ordered (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: ordered_clickcollect_uq | type: CONSTRAINT --
-- ALTER TABLE public.ordered_clickcollect DROP CONSTRAINT IF EXISTS ordered_clickcollect_uq CASCADE;
ALTER TABLE public.ordered_clickcollect ADD CONSTRAINT ordered_clickcollect_uq UNIQUE (id_ordered);
-- ddl-end --

-- object: ordered_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered_takeaway DROP CONSTRAINT IF EXISTS ordered_fk CASCADE;
ALTER TABLE public.ordered_takeaway ADD CONSTRAINT ordered_fk FOREIGN KEY (id_ordered)
REFERENCES public.ordered (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: ordered_takeaway_uq | type: CONSTRAINT --
-- ALTER TABLE public.ordered_takeaway DROP CONSTRAINT IF EXISTS ordered_takeaway_uq CASCADE;
ALTER TABLE public.ordered_takeaway ADD CONSTRAINT ordered_takeaway_uq UNIQUE (id_ordered);
-- ddl-end --

-- object: customer_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered DROP CONSTRAINT IF EXISTS customer_fk CASCADE;
ALTER TABLE public.ordered ADD CONSTRAINT customer_fk FOREIGN KEY (id_customer)
REFERENCES public.customer (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


