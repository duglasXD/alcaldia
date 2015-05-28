--
-- PostgreSQL database dump
--
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--
CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--
COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;

--
-- Estrutura de tabla 'af_activo'
--
DROP TABLE IF EXISTS af_activo CASCADE;
CREATE TABLE af_activo (
	cod_act character varying(25) NOT NULL,
	nom character varying(50),
	mar character varying(50),
	mod character varying(50),
	ser character varying(50),
	cos_adq double precision,
	fec_adq date,
	act boolean,
	cod_tfondo integer,
	ori character varying(10),
	fec_gar date,
	don character varying(25)
);

--
-- Creando datos de 'af_activo'
--
INSERT INTO af_activo VALUES('870901-022015-000000','Pizarra','PT','ZR','001','25','2015-04-19','t','2','comprado','2015-04-29',NULL);
INSERT INTO af_activo VALUES('870901-002015-000000','Labtop','gateway','M-68','6843','100','2015-04-19','t',NULL,'donado','2015-04-30','UES');
INSERT INTO af_activo VALUES('870901-002015-000001','Labtop','gateway','M-68','6843','100','2015-04-19','t',NULL,'donado','2015-04-30','UES');
INSERT INTO af_activo VALUES('870902-002015-000001','Sillas','Flex','SF','001','25','2015-04-01','t',NULL,'donado','2015-05-23','UES');
INSERT INTO af_activo VALUES('870902-002015-000000','Sillas','Flex','SFfs','001','25','2015-04-01','f',NULL,'donado','2015-05-23','UES');
--
-- Creando indices PrimaryKey de 'af_activo'
--
ALTER TABLE ONLY  af_activo  ADD CONSTRAINT  af_activo_pkey  PRIMARY KEY  (cod_act);
--

-- Creando indices Unique de 'af_activo'
--



--
-- Estrutura de secuencia af_depto_codigo_seq para la tabla 'af_depto'
--
DROP SEQUENCE IF EXISTS af_depto_codigo_seq CASCADE;
CREATE SEQUENCE af_depto_codigo_seq
    START WITH 14
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'af_depto'
--
DROP TABLE IF EXISTS af_depto CASCADE;
CREATE TABLE af_depto (
	cod integer NOT NULL DEFAULT nextval('af_depto_codigo_seq'::regclass),
	nom character varying(50)
);

ALTER SEQUENCE af_depto_codigo_seq OWNED BY af_depto.cod;

--
-- Creando datos de 'af_depto'
--
INSERT INTO af_depto VALUES('1','catastro');
INSERT INTO af_depto VALUES('2','registro familiar');
INSERT INTO af_depto VALUES('3','activo fijo');
INSERT INTO af_depto VALUES('4','Unidad de genero');
INSERT INTO af_depto VALUES('5','Tesoreria');
INSERT INTO af_depto VALUES('6','Despacho');
INSERT INTO af_depto VALUES('7','finanzas');
INSERT INTO af_depto VALUES('9','secretaria');
--
-- Creando indices PrimaryKey de 'af_depto'
--
ALTER TABLE ONLY  af_depto  ADD CONSTRAINT  af_depto_pkey  PRIMARY KEY  (cod);
--

-- Creando indices Unique de 'af_depto'
--



--
-- Estrutura de secuencia af_descargo_cod_des_seq para la tabla 'af_descargo'
--
DROP SEQUENCE IF EXISTS af_descargo_cod_des_seq CASCADE;
CREATE SEQUENCE af_descargo_cod_des_seq
    START WITH 15
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'af_descargo'
--
DROP TABLE IF EXISTS af_descargo CASCADE;
CREATE TABLE af_descargo (
	cod_des integer NOT NULL DEFAULT nextval('af_descargo_cod_des_seq'::regclass),
	des character varying(150),
	cod_act character varying(25),
	fec date
);

ALTER SEQUENCE af_descargo_cod_des_seq OWNED BY af_descargo.cod_des;

--
-- Creando datos de 'af_descargo'
--
INSERT INTO af_descargo VALUES('15','defectuosa','870902-002015-000000','2015-05-02');
--
-- Creando indices PrimaryKey de 'af_descargo'
--
ALTER TABLE ONLY  af_descargo  ADD CONSTRAINT  af_descargo_pkey  PRIMARY KEY  (cod_des);
--

-- Creando indices Unique de 'af_descargo'
--



--
-- Estrutura de secuencia af_empresa_cod_emp_seq para la tabla 'af_empresa'
--
DROP SEQUENCE IF EXISTS af_empresa_cod_emp_seq CASCADE;
CREATE SEQUENCE af_empresa_cod_emp_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'af_empresa'
--
DROP TABLE IF EXISTS af_empresa CASCADE;
CREATE TABLE af_empresa (
	cod_emp integer NOT NULL DEFAULT nextval('af_empresa_cod_emp_seq'::regclass),
	nom character varying(50),
	dir character varying(150),
	tel character varying(10),
	nit character varying(20)
);

ALTER SEQUENCE af_empresa_cod_emp_seq OWNED BY af_empresa.cod_emp;

--
-- Creando datos de 'af_empresa'
--
INSERT INTO af_empresa VALUES('1','risi','alla lejos','1111-1111','2222-222222-222-2');
INSERT INTO af_empresa VALUES('2','risi SA DE CV','EL MAS ALLA','3333-3333','4444-444444-444-4');
INSERT INTO af_empresa VALUES('3','LaGeo S.A. DE C.V','colonia Utila, #15 Santa Tecla','2345-7854','1101-120795-103-1');
INSERT INTO af_empresa VALUES('4','Ferrollaves','Barrio el calvario, #34 San Vicente','2340-1029','1101-090801-102-1');
--
-- Creando indices PrimaryKey de 'af_empresa'
--
ALTER TABLE ONLY  af_empresa  ADD CONSTRAINT  af_empresa_pkey  PRIMARY KEY  (cod_emp);
--

-- Creando indices Unique de 'af_empresa'
--



--
-- Estrutura de secuencia af_mantenimiento_cod_seq para la tabla 'af_mantenimiento'
--
DROP SEQUENCE IF EXISTS af_mantenimiento_cod_seq CASCADE;
CREATE SEQUENCE af_mantenimiento_cod_seq
    START WITH 14
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'af_mantenimiento'
--
DROP TABLE IF EXISTS af_mantenimiento CASCADE;
CREATE TABLE af_mantenimiento (
	cod_act character varying(25),
	des character varying(100),
	cos double precision,
	fec date,
	cod_man integer NOT NULL DEFAULT nextval('af_mantenimiento_cod_seq'::regclass),
	emp integer
);

ALTER SEQUENCE af_mantenimiento_cod_seq OWNED BY af_mantenimiento.cod_man;

--
-- Creando datos de 'af_mantenimiento'
--
--
-- Creando indices PrimaryKey de 'af_mantenimiento'
--
--

-- Creando indices Unique de 'af_mantenimiento'
--



--
-- Estrutura de secuencia af_tfondo_cod_tfondo_seq para la tabla 'af_tfondo'
--
DROP SEQUENCE IF EXISTS af_tfondo_cod_tfondo_seq CASCADE;
CREATE SEQUENCE af_tfondo_cod_tfondo_seq
    START WITH 7
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'af_tfondo'
--
DROP TABLE IF EXISTS af_tfondo CASCADE;
CREATE TABLE af_tfondo (
	cod_tfondo integer NOT NULL DEFAULT nextval('af_tfondo_cod_tfondo_seq'::regclass),
	nom character varying(50),
	des text
);

ALTER SEQUENCE af_tfondo_cod_tfondo_seq OWNED BY af_tfondo.cod_tfondo;

--
-- Creando datos de 'af_tfondo'
--
INSERT INTO af_tfondo VALUES('1','fomilenium','fondo proveniente de USA para la conservacion de la zona costera');
INSERT INTO af_tfondo VALUES('2','propio','Dinero propio de la alcaldia municipal');
INSERT INTO af_tfondo VALUES('3','fodes','mantenimiento de calles');
INSERT INTO af_tfondo VALUES('4','FPVM','fondo para la vida marina de cojutepeque');
INSERT INTO af_tfondo VALUES('5','FPCVN','fondo para la conservaci�n de la vida animal');
--
-- Creando indices PrimaryKey de 'af_tfondo'
--
ALTER TABLE ONLY  af_tfondo  ADD CONSTRAINT  af_tfondo_pkey  PRIMARY KEY  (cod_tfondo);
--

-- Creando indices Unique de 'af_tfondo'
--



--
-- Estrutura de secuencia af_traslados_cod_tra_seq para la tabla 'af_traslados'
--
DROP SEQUENCE IF EXISTS af_traslados_cod_tra_seq CASCADE;
CREATE SEQUENCE af_traslados_cod_tra_seq
    START WITH 63
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'af_traslados'
--
DROP TABLE IF EXISTS af_traslados CASCADE;
CREATE TABLE af_traslados (
	cod_tra integer NOT NULL DEFAULT nextval('af_traslados_cod_tra_seq'::regclass),
	cod_act character varying(25),
	fec date,
	des character varying(100),
	new_ubi integer
);

ALTER SEQUENCE af_traslados_cod_tra_seq OWNED BY af_traslados.cod_tra;

--
-- Creando datos de 'af_traslados'
--
INSERT INTO af_traslados VALUES('58','870901-022015-000000','2015-04-19','Nuevo activo, ubicado en la oficina de catastro','1');
INSERT INTO af_traslados VALUES('59','870901-002015-000000','2015-04-19','Nuevo activo, en las oficinas de catastro','1');
INSERT INTO af_traslados VALUES('60','870901-002015-000001','2015-04-19','Nuevo activo, en las oficinas de catastro','1');
INSERT INTO af_traslados VALUES('61','870901-002015-000001','2015-04-19','En oficina de activo fijo','3');
INSERT INTO af_traslados VALUES('62','870902-002015-000000','2015-04-01','Nuevo activo, en a oficina de registro familiar','2');
INSERT INTO af_traslados VALUES('63','870902-002015-000001','2015-04-01','Nuevo activo, en a oficina de registro familiar','2');
--
-- Creando indices PrimaryKey de 'af_traslados'
--
ALTER TABLE ONLY  af_traslados  ADD CONSTRAINT  af_traslados_pkey  PRIMARY KEY  (cod_tra);
--

-- Creando indices Unique de 'af_traslados'
--



--
-- Estrutura de tabla 'ca_cierre'
--
DROP TABLE IF EXISTS ca_cierre CASCADE;
CREATE TABLE ca_cierre (
	cod_neg integer,
	fec_cie date,
	mot_cie text
);

--
-- Creando datos de 'ca_cierre'
--
INSERT INTO ca_cierre VALUES('2','2015-03-19','por incendio');
--
-- Creando indices PrimaryKey de 'ca_cierre'
--
--

-- Creando indices Unique de 'ca_cierre'
--



--
-- Estrutura de tabla 'ca_enterrado'
--
DROP TABLE IF EXISTS ca_enterrado CASCADE;
CREATE TABLE ca_enterrado (
	cot_per integer,
	cod_tit integer,
	nom_fall character varying(80)
);

--
-- Creando datos de 'ca_enterrado'
--
--
-- Creando indices PrimaryKey de 'ca_enterrado'
--
--

-- Creando indices Unique de 'ca_enterrado'
--



--
-- Estrutura de tabla 'ca_inmueble'
--
DROP TABLE IF EXISTS ca_inmueble CASCADE;
CREATE TABLE ca_inmueble (
	cod_inm character varying(20) NOT NULL,
	cod_pro integer,
	zon_inm character varying(6),
	dir_inm text,
	med_inm double precision,
	lim_nor text,
	lim_sur text,
	lim_est text,
	lim_oes text
);

--
-- Creando datos de 'ca_inmueble'
--
INSERT INTO ca_inmueble VALUES('01291238-9123-12','7','Rural','C/San Francisco, 3 casas abajo de hermita','3','Calle principal','Terreno de Benito Lara Carcamo','Terreno municipal','Terreno de Jose Antonio Lainez');
--
-- Creando indices PrimaryKey de 'ca_inmueble'
--
ALTER TABLE ONLY  ca_inmueble  ADD CONSTRAINT  ca_inmueble_pkey  PRIMARY KEY  (cod_inm);
--

-- Creando indices Unique de 'ca_inmueble'
--



--
-- Estrutura de secuencia ca_negocio_cod_neg_seq para la tabla 'ca_negocio'
--
DROP SEQUENCE IF EXISTS ca_negocio_cod_neg_seq CASCADE;
CREATE SEQUENCE ca_negocio_cod_neg_seq
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'ca_negocio'
--
DROP TABLE IF EXISTS ca_negocio CASCADE;
CREATE TABLE ca_negocio (
	cod_neg integer NOT NULL DEFAULT nextval('ca_negocio_cod_neg_seq'::regclass),
	nom_neg text,
	rub_neg character varying(50),
	zon_neg character varying(6),
	dep character varying(12),
	mun character varying(30),
	dir_neg text,
	med_neg double precision,
	img_neg text,
	est_neg boolean,
	tip_con character(1),
	cod_con integer
);

ALTER SEQUENCE ca_negocio_cod_neg_seq OWNED BY ca_negocio.cod_neg;

--
-- Creando datos de 'ca_negocio'
--
INSERT INTO ca_negocio VALUES('1','Farmacia San Cristobal','Venta de farmacos','Urbana','Cuscatl�n','San Crist�bal','B� El Centro, a un costado de Alcaldia Municipal','5',NULL,'t','J','1');
INSERT INTO ca_negocio VALUES('2','Molino Ramos','Molinos','Rural','Cuscatl�n','San Crist�bal','Canton Santa Anita','3','2','f',' ','10');
--
-- Creando indices PrimaryKey de 'ca_negocio'
--
ALTER TABLE ONLY  ca_negocio  ADD CONSTRAINT  ca_negocio_pkey  PRIMARY KEY  (cod_neg);
--

-- Creando indices Unique de 'ca_negocio'
--



--
-- Estrutura de secuencia ca_perpetuidad_cod_tit_seq para la tabla 'ca_perpetuidad'
--
DROP SEQUENCE IF EXISTS ca_perpetuidad_cod_tit_seq CASCADE;
CREATE SEQUENCE ca_perpetuidad_cod_tit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'ca_perpetuidad'
--
DROP TABLE IF EXISTS ca_perpetuidad CASCADE;
CREATE TABLE ca_perpetuidad (
	cod_tit integer NOT NULL DEFAULT nextval('ca_perpetuidad_cod_tit_seq'::regclass),
	nom_cem character varying(50),
	sit_en text,
	zon_cem character varying(6),
	ancho double precision,
	largo double precision,
	lim_nor text,
	lim_sur text,
	lim_est text,
	lim_oes text,
	nic_aut integer,
	clase character varying(30),
	valor double precision,
	num_rec character varying(15),
	fec_rec date,
	cod_pro integer
);

ALTER SEQUENCE ca_perpetuidad_cod_tit_seq OWNED BY ca_perpetuidad.cod_tit;

--
-- Creando datos de 'ca_perpetuidad'
--
--
-- Creando indices PrimaryKey de 'ca_perpetuidad'
--
ALTER TABLE ONLY  ca_perpetuidad  ADD CONSTRAINT  ca_perpetuidad_pkey  PRIMARY KEY  (cod_tit);
--

-- Creando indices Unique de 'ca_perpetuidad'
--



--
-- Estrutura de secuencia ca_sociedad_idsoc_seq para la tabla 'ca_sociedad'
--
DROP SEQUENCE IF EXISTS ca_sociedad_idsoc_seq CASCADE;
CREATE SEQUENCE ca_sociedad_idsoc_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'ca_sociedad'
--
DROP TABLE IF EXISTS ca_sociedad CASCADE;
CREATE TABLE ca_sociedad (
	idsoc integer NOT NULL DEFAULT nextval('ca_sociedad_idsoc_seq'::regclass),
	nom_jur character varying(30),
	fec_cons date,
	gir_jur character varying(40),
	nit_jur character varying(20),
	tel_jur character varying(10),
	dir_jur text
);

ALTER SEQUENCE ca_sociedad_idsoc_seq OWNED BY ca_sociedad.idsoc;

--
-- Creando datos de 'ca_sociedad'
--
INSERT INTO ca_sociedad VALUES('1','Asociados S.A de C.V','2010-09-09','Farmacos','0705-090910-001-1','2326-2726','Col. Horizontes, a un costado de cementerio municipal de Cojutepeque');
--
-- Creando indices PrimaryKey de 'ca_sociedad'
--
ALTER TABLE ONLY  ca_sociedad  ADD CONSTRAINT  ca_sociedad_pkey  PRIMARY KEY  (idsoc);
--

-- Creando indices Unique de 'ca_sociedad'
--



--
-- Estrutura de tabla 'ca_traspaso'
--
DROP TABLE IF EXISTS ca_traspaso CASCADE;
CREATE TABLE ca_traspaso (
	cod_neg integer,
	cod_pan integer,
	cod_pnu integer,
	fec_tra date
);

--
-- Creando datos de 'ca_traspaso'
--
INSERT INTO ca_traspaso VALUES('2','2','10','2015-03-19');
--
-- Creando indices PrimaryKey de 'ca_traspaso'
--
--

-- Creando indices Unique de 'ca_traspaso'
--



--
-- Estrutura de tabla 'co_condonado'
--
DROP TABLE IF EXISTS co_condonado CASCADE;
CREATE TABLE co_condonado (
	codigo character varying(5),
	fec_ini date,
	fec_fin date,
	num_acu character varying(25)
);

--
-- Creando datos de 'co_condonado'
--
--
-- Creando indices PrimaryKey de 'co_condonado'
--
--

-- Creando indices Unique de 'co_condonado'
--



--
-- Estrutura de tabla 'co_impuesto'
--
DROP TABLE IF EXISTS co_impuesto CASCADE;
CREATE TABLE co_impuesto (
	codigo character varying(5) NOT NULL,
	nom_cue text,
	des_cue text,
	tip_cob character varying(10),
	cob_por double precision,
	cob_min double precision,
	cob_max double precision
);

--
-- Creando datos de 'co_impuesto'
--
--
-- Creando indices PrimaryKey de 'co_impuesto'
--
ALTER TABLE ONLY  co_impuesto  ADD CONSTRAINT  co_impuesto_pkey  PRIMARY KEY  (codigo);
--

-- Creando indices Unique de 'co_impuesto'
--



--
-- Estrutura de tabla 'co_neginm_imp'
--
DROP TABLE IF EXISTS co_neginm_imp CASCADE;
CREATE TABLE co_neginm_imp (
	cod_neginm character varying(20),
	cod_imp character varying(5)
);

--
-- Creando datos de 'co_neginm_imp'
--
--
-- Creando indices PrimaryKey de 'co_neginm_imp'
--
--

-- Creando indices Unique de 'co_neginm_imp'
--



--
-- Estrutura de secuencia co_notificacion_id_not_seq para la tabla 'co_notificacion'
--
DROP SEQUENCE IF EXISTS co_notificacion_id_not_seq CASCADE;
CREATE SEQUENCE co_notificacion_id_not_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'co_notificacion'
--
DROP TABLE IF EXISTS co_notificacion CASCADE;
CREATE TABLE co_notificacion (
	id_not integer NOT NULL DEFAULT nextval('co_notificacion_id_not_seq'::regclass),
	mensaje text,
	fec_hor timestamp,
	status boolean
);

ALTER SEQUENCE co_notificacion_id_not_seq OWNED BY co_notificacion.id_not;

--
-- Creando datos de 'co_notificacion'
--
--
-- Creando indices PrimaryKey de 'co_notificacion'
--
ALTER TABLE ONLY  co_notificacion  ADD CONSTRAINT  co_notificacion_pkey  PRIMARY KEY  (id_not);
--

-- Creando indices Unique de 'co_notificacion'
--



--
-- Estrutura de tabla 'funcionario'
--
DROP TABLE IF EXISTS funcionario CASCADE;
CREATE TABLE funcionario (
	cod_fun character varying(5) NOT NULL,
	nom character varying(70),
	cargo character varying(40),
	per character varying(12)
);

--
-- Creando datos de 'funcionario'
--
--
-- Creando indices PrimaryKey de 'funcionario'
--
ALTER TABLE ONLY  funcionario  ADD CONSTRAINT  funcionario_pkey  PRIMARY KEY  (cod_fun);
--

-- Creando indices Unique de 'funcionario'
--



--
-- Estrutura de secuencia prueba_codigo_seq para la tabla 'prueba'
--
DROP SEQUENCE IF EXISTS prueba_codigo_seq CASCADE;
CREATE SEQUENCE prueba_codigo_seq
    START WITH 36
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'prueba'
--
DROP TABLE IF EXISTS prueba CASCADE;
CREATE TABLE prueba (
	codigo bigint NOT NULL DEFAULT nextval('prueba_codigo_seq'::regclass),
	nombre text
);

ALTER SEQUENCE prueba_codigo_seq OWNED BY prueba.codigo;

--
-- Creando datos de 'prueba'
--
INSERT INTO prueba VALUES('1','hola mono');
INSERT INTO prueba VALUES('2','hola mono aqui');
INSERT INTO prueba VALUES('3','hola mono ettoooo');
INSERT INTO prueba VALUES('4','hola mono aqui');
INSERT INTO prueba VALUES('5','hola mono aqui');
INSERT INTO prueba VALUES('6','hola mono aqui');
INSERT INTO prueba VALUES('7','hola mono aqui');
INSERT INTO prueba VALUES('8','hola mono aqui');
INSERT INTO prueba VALUES('9','hola mono aqui');
INSERT INTO prueba VALUES('10','hola mono aqui');
INSERT INTO prueba VALUES('11','hola mono aqui');
INSERT INTO prueba VALUES('12','hola mono aqui');
INSERT INTO prueba VALUES('13','hola mono aqui');
INSERT INTO prueba VALUES('14','hola mono aqui');
INSERT INTO prueba VALUES('15','hola mono aqui');
INSERT INTO prueba VALUES('16','hola mono aqui');
INSERT INTO prueba VALUES('17','hola mono aqui');
INSERT INTO prueba VALUES('18','hola mono aqui');
INSERT INTO prueba VALUES('19','hola mono aqui');
INSERT INTO prueba VALUES('20','hola mono aqui');
INSERT INTO prueba VALUES('21','hola mono aqui');
INSERT INTO prueba VALUES('22','hola mono aqui');
INSERT INTO prueba VALUES('23','hola mono aqui');
INSERT INTO prueba VALUES('24','hola mono aqui');
INSERT INTO prueba VALUES('25','hola mono aqui');
INSERT INTO prueba VALUES('26','hola mono aqui');
INSERT INTO prueba VALUES('27','hola mono aqui');
INSERT INTO prueba VALUES('28','hola mono aqui');
INSERT INTO prueba VALUES('29','hola mono aqui');
INSERT INTO prueba VALUES('30','hola mono aqui');
INSERT INTO prueba VALUES('31','hola mono aqui');
INSERT INTO prueba VALUES('32','hola mono aqui');
INSERT INTO prueba VALUES('33','hola mono aqui');
INSERT INTO prueba VALUES('34','hola mono aqui');
INSERT INTO prueba VALUES('35','hola mono ettoooo');
INSERT INTO prueba VALUES('36','hola mono ettoooo');
--
-- Creando indices PrimaryKey de 'prueba'
--
--

-- Creando indices Unique de 'prueba'
--



--
-- Estrutura de tabla 'rf_defuncion_digestyc'
--
DROP TABLE IF EXISTS rf_defuncion_digestyc CASCADE;
CREATE TABLE rf_defuncion_digestyc (
	num_lib integer,
	num_par integer,
	jub_pen character varying(10),
	are character(1),
	otr_est character varying(50),
	fal_emb character varying(50),
	mue_acc character varying(10),
	cer_med boolean,
	cer_for boolean,
	nom_reg text
);

--
-- Creando datos de 'rf_defuncion_digestyc'
--
--
-- Creando indices PrimaryKey de 'rf_defuncion_digestyc'
--
--

