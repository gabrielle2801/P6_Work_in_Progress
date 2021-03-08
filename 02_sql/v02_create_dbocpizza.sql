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
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name_product varchar(255) NOT NULL,
	"price_Ttc" decimal(2,2),
	description text,
	CONSTRAINT product_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.product OWNER TO postgres;
-- ddl-end --

-- object: public.ingredient | type: TABLE --
-- DROP TABLE IF EXISTS public.ingredient CASCADE;
CREATE TABLE public.ingredient (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	quantity_min integer,
	unity varchar(255),
	CONSTRAINT ingredient_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.ingredient OWNER TO postgres;
-- ddl-end --

-- object: public.store | type: TABLE --
-- DROP TABLE IF EXISTS public.store CASCADE;
CREATE TABLE public.store (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name_store varchar(255) NOT NULL,
	phone varchar(10) NOT NULL,
	email varchar(255) NOT NULL,
	id_adress integer,
	CONSTRAINT store_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.store OWNER TO postgres;
-- ddl-end --

-- object: public.ordered | type: TABLE --
-- DROP TABLE IF EXISTS public.ordered CASCADE;
CREATE TABLE public.ordered (
	id serial NOT NULL,
	date_order date NOT NULL,
	CONSTRAINT ordered_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.ordered OWNER TO postgres;
-- ddl-end --

-- object: public.adress | type: TABLE --
-- DROP TABLE IF EXISTS public.adress CASCADE;
CREATE TABLE public.adress (
	id integer NOT NULL GENERATED ALWAYS AS IDENTITY ,
	num integer NOT NULL,
	street varchar(255) NOT NULL,
	post_code varchar(5) NOT NULL,
	city varchar(100) NOT NULL,
	CONSTRAINT adress_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.adress OWNER TO postgres;
-- ddl-end --

-- object: public.person | type: TABLE --
-- DROP TABLE IF EXISTS public.person CASCADE;
CREATE TABLE public.person (
	id serial NOT NULL,
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	phone varchar(10) NOT NULL,
	birth_date date NOT NULL,
	password varchar(255),
	id_adress integer,
	CONSTRAINT person_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.person OWNER TO postgres;
-- ddl-end --

-- object: public.customer | type: TABLE --
-- DROP TABLE IF EXISTS public.customer CASCADE;
CREATE TABLE public.customer (
	id serial NOT NULL,
	email varchar(255) NOT NULL,

-- 	first_name varchar(100) NOT NULL,
-- 	last_name varchar(100) NOT NULL,
-- 	phone varchar(10) NOT NULL,
-- 	birth_date date NOT NULL,
-- 	password varchar(255),
-- 	id_adress integer,
	CONSTRAINT customer_pk PRIMARY KEY (id)

)
 INHERITS(public.person);
-- ddl-end --
-- ALTER TABLE public.customer OWNER TO postgres;
-- ddl-end --

-- object: public.employee | type: TABLE --
-- DROP TABLE IF EXISTS public.employee CASCADE;
CREATE TABLE public.employee (
	id serial NOT NULL,
	salary numeric(5,2) NOT NULL,
	start_date date NOT NULL,
	end_date date,
	id_store integer,
	id_post integer,

-- 	first_name varchar(100) NOT NULL,
-- 	last_name varchar(100) NOT NULL,
-- 	phone varchar(10) NOT NULL,
-- 	birth_date date NOT NULL,
-- 	password varchar(255),
-- 	id_adress integer,
	CONSTRAINT employee_pk PRIMARY KEY (id)

)
 INHERITS(public.person);
-- ddl-end --
-- ALTER TABLE public.employee OWNER TO postgres;
-- ddl-end --

-- object: store_fk | type: CONSTRAINT --
-- ALTER TABLE public.employee DROP CONSTRAINT IF EXISTS store_fk CASCADE;
ALTER TABLE public.employee ADD CONSTRAINT store_fk FOREIGN KEY (id_store)
REFERENCES public.store (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: adress_fk | type: CONSTRAINT --
-- ALTER TABLE public.person DROP CONSTRAINT IF EXISTS adress_fk CASCADE;
ALTER TABLE public.person ADD CONSTRAINT adress_fk FOREIGN KEY (id_adress)
REFERENCES public.adress (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.post | type: TABLE --
-- DROP TABLE IF EXISTS public.post CASCADE;
CREATE TABLE public.post (
	id serial NOT NULL,
	name_post varchar(255),
	CONSTRAINT post_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.post OWNER TO postgres;
-- ddl-end --

-- object: post_fk | type: CONSTRAINT --
-- ALTER TABLE public.employee DROP CONSTRAINT IF EXISTS post_fk CASCADE;
ALTER TABLE public.employee ADD CONSTRAINT post_fk FOREIGN KEY (id_post)
REFERENCES public.post (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.ordered_online | type: TABLE --
-- DROP TABLE IF EXISTS public.ordered_online CASCADE;
CREATE TABLE public.ordered_online (
	id serial NOT NULL,
	status varchar(255) NOT NULL,
	id_customer integer,
	id_employee integer,

-- 	date_order date NOT NULL,
	CONSTRAINT ordered_online_pk PRIMARY KEY (id)

)
 INHERITS(public.ordered);
-- ddl-end --
-- ALTER TABLE public.ordered_online OWNER TO postgres;
-- ddl-end --

-- object: public.ordered_takeaway | type: TABLE --
-- DROP TABLE IF EXISTS public.ordered_takeaway CASCADE;
CREATE TABLE public.ordered_takeaway (
	id serial NOT NULL,
	status varchar(255) NOT NULL,
	id_employee integer,

-- 	date_order date NOT NULL,
	CONSTRAINT ordered_takeaway_pk PRIMARY KEY (id)

)
 INHERITS(public.ordered);
-- ddl-end --
-- ALTER TABLE public.ordered_takeaway OWNER TO postgres;
-- ddl-end --

-- object: public.ordered_clickcollect | type: TABLE --
-- DROP TABLE IF EXISTS public.ordered_clickcollect CASCADE;
CREATE TABLE public.ordered_clickcollect (
	id serial NOT NULL,
	status varchar(255) NOT NULL,
	id_customer integer,

-- 	date_order date NOT NULL,
	CONSTRAINT ordered_clickcollect_pk PRIMARY KEY (id)

)
 INHERITS(public.ordered);
-- ddl-end --
-- ALTER TABLE public.ordered_clickcollect OWNER TO postgres;
-- ddl-end --

-- object: public.many_adress_has_many_ordered_online | type: TABLE --
-- DROP TABLE IF EXISTS public.many_adress_has_many_ordered_online CASCADE;
CREATE TABLE public.many_adress_has_many_ordered_online (
	id_adress integer NOT NULL,
	id_ordered_online integer NOT NULL,
	CONSTRAINT many_adress_has_many_ordered_online_pk PRIMARY KEY (id_adress,id_ordered_online)

);
-- ddl-end --

-- object: adress_fk | type: CONSTRAINT --
-- ALTER TABLE public.many_adress_has_many_ordered_online DROP CONSTRAINT IF EXISTS adress_fk CASCADE;
ALTER TABLE public.many_adress_has_many_ordered_online ADD CONSTRAINT adress_fk FOREIGN KEY (id_adress)
REFERENCES public.adress (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: ordered_online_fk | type: CONSTRAINT --
-- ALTER TABLE public.many_adress_has_many_ordered_online DROP CONSTRAINT IF EXISTS ordered_online_fk CASCADE;
ALTER TABLE public.many_adress_has_many_ordered_online ADD CONSTRAINT ordered_online_fk FOREIGN KEY (id_ordered_online)
REFERENCES public.ordered_online (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
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
	id_ordered integer NOT NULL,
	id_product integer NOT NULL,
	quantity integer NOT NULL,
	price_ht numeric(4,2) NOT NULL,
	tax numeric(2,2) NOT NULL,
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

-- object: customer_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered_online DROP CONSTRAINT IF EXISTS customer_fk CASCADE;
ALTER TABLE public.ordered_online ADD CONSTRAINT customer_fk FOREIGN KEY (id_customer)
REFERENCES public.customer (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: customer_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered_clickcollect DROP CONSTRAINT IF EXISTS customer_fk CASCADE;
ALTER TABLE public.ordered_clickcollect ADD CONSTRAINT customer_fk FOREIGN KEY (id_customer)
REFERENCES public.customer (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: employee_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered_online DROP CONSTRAINT IF EXISTS employee_fk CASCADE;
ALTER TABLE public.ordered_online ADD CONSTRAINT employee_fk FOREIGN KEY (id_employee)
REFERENCES public.employee (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: employee_fk | type: CONSTRAINT --
-- ALTER TABLE public.ordered_takeaway DROP CONSTRAINT IF EXISTS employee_fk CASCADE;
ALTER TABLE public.ordered_takeaway ADD CONSTRAINT employee_fk FOREIGN KEY (id_employee)
REFERENCES public.employee (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: adress_fk | type: CONSTRAINT --
-- ALTER TABLE public.store DROP CONSTRAINT IF EXISTS adress_fk CASCADE;
ALTER TABLE public.store ADD CONSTRAINT adress_fk FOREIGN KEY (id_adress)
REFERENCES public.adress (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public.payement | type: TABLE --
-- DROP TABLE IF EXISTS public.payement CASCADE;
CREATE TABLE public.payement (
	id serial NOT NULL,
	payement_date date,
	amount decimal(4,2),
	id_customer integer,
	CONSTRAINT payement_pk PRIMARY KEY (id)

);
-- ddl-end --
-- ALTER TABLE public.payement OWNER TO postgres;
-- ddl-end --

-- object: customer_fk | type: CONSTRAINT --
-- ALTER TABLE public.payement DROP CONSTRAINT IF EXISTS customer_fk CASCADE;
ALTER TABLE public.payement ADD CONSTRAINT customer_fk FOREIGN KEY (id_customer)
REFERENCES public.customer (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --


