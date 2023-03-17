/* Создание таблицы country */
CREATE TABLE IF NOT EXISTS hometask.country
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT country_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS hometask.country
    OWNER to postgres;

/* Создание таблицы person */
CREATE TABLE IF NOT EXISTS hometask.person
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    surname character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT person_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS hometask.person
    OWNER to postgres;

/* Создание таблицы genre */
CREATE TABLE IF NOT EXISTS hometask.genre
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT genre_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS hometask.genre
    OWNER to postgres;

/* Создание таблицы film */
CREATE TABLE IF NOT EXISTS hometask.film
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    year integer NOT NULL,
    rating double precision NOT NULL,
    country_id integer NOT NULL,
    slogan text COLLATE pg_catalog."default",
    screenwriter_id integer NOT NULL,
    director_id integer NOT NULL,
    producer_id integer NOT NULL,
    composer_id integer NOT NULL,
    operator_id integer NOT NULL,
    artist_id integer NOT NULL,
    editor_id integer NOT NULL,
    budget integer,
    marketing integer,
    us_fees integer,
    world_fees integer,
    russia_premiere timestamp without time zone,
    world_premiere timestamp without time zone,
    dvd_release timestamp without time zone,
    age integer NOT NULL,
    mpaa_ranking character varying(255) COLLATE pg_catalog."default" NOT NULL,
    duration integer NOT NULL,
    CONSTRAINT film_pkey PRIMARY KEY (id),
    CONSTRAINT artist_id FOREIGN KEY (artist_id)
        REFERENCES hometask.person (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT composer_fkey FOREIGN KEY (composer_id)
        REFERENCES hometask.person (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT country_fkey FOREIGN KEY (country_id)
        REFERENCES hometask.country (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT director_fkey FOREIGN KEY (director_id)
        REFERENCES hometask.person (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT editor_id FOREIGN KEY (editor_id)
        REFERENCES hometask.person (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT operator_fkey FOREIGN KEY (operator_id)
        REFERENCES hometask.person (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT producer_fkey FOREIGN KEY (producer_id)
        REFERENCES hometask.person (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT screenwriter_fkey FOREIGN KEY (screenwriter_id)
        REFERENCES hometask.person (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS hometask.film
    OWNER to postgres;

/* Создание таблицы film-audience */ 
CREATE TABLE IF NOT EXISTS hometask."film-audience"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    quantity integer NOT NULL,
    country_id integer NOT NULL,
    film_id integer NOT NULL,
    CONSTRAINT viewer_pkey PRIMARY KEY (id),
    CONSTRAINT country_fkey FOREIGN KEY (country_id)
        REFERENCES hometask.country (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT film_fkey FOREIGN KEY (film_id)
        REFERENCES hometask.film (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS hometask."film-audience"
    OWNER to postgres;

/* Создание таблицы film-genre */
CREATE TABLE IF NOT EXISTS hometask."film-genre"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    film_id integer NOT NULL,
    genre_id integer NOT NULL,
    CONSTRAINT "film-genre_pkey" PRIMARY KEY (id),
    CONSTRAINT film_fkey FOREIGN KEY (film_id)
        REFERENCES hometask.film (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT genre_fkey FOREIGN KEY (genre_id)
        REFERENCES hometask.genre (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS hometask."film-genre"
    OWNER to postgres;

/* Создание таблицы film-person */
CREATE TABLE IF NOT EXISTS hometask."film-person"
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    film_id integer NOT NULL,
    person_id integer NOT NULL,
    "isActor" boolean NOT NULL,
    CONSTRAINT "film-person_pkey" PRIMARY KEY (id),
    CONSTRAINT film_fkey FOREIGN KEY (film_id)
        REFERENCES hometask.film (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT person_fkey FOREIGN KEY (person_id)
        REFERENCES hometask.person (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS hometask."film-person"
    OWNER to postgres;