-- Creando indices Unique de 'rf_defuncion_digestyc'
--
ALTER TABLE ONLY rf_defuncion_digestyc ADD CONSTRAINT rf_defuncion_digestyc_num_lib_num_par_key UNIQUE (num_lib,num_par);


--
-- Estrutura de tabla 'rf_defuncion_digestyc2'
--
DROP TABLE IF EXISTS rf_defuncion_digestyc2 CASCADE;
CREATE TABLE rf_defuncion_digestyc2 (
	num_lib integer,
	num_par integer,
	hor_min time without time zone,
	dia integer,
	mes integer,
	mad_cas character varying(7),
	tip_par character varying(7),
	eda_mad integer,
	dur_emb character varying(20),
	sem_ges integer
);

--
-- Creando datos de 'rf_defuncion_digestyc2'
--
--
-- Creando indices PrimaryKey de 'rf_defuncion_digestyc2'
--
--

-- Creando indices Unique de 'rf_defuncion_digestyc2'
--
ALTER TABLE ONLY rf_defuncion_digestyc2 ADD CONSTRAINT rf_defuncion_digestyc2_num_lib_num_par_key UNIQUE (num_lib,num_par);


--
-- Estrutura de tabla 'rf_defuncion_digestyc3'
--
DROP TABLE IF EXISTS rf_defuncion_digestyc3 CASCADE;
CREATE TABLE rf_defuncion_digestyc3 (
	num_lib integer,
	num_par integer,
	pes integer,
	tal integer,
	lug_nac character varying(20),
	num_emb integer,
	num_abo integer,
	num_nac_mue integer
);

--
-- Creando datos de 'rf_defuncion_digestyc3'
--
--
-- Creando indices PrimaryKey de 'rf_defuncion_digestyc3'
--
--

-- Creando indices Unique de 'rf_defuncion_digestyc3'
--



--
-- Estrutura de tabla 'rf_defuncion_partida'
--
DROP TABLE IF EXISTS rf_defuncion_partida CASCADE;
CREATE TABLE rf_defuncion_partida (
	ano_lib integer,
	num_lib integer,
	num_tom integer,
	num_pag integer,
	num_par integer,
	cod_per integer,
	nom character varying(30),
	ape1 character varying(20),
	ape2 character varying(20),
	sex character(1),
	eda integer,
	est_fam character varying(15),
	nom_con character varying(70),
	ocu character varying(50),
	dep_org character varying(12),
	mun_org character varying(50),
	dep_res character varying(12),
	mun_res character varying(50),
	canlug_res character varying(50),
	jur character varying(50),
	nac character varying(25),
	dui character varying(10),
	dep_def character varying(12),
	mun_def character varying(50),
	canlug_def character varying(50),
	loc_def character varying(50),
	fec_def date,
	hor_min time without time zone,
	asi_med boolean,
	cau_def text,
	nom_pro character varying(100),
	car_pro character varying(50),
	jvpm character varying(20),
	nom_mad character varying(70),
	nom_pad character varying(70),
	cem character varying(100),
	inf character varying(100),
	dui_inf character varying(10),
	par_inf character varying(50),
	nom_tes1 character varying(70),
	dui_tes1 character varying(10),
	nom_tes2 character varying(70),
	dui_tes2 character varying(10),
	fec_reg date,
	enm character varying(50),
	esc_lib character varying(70)
);

--
-- Creando datos de 'rf_defuncion_partida'
--
--
-- Creando indices PrimaryKey de 'rf_defuncion_partida'
--
--

-- Creando indices Unique de 'rf_defuncion_partida'
--
ALTER TABLE ONLY rf_defuncion_partida ADD CONSTRAINT rf_defuncion_partida_num_lib_num_par_key UNIQUE (num_lib,num_par);


--
-- Estrutura de tabla 'rf_divorcio_digestyc'
--
DROP TABLE IF EXISTS rf_divorcio_digestyc CASCADE;
CREATE TABLE rf_divorcio_digestyc (
	num_lib integer,
	num_par integer,
	dep_div character varying(12),
	mun_div character varying(50),
	fec_fal date,
	nom_eso character varying(70),
	eda_eso integer,
	alf_eso character(1),
	ocu_eso character varying(50),
	dep_res_eso character varying(12),
	mun_res_eso character varying(50),
	can_res_eso character varying(50),
	are_res_eso character(1),
	nom_esa character varying(70),
	eda_esa integer,
	alf_esa character(1),
	ocu_esa character varying(50),
	dep_res_esa character varying(12),
	mun_res_esa character varying(50),
	can_res_esa character varying(50),
	are_res_esa character(1),
	cau_div text,
	fec_mat date,
	num_hij integer,
	fec_reg date,
	obs text,
	nom_reg text
);

--
-- Creando datos de 'rf_divorcio_digestyc'
--
--
-- Creando indices PrimaryKey de 'rf_divorcio_digestyc'
--
--

-- Creando indices Unique de 'rf_divorcio_digestyc'
--
ALTER TABLE ONLY rf_divorcio_digestyc ADD CONSTRAINT rf_divorcio_digestyc_num_lib_num_par_key UNIQUE (num_lib,num_par);


--
-- Estrutura de tabla 'rf_divorcio_partida'
--
DROP TABLE IF EXISTS rf_divorcio_partida CASCADE;
CREATE TABLE rf_divorcio_partida (
	ano_lib integer,
	num_lib integer,
	num_tom integer,
	num_pag integer,
	num_par integer,
	cod_eso integer,
	cod_esa integer,
	fec_div date,
	cue text,
	esc_lib character varying(100)
);

--
-- Creando datos de 'rf_divorcio_partida'
--
--
-- Creando indices PrimaryKey de 'rf_divorcio_partida'
--
--

-- Creando indices Unique de 'rf_divorcio_partida'
--
ALTER TABLE ONLY rf_divorcio_partida ADD CONSTRAINT rf_divorcio_partida_num_lib_num_par_key UNIQUE (num_lib,num_par);


--
-- Estrutura de tabla 'rf_matrimonio_digestyc'
--
DROP TABLE IF EXISTS rf_matrimonio_digestyc CASCADE;
CREATE TABLE rf_matrimonio_digestyc (
	num_lib integer,
	num_par integer,
	dep_mat character varying(12),
	mun_mat character varying(50),
	eda_eso integer,
	dep_eso character varying(12),
	mun_eso character varying(50),
	can_eso character varying(50),
	zon_eso character varying(6),
	est_civ_eso character varying(15),
	alf_eso character varying(30),
	ocu_eso character varying(50),
	eda_esa integer,
	dep_esa character varying(12),
	mun_esa character varying(50),
	can_esa character varying(50),
	zon_esa character varying(6),
	est_civ_esa character varying(15),
	alf_esa character varying(30),
	ocu_esa character varying(50),
	fec_reg date,
	nom_reg character varying(70),
	obs text
);

--
-- Creando datos de 'rf_matrimonio_digestyc'
--
--
-- Creando indices PrimaryKey de 'rf_matrimonio_digestyc'
--
--

-- Creando indices Unique de 'rf_matrimonio_digestyc'
--
ALTER TABLE ONLY rf_matrimonio_digestyc ADD CONSTRAINT rf_matrimonio_digestyc_num_lib_num_par_key UNIQUE (num_lib,num_par);


--
-- Estrutura de tabla 'rf_matrimonio_partida'
--
DROP TABLE IF EXISTS rf_matrimonio_partida CASCADE;
CREATE TABLE rf_matrimonio_partida (
	ano_lib integer,
	num_lib integer,
	num_tom integer,
	num_pag integer,
	num_par integer,
	cod_eso integer,
	cod_esa integer,
	fec_mat date,
	cue text,
	esc_lib character varying(100)
);

--
-- Creando datos de 'rf_matrimonio_partida'
--
--
-- Creando indices PrimaryKey de 'rf_matrimonio_partida'
--
--

-- Creando indices Unique de 'rf_matrimonio_partida'
--
ALTER TABLE ONLY rf_matrimonio_partida ADD CONSTRAINT rf_matrimonio_partida_num_lib_num_par_key UNIQUE (num_lib,num_par);


