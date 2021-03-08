CREATE TABLE product (
    id INT GENERATED ALWAYS AS IDENTITY,
    name_product VARCHAR(100) NOT NULL,
    price_ttc DECIMAL(4,2) NOT NULL,
    description TEXT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE ingredient (
                id INT GENERATED ALWAYS AS IDENTITY,
                name_ingredient VARCHAR(255) NOT NULL,
                quantity_min INTEGER NOT NULL,
                unity VARCHAR(255) NOT NULL,
                PRIMARY KEY (id)
);

CREATE TABLE recipe (
                product_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                PRIMARY KEY (product_id, ingredient_id)
);

CREATE TABLE store (
                id INT GENERATED ALWAYS AS IDENTITY,
                name_store VARCHAR(100) NOT NULL,
                phone VARCHAR(10) NOT NULL,
                email VARCHAR(255) NOT NULL,
                PRIMARY KEY (id)
);

CREATE TABLE stock (
                ingredient_id INTEGER NOT NULL,
                store_id INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                PRIMARY KEY (ingredient_id, store_id)
);

CREATE TABLE adress (
                id INT GENERATED ALWAYS AS IDENTITY,
                num INTEGER NOT NULL,
                street VARCHAR(255) NOT NULL,
                post_code VARCHAR(5) NOT NULL,
                city VARCHAR(255) NOT NULL,
                PRIMARY KEY (id),
                CONSTRAINT fk_person
                FOREIGN KEY(person_id)
                REFERENCES person(person_id)
                ON DELETE SET NULL,
                CONSTRAINT fk_store
                FOREIGN KEY(store_id)
                REFERENCES store(store_id)
                ON DELETE SET NULL
);

CREATE TABLE person (
                id INT GENERATED ALWAYS AS IDENTITY,
                first_name VARCHAR(100) NOT NULL,
                last_name VARCHAR(255) NOT NULL,
                birth_date DATE NOT NULL,
                phone VARCHAR(10),
                PRIMARY KEY (id)
);

CREATE TABLE customer (
                id INT GENERATED ALWAYS AS IDENTITY,
                email VARCHAR(255) NOT NULL,
                password VARCHAR(255) NOT NULL,
                ordered_id INTEGER  NULL
)INHERITS (person);

CREATE TABLE payement (
                id serial NOT NULL,
                payement_date date,
                amount decimal(4,2),
                id_customer integer,
                CONSTRAINT payement_pk PRIMARY KEY (id)
                CONSTRAINT customer_fk
                FOREIGN KEY (id_customer)
                REFERENCES customer(customer_id)
                ON DELETE SET NULL

);

CREATE TABLE employee (
                id INT GENERATED ALWAYS AS IDENTITY,
                salary NUMERIC(8,2) NOT NULL,
                start_date DATE NOT NULL,
                end_date DATE NOT NULL,
                store_id INTEGER  NULL

)INHERITS (person);

CREATE TABLE founder (
                id INT GENERATED ALWAYS AS IDENTITY,
                post VARCHAR(255) NOT NULL
)INHERITS (employee);

CREATE TABLE deliver (
                id INT GENERATED ALWAYS AS IDENTITY,
                post VARCHAR(255) NOT NULL,
                ordered_id INTEGER NULL
)INHERITS (employee);

CREATE TABLE receptionist (
                id INT GENERATED ALWAYS AS IDENTITY,
                post VARCHAR(255) NOT NULL
)INHERITS (employee);

CREATE TABLE pizzaiolo (
                id INT GENERATED ALWAYS AS IDENTITY,
                post VARCHAR(255) NOT NULL
)INHERITS (employee);

CREATE TABLE ordered (
                id INT GENERATED ALWAYS AS IDENTITY,
                date_order DATE NOT NULL,
                employee_id INTEGER NOT NULL,
                PRIMARY KEY (id),
                CONSTRAINT fk_pizzaiolo
                FOREIGN KEY(employee_id)
                REFERENCES pizzaiolo(employee_id)
                ON DELETE SET NULL
);

CREATE TABLE ordered_detail (
                product_id INTEGER NOT NULL,
                ordered_id INTEGER NOT NULL,
                quantity INTEGER NOT NULL,
                price_TTC NUMERIC(6,2) NOT NULL,
                tax NUMERIC(2,2) NOT NULL,
                PRIMARY KEY (product_id, ordered_id)
);

CREATE TABLE order_on_line (
                id INT GENERATED ALWAYS AS IDENTITY,
                status VARCHAR(255) NOT NULL,
                adress_id INTEGER NOT NULL,
                CONSTRAINT fk_adress
                FOREIGN KEY(adress_id)
                REFERENCES adress(adress_id)
                ON DELETE SET NULL
)INHERITS (ordered);

CREATE TABLE order_take_away (
                id INT GENERATED ALWAYS AS IDENTITY,
                status VARCHAR(255) NOT NULL,
                employee_id INTEGER NOT NULL
)INHERITS (ordered);

CREATE TABLE order_click_collect (
                id INT GENERATED ALWAYS AS IDENTITY,
                status VARCHAR(255) NOT NULL,
                employee_id INTEGER NOT NULL
)INHERITS (ordered);



