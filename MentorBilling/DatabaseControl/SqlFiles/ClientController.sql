ALTER DATABASE "MentorClientController" OWNER TO postgres;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
SET default_tablespace = '';

CREATE TABLE public.clienti
(
	id SERIAL PRIMARY KEY,
	denumire VARCHAR NOT NULL DEFAULT '',
	cod_fiscal VARCHAR NOT NULL DEFAULT '',
	cod_numeric_personal VARCHAR NOT NULL DEFAULT '',
	cod_client VARCHAR NOT NULL DEFAULT '' UNIQUE,
	activ BOOLEAN NOT NULL DEFAULT false,
	telefon VARCHAR NOT NULL DEFAULT '',
	mail VARCHAR NOT NULL DEFAULT '' UNIQUE,
	nume_utilizator VARCHAR NOT NULL DEFAULT '' UNIQUE,
	parola VARCHAR NOT NULL DEFAULT '',
	parola_autogenerata VARCHAR NOT NULL DEFAULT '',
	data_creere timestamp without time zone NOT NULL DEFAULT ('now'::text)::timestamp without time zone,
	UNIQUE(cod_fiscal,cod_numeric_personal)
);

ALTER TABLE public.clienti OWNER TO postgres;

COMMENT ON TABLE public.clienti IS 'Tabela va contine lista de clienti ai firmei Mentor';
COMMENT ON COLUMN public.clienti.cod_fiscal IS 'Codul Fiscal si Codul Numeric Personal se exclud unul pe celalalt';
COMMENT ON COLUMN public.clienti.mail IS 'Adresa de email e unica pentru clienti si este obligatorie spre deosebire de numarul de telefon';
COMMENT ON COLUMN public.clienti.nume_utilizator IS 'Numele de utilizator este unic';
COMMENT ON COLUMN public.clienti.parola_autogenerata IS 'Parola autogenerata va fi folosita pentru utilizatorii care si-au pierdut contul';
COMMENT ON COLUMN public.clienti.data_creere IS 'Data creerii utilizatorului. Va fi o perioada de gratie in care utilizatorul va putea lucra fara a se activa contul';

CREATE TABLE public.programe
(
	id SERIAL PRIMARY KEY,
    denumire VARCHAR NOT NULL DEFAULT '',
    descriere VARCHAR NOT NULL DEFAULT '',
    cod_program VARCHAR NOT NULL DEFAULT '' UNIQUE,
	activ BOOLEAN NOT NULL DEFAULT false
);

ALTER TABLE public.programe OWNER TO postgres;

COMMENT ON TABLE public.programe IS 'Tabela va contine lista de programe care sunt comercializate de firma Mentor';
COMMENT ON COLUMN public.programe.cod_program IS 'Codul unic atribuit fiecatui program de catre firma Mentor';

INSERT INTO public.programe(denumire,descriere,cod_program) VALUES('Mentor Billing', 'Program de facturare facut de Mentor Constanta','MB01');

CREATE TABLE public.versiuni
(
	id SERIAL PRIMARY KEY,
	data_versiune timestamp without time zone NOT NULL DEFAULT ('now'::text)::timestamp without time zone,
    versiune VARCHAR NOT NULL DEFAULT '',
    link_versiune VARCHAR NOT NULL DEFAULT '',
    text_modificari VARCHAR NOT NULL DEFAULT '',
    programe_id integer NOT NULL DEFAULT 0 REFERENCES public.programe (id),
    versiune_publica boolean NOT NULL DEFAULT false,
    cod_versiune VARCHAR NOT NULL DEFAULT '',
	UNIQUE(versiune,programe_id)
);

ALTER TABLE public.versiuni OWNER TO postgres;

COMMENT ON TABLE public.versiuni IS 'Tabela va contine toate versiunile aferente programelor firmei Mentor';
COMMENT ON COLUMN public.versiuni.cod_versiune IS 'Doar versiunile centrale vor avea un cod unic de versiune';
COMMENT ON COLUMN public.versiuni.versiune_publica IS 'Doar versiunile publice vor fi preluate de catre clientii Mentor';

CREATE TABLE public.clienti_versiuni
(
	id SERIAL PRIMARY KEY,
	clienti_id integer DEFAULT 0 NOT NULL REFERENCES public.clienti (id),
	veriuni_id integer DEFAULT 0 NOT NULL REFERENCES public.versiuni (id),
	data_versiune timestamp without time zone NOT NULL DEFAULT ('now'::text)::timestamp without time zone,
	activ BOOLEAN NOT NULL DEFAULT true
);

ALTER TABLE public.clienti_versiuni OWNER TO postgres;

COMMENT ON TABLE public.clienti_versiuni IS 'Tabela va contine toate actualizarile de programe la clienti';

CREATE TABLE public.licente
(
	id SERIAL PRIMARY KEY,
	clienti_versiuni_id integer DEFAULT 0 NOT NULL REFERENCES public.clienti_versiuni (id),
	data_actualizare timestamp without time zone NOT NULL DEFAULT ('now'::text)::timestamp without time zone,
	perioada integer DEFAULT 0 NOT NULL,
	cod_licenta VARCHAR NOT NULL DEFAULT '',
	activ BOOLEAN NOT NULL DEFAULT true
);

ALTER TABLE public.licente OWNER TO postgres;

COMMENT ON TABLE public.licente IS 'Tabela va contine licentele active ale programului pentru perioada de activitate';
COMMENT ON COLUMN public.licente.data_actualizare IS 'Coloana va contine ultima actualizare a licentei';
COMMENT ON COLUMN public.licente.perioada IS 'Coloana va contine perioada pe care a fost acordata licenta de la ultima actualizare';
COMMENT ON COLUMN public.licente.cod_licenta IS 'Coloana va contine codul unic al licente ce nu va fi unic pentru perioada de licentiere';