--
-- Estrutura de tabla 'rf_nacimiento_digestyc'
--
DROP TABLE IF EXISTS rf_nacimiento_digestyc CASCADE;
CREATE TABLE rf_nacimiento_digestyc (
	num_lib integer,
	num_par integer,
	loc_nac character varying(30),
	det_loc_nac character varying(30),
	fec_nac date,
	hor_nac time without time zone,
	dep_nac character varying(12),
	mun_nac character varying(40),
	can_nac character varying(40),
	sex character(1),
	pes_nac integer,
	tal integer,
	cla_par character varying(15),
	tip_par character varying(7),
	eda_mad integer,
	nom_asi character varying(70),
	car_asi character varying(9),
	dur_emb integer,
	est_fam character varying(15),
	alf_mad character varying(8),
	ocu_mad character varying(50),
	dep_res_mad character varying(12),
	mun_res_mad character varying(40),
	can_res character varying(40),
	are_res character varying(6),
	dep_nac_mad character varying(12),
	mun_nac_mad character varying(40),
	nac_mad character varying(30),
	hij_nac_viv integer,
	hij_mue integer,
	hij_nac_mue integer,
	eda_pad integer,
	alf_pad character varying(8),
	ocu_pad character varying(50),
	dep_nac_pad character varying(12),
	mun_nac_pad character varying(40),
	nac_pad character varying(30),
	nom_inf character varying(70),
	par_inf character varying(25),
	dui_inf character varying(10),
	fec_reg date,
	nom_jef character varying(70)
);

--
-- Creando datos de 'rf_nacimiento_digestyc'
--
--
-- Creando indices PrimaryKey de 'rf_nacimiento_digestyc'
--
--

-- Creando indices Unique de 'rf_nacimiento_digestyc'
--
ALTER TABLE ONLY rf_nacimiento_digestyc ADD CONSTRAINT rf_nacimiento_digestyc_num_lib_num_par_key UNIQUE (num_lib,num_par);


--
-- Estrutura de tabla 'rf_nacimiento_partida'
--
DROP TABLE IF EXISTS rf_nacimiento_partida CASCADE;
CREATE TABLE rf_nacimiento_partida (
	num_lib integer,
	ano_lib integer,
	num_pag integer,
	num_par integer,
	nom character varying(30),
	sex character(1),
	lug_nac character varying(100),
	dep_nac character varying(12),
	mun_nac character varying(30),
	fec_nac date,
	hor_min time without time zone,
	nom_mad character varying(30),
	ape1_mad character varying(20),
	ape2_mad character varying(20),
	eda_mad integer,
	ocu_mad character varying(40),
	dep_ori_mad character varying(12),
	mun_ori_mad character varying(30),
	dep_res_mad character varying(12),
	mun_res_mad character varying(30),
	nac_mad character varying(25),
	doc_mad character varying(25),
	num_doc_mad character varying(10),
	nom_pad character varying(30),
	ape1_pad character varying(20),
	ape2_pad character varying(20),
	eda_pad integer,
	ocu_pad character varying(40),
	dep_ori_pad character varying(12),
	mun_ori_pad character varying(30),
	dep_res_pad character varying(12),
	mun_res_pad character varying(30),
	nac_pad character varying(25),
	doc_pad character varying(25),
	num_doc_pad character varying(10),
	nom_inf character varying(30),
	ape1_inf character varying(20),
	ape2_inf character varying(20),
	doc_inf character varying(25),
	num_doc_inf character varying(10),
	par_inf character varying(25),
	nom_tes1 character varying(30),
	ape1_tes1 character varying(20),
	ape2_tes1 character varying(20),
	doc_tes1 character varying(25),
	num_doc_tes1 character varying(10),
	nom_tes2 character varying(30),
	ape1_tes2 character varying(20),
	ape2_tes2 character varying(20),
	doc_tes2 character varying(25),
	num_doc_tes2 character varying(10),
	nom_reg character varying(30),
	fec date,
	cue text,
	esc_lib character varying(100),
	cod_per integer,
	cod_mad integer,
	cod_pad integer,
	cod_inf integer,
	cod_tes1 integer,
	cod_tes2 integer
);

--
-- Creando datos de 'rf_nacimiento_partida'
--
INSERT INTO rf_nacimiento_partida VALUES('104','2015','12','12','Helen Alicia','F','Hospital Nacional Nuestra Se�ora de F�tima','Cuscatl�n','Cojutepeque','2015-02-12','00:23:00','Madelin Melissa','Rivera','Argueta','23','Estudiante','Cuscatl�n','San Crist�bal','Cuscatl�n','San Crist�bal','Salvadore�a','DUI','03427945-7','Franklin Antonio','Ramos','Rodr�guez','25','Estudiante','Cuscatl�n','San Crist�bal','Cuscatl�n','San Crist�bal','Salvadore�o','DUI','04223023-5','Franklin Antonio','Ramos','Rodr�guez','DUI','04223023-5','Padre',NULL,NULL,NULL,'DUI',NULL,NULL,NULL,NULL,'DUI',NULL,NULL,'2015-03-12',NULL,NULL,'4','3','2','2',NULL,NULL);
--
-- Creando indices PrimaryKey de 'rf_nacimiento_partida'
--
--

-- Creando indices Unique de 'rf_nacimiento_partida'
--
ALTER TABLE ONLY rf_nacimiento_partida ADD CONSTRAINT rf_nacimiento_partida_num_lib_num_par_key UNIQUE (num_lib,num_par);


--
-- Estrutura de secuencia rf_persona_cod_per_seq para la tabla 'rf_persona'
--
DROP SEQUENCE IF EXISTS rf_persona_cod_per_seq CASCADE;
CREATE SEQUENCE rf_persona_cod_per_seq
    START WITH 11
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'rf_persona'
--
DROP TABLE IF EXISTS rf_persona CASCADE;
CREATE TABLE rf_persona (
	cod_per integer NOT NULL DEFAULT nextval('rf_persona_cod_per_seq'::regclass),
	nom character varying(30),
	ape1 character varying(20),
	ape2 character varying(20),
	sex character(1),
	fec_nac date,
	dui character varying(10),
	nit character varying(20),
	tel1 character varying(10),
	tel2 character varying(10),
	dep character varying(12),
	mun character varying(30),
	dir text,
	ocu character varying(40),
	est_civ character varying(10)
);

ALTER SEQUENCE rf_persona_cod_per_seq OWNED BY rf_persona.cod_per;

--
-- Creando datos de 'rf_persona'
--
INSERT INTO rf_persona VALUES('1','Angel Alberto','Hernandez','Vasquez','M','1989-09-25','04232324-4','0421-250989-101-1','7933-3980',NULL,'Cuscatl�n','Monte San Juan','C/Concepcion Sector 2, una cuadra abajo de chorro municipal','Estudiante','Soltero');
INSERT INTO rf_persona VALUES('2','Franklin Antonio','Ramos','Rodríguez','M','1989-11-09','04223023-5','1013-091189-101-7','72286513','79026454','San Vicente','Verapaz','San Isidro','Estudiante','Soltero');
INSERT INTO rf_persona VALUES('4','Helen Alicia','Ramos','Rivera','F','2015-02-12',NULL,NULL,NULL,NULL,'Cuscatl�n','Cojutepeque',NULL,NULL,NULL);
INSERT INTO rf_persona VALUES('5','Lazaro Efrain','Ramos','Rodr�guez','M','1987-05-20','32323123-2','1013-200587-101-5','7333-6665','2333-6665','Cuscatl�n','San Crist�bal','Canton Santa Anita','Agricultor','Casado');
INSERT INTO rf_persona VALUES('6','Marina Elizabeth','Lopez','Zepeda','F','1989-08-15','42231232-1','1013-150889-101-4','7636-7222','2432-1123','Cuscatl�n','San Crist�bal','San Francisco','Oficios domesticos','Casada');
INSERT INTO rf_persona VALUES('7','Dora Alicia','Ramos','Rodr�guez','F','1960-07-11','04738927-8','1013-110760-101-3','7432-3432','7234-2343','Cuscatl�n','San Crist�bal','San Francisco','Oficios domesticos','Casada');
INSERT INTO rf_persona VALUES('8','Lazaro Albino','Ramos','Constanza','M','1953-12-17','03232424-2','1013-171253-101-5','7142-3232','6082-3823','Cuscatl�n','San Crist�bal','Cant�n Santa Anita','Jornalero','Casado');
INSERT INTO rf_persona VALUES('9','Marlene Elizabeth','Pereira','Aragon','F','1985-08-12','02169075-5','0702-120885-002-1','6769-0225',NULL,'Cuscatl�n','San Crist�bal','Cant�n Santa Anita, 2 casas al norte de chorro municipal',NULL,NULL);
INSERT INTO rf_persona VALUES('10','Rosa Beatriz','Perez','Fabian','F','1988-06-24','03242552-2','0706-240688-100-8','7789-0912','7009-2121','Cuscatl�n','San Crist�bal','Cant�n Santa Anita, frente a la parada La Ceiba',NULL,NULL);
INSERT INTO rf_persona VALUES('11','Janeth Elizabeth','Perez','Barahona','F','1983-09-14','03012312-3','0905-140983-024-2','7683-2112',NULL,'Cuscatl�n','Cojutepeque','Rpto Las Alamedas pasaje 3 casa #25','Vendedora','Casada');
INSERT INTO rf_persona VALUES('3','Madelin Melissa','Rivera','Argueta','F','1992-01-30','03427945-7','1013-300192-101-7','73763587','23879054','San Vicente','San Crist�bal','Santa Teresa','Estudiante','Divorciada');
--
-- Creando indices PrimaryKey de 'rf_persona'
--
ALTER TABLE ONLY  rf_persona  ADD CONSTRAINT  rf_persona_pkey  PRIMARY KEY  (cod_per);
--

-- Creando indices Unique de 'rf_persona'
--



--
-- Estrutura de secuencia se_bitacora_cod_seq para la tabla 'se_bitacora'
--
DROP SEQUENCE IF EXISTS se_bitacora_cod_seq CASCADE;
CREATE SEQUENCE se_bitacora_cod_seq
    START WITH 23
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'se_bitacora'
--
DROP TABLE IF EXISTS se_bitacora CASCADE;
CREATE TABLE se_bitacora (
	cod bigint NOT NULL DEFAULT nextval('se_bitacora_cod_seq'::regclass),
	accion character varying(200) NOT NULL,
	id_usuario integer NOT NULL,
	fecha date NOT NULL,
	hora time without time zone NOT NULL
);

ALTER SEQUENCE se_bitacora_cod_seq OWNED BY se_bitacora.cod;

--
-- Creando datos de 'se_bitacora'
--
INSERT INTO se_bitacora VALUES('1','Ingreso un nuevo usuario.','3','2015-04-29','21:02:51.792');
INSERT INTO se_bitacora VALUES('2','Ingreso un nuevo usuario.','3','2015-04-29','21:30:29.012');
INSERT INTO se_bitacora VALUES('3','Ingreso un nuevo usuario.','3','2015-04-29','21:35:48.803');
INSERT INTO se_bitacora VALUES('4','Actualizo un nuevo usuario (Josue Alexander).','3','2015-04-29','21:40:00.913');
INSERT INTO se_bitacora VALUES('5','Ingreso un nuevo usuario.','3','2015-04-29','22:01:59.962');
INSERT INTO se_bitacora VALUES('6','Ingreso 2 Activos(Sillas).','2','2015-04-29','22:25:23.91');
INSERT INTO se_bitacora VALUES('7','Actualizo un activo (Sillas).','2','2015-04-29','22:46:34.871');
INSERT INTO se_bitacora VALUES('8','Actualizo un nuevo usuario (alber).','3','2015-04-30','08:36:46.261');
INSERT INTO se_bitacora VALUES('9','Actualizo un nuevo usuario (alex).','3','2015-04-30','08:37:29.323');
INSERT INTO se_bitacora VALUES('10','Actualizo un nuevo usuario (jose).','3','2015-04-30','08:38:03.865');
INSERT INTO se_bitacora VALUES('11','Dio de baja un Activo (Sillas).','2','2015-05-02','17:27:39.35');
INSERT INTO se_bitacora VALUES('12','Ingreso un nuevo usuario (ciudsiub).','3','2015-05-17','14:28:00.978');
INSERT INTO se_bitacora VALUES('13','Ingreso un nuevo usuario (hola).','3','2015-05-17','14:30:14.067');
INSERT INTO se_bitacora VALUES('14','Actualizo un nuevo usuario (alber).','3','2015-05-17','14:57:05.974');
INSERT INTO se_bitacora VALUES('15','Actualizo un nuevo usuario (alber).','3','2015-05-17','14:57:21.929');
INSERT INTO se_bitacora VALUES('16','Actualizo un nuevo usuario (alber).','3','2015-05-17','14:58:24.559');
INSERT INTO se_bitacora VALUES('17','Actualizo un nuevo usuario (alber).','3','2015-05-17','15:01:24.822');
INSERT INTO se_bitacora VALUES('18','dio de alta un usuario (yesenia).','3','2015-05-19','23:30:15.315');
INSERT INTO se_bitacora VALUES('19','dio de alta un usuario (tavo).','3','2015-05-19','23:30:52.098');
INSERT INTO se_bitacora VALUES('20','dio de alta un usuario (tavo).','3','2015-05-19','23:31:57.217');
INSERT INTO se_bitacora VALUES('21','dio de alta un usuario (tavo).','3','2015-05-19','23:32:47.228');
INSERT INTO se_bitacora VALUES('22','dio de baja un usuario (tavo).','3','2015-05-19','23:34:32.231');
INSERT INTO se_bitacora VALUES('23','dio de alta un usuario (tavo).','3','2015-05-19','23:34:53.351');
--
-- Creando indices PrimaryKey de 'se_bitacora'
--
ALTER TABLE ONLY  se_bitacora  ADD CONSTRAINT  pk_bitacora  PRIMARY KEY  (cod);
--

-- Creando indices Unique de 'se_bitacora'
--



--
-- Estrutura de secuencia se_usuario_id_seq para la tabla 'se_usuario'
--
DROP SEQUENCE IF EXISTS se_usuario_id_seq CASCADE;
CREATE SEQUENCE se_usuario_id_seq
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'se_usuario'
--
DROP TABLE IF EXISTS se_usuario CASCADE;
CREATE TABLE se_usuario (
	id integer NOT NULL DEFAULT nextval('se_usuario_id_seq'::regclass),
	nom character varying(100),
	mail character varying(100),
	usu character varying(25),
	contra character(40),
	niv character varying(13),
	act boolean
);

ALTER SEQUENCE se_usuario_id_seq OWNED BY se_usuario.id;

--
-- Creando datos de 'se_usuario'
--
INSERT INTO se_usuario VALUES('5','franklin','franklin@hotmail.com','franklin','c7d8a7fe2dedfc465d95d0d591190343a1dcce1f','2','t');
INSERT INTO se_usuario VALUES('6','andrea','andrea@hotmail.com','andrea','eb7943c52b84042c0b80a0221845886e08bb21c1','5','t');
INSERT INTO se_usuario VALUES('17','Josue Alexander Martir Perez','alex@hotmail.com','alex','8fcf9c8b5eb1735b0679f0eece10ad1936f1f46c','3','t');
INSERT INTO se_usuario VALUES('3','Jose Duglas Morales Pichinte','jose@hotmail.com','jose','5127fd27e409e65c51209b023693ec118ef61fd8','6','t');
INSERT INTO se_usuario VALUES('2','Angel Alberto Hernandez Vasquez','alber@hotmail.com','alber','6e2b3701dc7161af6844b8a15085598b20d92b7f','4','t');
INSERT INTO se_usuario VALUES('18','Yesenia Ariana Grande','yesenia@hotmail.com','yesenia','a1363e83f22329ce2ed879c9260380e8bd0a5103','3','t');
INSERT INTO se_usuario VALUES('1','Gustavo Alejandro Angel','gangel@lageo.com.sv','tavo','ad44c045f149f56e05945f78b9401d81fe5ae2cc','1','t');
--
-- Creando indices PrimaryKey de 'se_usuario'
--
ALTER TABLE ONLY  se_usuario  ADD CONSTRAINT  pk_se_usuario  PRIMARY KEY  (id);
--

-- Creando indices Unique de 'se_usuario'
--
ALTER TABLE ONLY se_usuario ADD CONSTRAINT se_usuario_usuario_key UNIQUE (usu);


--
-- Estrutura de tabla 'um_ben_proy'
--
DROP TABLE IF EXISTS um_ben_proy CASCADE;
CREATE TABLE um_ben_proy (
	cod_per integer,
	cod_pro character varying(10)
);

--
-- Creando datos de 'um_ben_proy'
--
--
-- Creando indices PrimaryKey de 'um_ben_proy'
--
--

-- Creando indices Unique de 'um_ben_proy'
--



--
-- Estrutura de tabla 'um_exp_padres'
--
DROP TABLE IF EXISTS um_exp_padres CASCADE;
CREATE TABLE um_exp_padres (
	cod_mad integer,
	cod_pad integer,
	cod_exp integer
);

--
-- Creando datos de 'um_exp_padres'
--
--
-- Creando indices PrimaryKey de 'um_exp_padres'
--
--

-- Creando indices Unique de 'um_exp_padres'
--



--
-- Estrutura de secuencia um_expediente_cod_exp_seq para la tabla 'um_expediente'
--
DROP SEQUENCE IF EXISTS um_expediente_cod_exp_seq CASCADE;
CREATE SEQUENCE um_expediente_cod_exp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'um_expediente'
--
DROP TABLE IF EXISTS um_expediente CASCADE;
CREATE TABLE um_expediente (
	cod_exp integer NOT NULL DEFAULT nextval('um_expediente_cod_exp_seq'::regclass),
	ano_res integer,
	niv_edu character varying(25),
	oci_ded text,
	oci_lec text,
	oci_otr text,
	tra_rem boolean,
	baj_con boolean,
	jor_tra integer,
	ing_med_men double precision,
	otr_tip_ing character varying(25),
	dep_eco_agr boolean,
	rec_ayu boolean,
	rec_ayu_ong character varying(30),
	med_cab boolean,
	acu_amb character varying(20),
	tra_con text,
	com character varying(10),
	con_agr character varying(25),
	dur_rel_sen character varying(30),
	pri_con boolean,
	suf_mal boolean,
	mal_qui character varying(30),
	suf_abu_sex boolean,
	abu_qui_sex character varying(30),
	tra_sep boolean,
	med_cau text,
	rup_ant boolean,
	dur_mal character varying(25),
	ame_rup boolean,
	mal_men boolean,
	tip_mal_men text,
	num_hij integer,
	per_hog text,
	apo_eco_fam character varying(25),
	apo_afe_fam character varying(25),
	apo_cri character varying(25),
	con_sit boolean,
	con_apo boolean,
	man_rel_agr boolean,
	apo_efe_ami character varying(25),
	apo_afe_ami character varying(25),
	ent_con_agr boolean,
	ent_apo_agr boolean,
	niv_edu_agr character varying(25),
	ant_pen_agr text,
	car_agr text,
	dec_aba_hog text,
	res_ame_rup text,
	abu_qui text,
	prob_agr text,
	cod_per integer,
	cod_agr integer
);

ALTER SEQUENCE um_expediente_cod_exp_seq OWNED BY um_expediente.cod_exp;

--
-- Creando datos de 'um_expediente'
--
INSERT INTO um_expediente VALUES('1','0','Primarios (graduado)','estar con amigos|pasear|tv','Periodicos','ninguno','f','f','10','300','Ninguno','f','f',NULL,'f','Acude al ambulatorio','ninguno','Regular','Inestable y a Temporadas','6 a�os 5 meses','f','f','esposo','f',NULL,'f','ningna','f','5 meses','f','f',NULL,'2','Hombre (compa�ero)|Hijos','de la familia de la mujer',NULL,'de la familia de la mujer','f','f','f','de amigos del agresor','de amigos del agresor','f','f','Superiores',NULL,'Chantaje econ�mico|Maltrato f�sico',NULL,NULL,NULL,'Alcoholismo|Adicci�n al ordenador como chatear','9','2');
--
-- Creando indices PrimaryKey de 'um_expediente'
--
ALTER TABLE ONLY  um_expediente  ADD CONSTRAINT  um_expediente_pkey  PRIMARY KEY  (cod_exp);
--

-- Creando indices Unique de 'um_expediente'
--



--
-- Estrutura de secuencia um_gas_proy_cod_com_seq para la tabla 'um_gas_proy'
--
DROP SEQUENCE IF EXISTS um_gas_proy_cod_com_seq CASCADE;
CREATE SEQUENCE um_gas_proy_cod_com_seq
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'um_gas_proy'
--
DROP TABLE IF EXISTS um_gas_proy CASCADE;
CREATE TABLE um_gas_proy (
	cod_com integer NOT NULL DEFAULT nextval('um_gas_proy_cod_com_seq'::regclass),
	fec_com date,
	num_com character varying(10),
	con_com text,
	mon_com double precision,
	cod_pro character varying(10)
);

ALTER SEQUENCE um_gas_proy_cod_com_seq OWNED BY um_gas_proy.cod_com;

--
-- Creando datos de 'um_gas_proy'
--
INSERT INTO um_gas_proy VALUES('2','2015-03-16','09024','Compra utensilios de cocina y gas','228.4','C0023');
INSERT INTO um_gas_proy VALUES('1','2015-03-15','245043','Compra de harina, mantequilla, huevo,colorante y azucar','45','C0023');
--
-- Creando indices PrimaryKey de 'um_gas_proy'
--
--

-- Creando indices Unique de 'um_gas_proy'
--



--
-- Estrutura de tabla 'um_obs_exp'
--
DROP TABLE IF EXISTS um_obs_exp CASCADE;
CREATE TABLE um_obs_exp (
	cod_exp integer,
	fec_obs date,
	obs text
);

--
-- Creando datos de 'um_obs_exp'
--
INSERT INTO um_obs_exp VALUES('1','2015-03-15','Durante 5 meses la persona ha sido maltratada f�sicamente, y ella no ha denunciado por temor a represalias para con los hijos');
INSERT INTO um_obs_exp VALUES('1','2015-03-19','La persona ha progresado de manera acertiva');
--
-- Creando indices PrimaryKey de 'um_obs_exp'
--
--

-- Creando indices Unique de 'um_obs_exp'
--



--
-- Estrutura de tabla 'um_per_proy'
--
DROP TABLE IF EXISTS um_per_proy CASCADE;
CREATE TABLE um_per_proy (
	car character varying(12),
	sal double precision,
	cod_pro character varying(10),
	cod_per integer
);

--
-- Creando datos de 'um_per_proy'
--
INSERT INTO um_per_proy VALUES('Capacitadora','225','C0023','9');
INSERT INTO um_per_proy VALUES('Capacitadora','225','C0023','10');
--
-- Creando indices PrimaryKey de 'um_per_proy'
--
--

-- Creando indices Unique de 'um_per_proy'
--



--
-- Estrutura de tabla 'um_per_proy_temp'
--
DROP TABLE IF EXISTS um_per_proy_temp CASCADE;
CREATE TABLE um_per_proy_temp (
	car character varying(12),
	sal double precision,
	cod_pro character varying(10),
	cod_per integer
);

--
-- Creando datos de 'um_per_proy_temp'
--
INSERT INTO um_per_proy_temp VALUES('Tutor','200','UM001','1');
--
-- Creando indices PrimaryKey de 'um_per_proy_temp'
--
--

-- Creando indices Unique de 'um_per_proy_temp'
--



--
-- Estrutura de tabla 'um_proyecto'
--
DROP TABLE IF EXISTS um_proyecto CASCADE;
CREATE TABLE um_proyecto (
	cod_pro character varying(10) NOT NULL,
	nom_pro character varying(100),
	des text,
	ubi text,
	fec_ini date,
	fec_fin date,
	tip_fon character varying(10),
	mon_pro double precision,
	mon_ext double precision,
	pat text,
	est character varying(15)
);

--
-- Creando datos de 'um_proyecto'
--
INSERT INTO um_proyecto VALUES('UM001','Corte y confeccion','Capacitaciones a las mujeres de la localidad sobre corte y confeccion para que puedan desarrollarse en el ambito laboral','Casa comunal Canton Santa Anita','2015-03-05','2015-03-26','Externos','0','5000','Ciudad Mujer','En ejecuci�n');
INSERT INTO um_proyecto VALUES('C0023','Panaderia','El proyecto consiste en brindar capacitaciones a las mujeres de la localidad, para que puedan elaborar variedades de pan dulce, con el prop�sito que tengan una opci�n mas en la que puedan obtener ingresos y mejorar las competencias en el �rea de cocina','Casa comunal ubicada a un costado de la iglesia','2015-03-17','2015-04-25','Propios','4850','0','ADESCO Santa Anita','En ejecuci�n');
--
-- Creando indices PrimaryKey de 'um_proyecto'
--
ALTER TABLE ONLY  um_proyecto  ADD CONSTRAINT  um_proyecto_pkey  PRIMARY KEY  (cod_pro);
--

-- Creando indices Unique de 'um_proyecto'
--




--
-- Creando relaciones para 'af_descargo'
--

ALTER TABLE ONLY af_descargo ADD CONSTRAINT descargo FOREIGN KEY (cod_act) REFERENCES af_activo(cod_act);

--
-- Creando relaciones para 'af_mantenimiento'
--

ALTER TABLE ONLY af_mantenimiento ADD CONSTRAINT af_mantenimiento_cod_act_fkey FOREIGN KEY (cod_act) REFERENCES af_activo(cod_act);

--
-- Creando relaciones para 'af_mantenimiento'
--

ALTER TABLE ONLY af_mantenimiento ADD CONSTRAINT empresa FOREIGN KEY (emp) REFERENCES af_empresa(cod_emp);

--
-- Creando relaciones para 'af_traslados'
--

ALTER TABLE ONLY af_traslados ADD CONSTRAINT af_depto FOREIGN KEY (new_ubi) REFERENCES af_depto(cod);

--
-- Creando relaciones para 'af_traslados'
--

ALTER TABLE ONLY af_traslados ADD CONSTRAINT af_traslados_cod_act_fkey FOREIGN KEY (cod_act) REFERENCES af_activo(cod_act);

--
-- Creando relaciones para 'ca_cierre'
--

ALTER TABLE ONLY ca_cierre ADD CONSTRAINT ca_cierre_cod_neg_fkey FOREIGN KEY (cod_neg) REFERENCES ca_negocio(cod_neg);

--
-- Creando relaciones para 'ca_enterrado'
--

ALTER TABLE ONLY ca_enterrado ADD CONSTRAINT ca_enterrado_cod_tit_fkey FOREIGN KEY (cod_tit) REFERENCES ca_perpetuidad(cod_tit);

--
-- Creando relaciones para 'ca_traspaso'
--

ALTER TABLE ONLY ca_traspaso ADD CONSTRAINT ca_traspaso_cod_neg_fkey FOREIGN KEY (cod_neg) REFERENCES ca_negocio(cod_neg);

--
-- Creando relaciones para 'co_condonado'
--

ALTER TABLE ONLY co_condonado ADD CONSTRAINT co_condonado_codigo_fkey FOREIGN KEY (codigo) REFERENCES co_impuesto(codigo);

--
-- Creando relaciones para 'co_neginm_imp'
--

ALTER TABLE ONLY co_neginm_imp ADD CONSTRAINT co_neginm_imp_cod_imp_fkey FOREIGN KEY (cod_imp) REFERENCES co_impuesto(codigo);

--
-- Creando relaciones para 'rf_defuncion_digestyc'
--

ALTER TABLE ONLY rf_defuncion_digestyc ADD CONSTRAINT rf_defuncion_digestyc_num_lib_fkey FOREIGN KEY (num_lib, num_par) REFERENCES rf_defuncion_partida(num_lib, num_par);

--
-- Creando relaciones para 'rf_defuncion_digestyc2'
--

ALTER TABLE ONLY rf_defuncion_digestyc2 ADD CONSTRAINT rf_defuncion_digestyc2_num_lib_fkey FOREIGN KEY (num_lib, num_par) REFERENCES rf_defuncion_digestyc(num_lib, num_par);

--
-- Creando relaciones para 'rf_defuncion_digestyc3'
--

ALTER TABLE ONLY rf_defuncion_digestyc3 ADD CONSTRAINT rf_defuncion_digestyc3_num_lib_fkey FOREIGN KEY (num_lib, num_par) REFERENCES rf_defuncion_digestyc2(num_lib, num_par);

--
-- Creando relaciones para 'rf_defuncion_partida'
--

ALTER TABLE ONLY rf_defuncion_partida ADD CONSTRAINT rf_defuncion_partida_cod_per_fkey FOREIGN KEY (cod_per) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'rf_divorcio_digestyc'
--

ALTER TABLE ONLY rf_divorcio_digestyc ADD CONSTRAINT rf_divorcio_digestyc_num_lib_fkey FOREIGN KEY (num_lib, num_par) REFERENCES rf_divorcio_partida(num_lib, num_par);

--
-- Creando relaciones para 'rf_divorcio_partida'
--

ALTER TABLE ONLY rf_divorcio_partida ADD CONSTRAINT rf_divorcio_partida_cod_esa_fkey FOREIGN KEY (cod_esa) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'rf_divorcio_partida'
--

ALTER TABLE ONLY rf_divorcio_partida ADD CONSTRAINT rf_divorcio_partida_cod_eso_fkey FOREIGN KEY (cod_eso) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'rf_matrimonio_digestyc'
--

ALTER TABLE ONLY rf_matrimonio_digestyc ADD CONSTRAINT rf_matrimonio_digestyc_num_lib_fkey FOREIGN KEY (num_lib, num_par) REFERENCES rf_matrimonio_partida(num_lib, num_par);

--
-- Creando relaciones para 'rf_matrimonio_partida'
--

ALTER TABLE ONLY rf_matrimonio_partida ADD CONSTRAINT rf_matrimonio_partida_cod_esa_fkey FOREIGN KEY (cod_esa) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'rf_matrimonio_partida'
--

ALTER TABLE ONLY rf_matrimonio_partida ADD CONSTRAINT rf_matrimonio_partida_cod_eso_fkey FOREIGN KEY (cod_eso) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'rf_nacimiento_digestyc'
--

ALTER TABLE ONLY rf_nacimiento_digestyc ADD CONSTRAINT rf_nacimiento_digestyc_num_lib_fkey FOREIGN KEY (num_lib, num_par) REFERENCES rf_nacimiento_partida(num_lib, num_par);

--
-- Creando relaciones para 'rf_nacimiento_partida'
--

ALTER TABLE ONLY rf_nacimiento_partida ADD CONSTRAINT rf_nacimiento_partida_cod_per_fkey FOREIGN KEY (cod_per) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'se_bitacora'
--

ALTER TABLE ONLY se_bitacora ADD CONSTRAINT fk_usuario FOREIGN KEY (id_usuario) REFERENCES se_usuario(id) ON DELETE RESTRICT;

--
-- Creando relaciones para 'um_ben_proy'
--

ALTER TABLE ONLY um_ben_proy ADD CONSTRAINT um_ben_proy_cod_pro_fkey FOREIGN KEY (cod_pro) REFERENCES um_proyecto(cod_pro);

--
-- Creando relaciones para 'um_exp_padres'
--

ALTER TABLE ONLY um_exp_padres ADD CONSTRAINT um_exp_padres_cod_exp_fkey FOREIGN KEY (cod_exp) REFERENCES um_expediente(cod_exp);

--
-- Creando relaciones para 'um_gas_proy'
--

ALTER TABLE ONLY um_gas_proy ADD CONSTRAINT um_gas_proy_cod_pro_fkey FOREIGN KEY (cod_pro) REFERENCES um_proyecto(cod_pro);

--
-- Creando relaciones para 'um_obs_exp'
--

ALTER TABLE ONLY um_obs_exp ADD CONSTRAINT um_obs_exp_cod_exp_fkey FOREIGN KEY (cod_exp) REFERENCES um_expediente(cod_exp);

--
-- Creando relaciones para 'um_per_proy'
--

ALTER TABLE ONLY um_per_proy ADD CONSTRAINT um_per_proy_cod_pro_fkey FOREIGN KEY (cod_pro) REFERENCES um_proyecto(cod_pro);