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
	cod_dep integer,
	cod_tfondo integer,
	ori character varying(10),
	fec_gar date,
	don character varying(25)
);

--
-- Creando datos de 'af_activo'
--
--
-- Creando indices PrimaryKey de 'af_activo'
--
ALTER TABLE ONLY  af_activo  ADD CONSTRAINT  af_activo_pkey  PRIMARY KEY  (cod_act);
--

-- Creando indices Unique de 'af_activo'
--



--
-- Estrutura de secuencia af_depto_cod_seq para la tabla 'af_depto'
--
DROP SEQUENCE IF EXISTS af_depto_cod_seq CASCADE;
CREATE SEQUENCE af_depto_cod_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'af_depto'
--
DROP TABLE IF EXISTS af_depto CASCADE;
CREATE TABLE af_depto (
	cod integer NOT NULL DEFAULT nextval('af_depto_cod_seq'::regclass),
	nom character varying(50)
);

ALTER SEQUENCE af_depto_cod_seq OWNED BY af_depto.cod;

--
-- Creando datos de 'af_depto'
--
--
-- Creando indices PrimaryKey de 'af_depto'
--
ALTER TABLE ONLY  af_depto  ADD CONSTRAINT  af_depto_pkey  PRIMARY KEY  (cod);
--

-- Creando indices Unique de 'af_depto'
--



--
-- Estrutura de secuencia af_mantenimiento_cod_man_seq para la tabla 'af_mantenimiento'
--
DROP SEQUENCE IF EXISTS af_mantenimiento_cod_man_seq CASCADE;
CREATE SEQUENCE af_mantenimiento_cod_man_seq
    START WITH 1
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
	emp character varying(50),
	fec date,
	cod_man integer NOT NULL DEFAULT nextval('af_mantenimiento_cod_man_seq'::regclass)
);

ALTER SEQUENCE af_mantenimiento_cod_man_seq OWNED BY af_mantenimiento.cod_man;

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
    START WITH 1
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
    START WITH 1
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
	new_ubi character varying(100),
	cod_dep integer
);

ALTER SEQUENCE af_traslados_cod_tra_seq OWNED BY af_traslados.cod_tra;

--
-- Creando datos de 'af_traslados'
--
--
-- Creando indices PrimaryKey de 'af_traslados'
--
ALTER TABLE ONLY  af_traslados  ADD CONSTRAINT  af_traslados_pkey  PRIMARY KEY  (cod_tra);
--

-- Creando indices Unique de 'af_traslados'
--



--
-- Estrutura de secuencia ca_cementerio_cod_cem_seq para la tabla 'ca_cementerio'
--
DROP SEQUENCE IF EXISTS ca_cementerio_cod_cem_seq CASCADE;
CREATE SEQUENCE ca_cementerio_cod_cem_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'ca_cementerio'
--
DROP TABLE IF EXISTS ca_cementerio CASCADE;
CREATE TABLE ca_cementerio (
	cod_cem integer NOT NULL DEFAULT nextval('ca_cementerio_cod_cem_seq'::regclass),
	nom_cem character varying(50),
	sit_en text,
	zon_cem character varying(6)
);

ALTER SEQUENCE ca_cementerio_cod_cem_seq OWNED BY ca_cementerio.cod_cem;

--
-- Creando datos de 'ca_cementerio'
--
INSERT INTO ca_cementerio VALUES('1','Cementerio Santa Anita','AHI','Rural');
--
-- Creando indices PrimaryKey de 'ca_cementerio'
--
ALTER TABLE ONLY  ca_cementerio  ADD CONSTRAINT  ca_cementerio_pkey  PRIMARY KEY  (cod_cem);
--

-- Creando indices Unique de 'ca_cementerio'
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
	cod_per integer,
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
	lim_oes text,
	puntos text
);

--
-- Creando datos de 'ca_inmueble'
--
INSERT INTO ca_inmueble VALUES('71827836-1278-36','2','Rural','C/San Francisco','4','calle principal','terreno','terreno','terreno',NULL);
INSERT INTO ca_inmueble VALUES('12312332-4234-51','1',NULL,'C/San Rafael','4','calle principal','terreno de alguien','terreno de alguien mas','otro terreno',NULL);
INSERT INTO ca_inmueble VALUES('00000000-0000-00','2','Rural','C/Santa Anita','3','terreno','terreno','terreno','calle',NULL);
INSERT INTO ca_inmueble VALUES('11111111-1111-11','2','Rural','asdasda','2','terreno','calle','terreno','terreno',NULL);
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
    START WITH 3
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
	rub_neg text,
	zon_neg character varying(6),
	dep character varying(12),
	mun character varying(30),
	dir_neg text,
	med_neg double precision,
	img_neg text,
	est_neg boolean,
	tip_con character(1),
	cod_con integer,
	puntos text
);

ALTER SEQUENCE ca_negocio_cod_neg_seq OWNED BY ca_negocio.cod_neg;

--
-- Creando datos de 'ca_negocio'
--
INSERT INTO ca_negocio VALUES('1','Tienda Hdz','tienda','Rural','Cuscatlán','San Cristóbal','C/Santa anita','4','1','t',' ','1','(13.7004458,-88.9004982)');
INSERT INTO ca_negocio VALUES('2','Tienda yaneth','tienda','Rural','Cuscatlán','San Cristóbal','C/San Rafael','3',NULL,'t','N','5',NULL);
INSERT INTO ca_negocio VALUES('3','Tienda Martinez','tienda','Rural','Cuscatlán','San Cristóbal','Barrio El Centro','3',NULL,'t','N','5','(13.699841284494402, -88.89838457107544)');
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
    START WITH 3
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
	cod_cem integer,
	cod_pro integer
);

ALTER SEQUENCE ca_perpetuidad_cod_tit_seq OWNED BY ca_perpetuidad.cod_tit;

--
-- Creando datos de 'ca_perpetuidad'
--
INSERT INTO ca_perpetuidad VALUES('1','0','0',NULL,NULL,NULL,NULL,'1','Primera','54.29','ER23','2015-04-30','1','1');
INSERT INTO ca_perpetuidad VALUES('2','0','0',NULL,NULL,NULL,NULL,'1','Primera','54.2',NULL,'2015-04-30','1','2');
INSERT INTO ca_perpetuidad VALUES('3','0','0',NULL,NULL,NULL,NULL,'1','Primera','54.2',NULL,'2015-04-30','1','1');
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
-- Estrutura de secuencia co_factura_cod_fac_seq para la tabla 'co_factura'
--
DROP SEQUENCE IF EXISTS co_factura_cod_fac_seq CASCADE;
CREATE SEQUENCE co_factura_cod_fac_seq
    START WITH 2
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'co_factura'
--
DROP TABLE IF EXISTS co_factura CASCADE;
CREATE TABLE co_factura (
	cod_fac integer NOT NULL DEFAULT nextval('co_factura_cod_fac_seq'::regclass),
	fec timestamp,
	nom_con character varying(50),
	cod_con integer,
	mon double precision,
	est boolean
);

ALTER SEQUENCE co_factura_cod_fac_seq OWNED BY co_factura.cod_fac;

--
-- Creando datos de 'co_factura'
--
INSERT INTO co_factura VALUES('1','2015-05-20 00:00:00','Dennisse Carolina Crespin',NULL,'63','t');
INSERT INTO co_factura VALUES('2','2015-05-20 00:00:00','Carlos Alberto Torres',NULL,'21','t');
--
-- Creando indices PrimaryKey de 'co_factura'
--
ALTER TABLE ONLY  co_factura  ADD CONSTRAINT  co_factura_pkey  PRIMARY KEY  (cod_fac);
--

-- Creando indices Unique de 'co_factura'
--



--
-- Estrutura de secuencia co_factura_detalle_cod_det_seq para la tabla 'co_factura_detalle'
--
DROP SEQUENCE IF EXISTS co_factura_detalle_cod_det_seq CASCADE;
CREATE SEQUENCE co_factura_detalle_cod_det_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Estrutura de tabla 'co_factura_detalle'
--
DROP TABLE IF EXISTS co_factura_detalle CASCADE;
CREATE TABLE co_factura_detalle (
	cod_det integer NOT NULL DEFAULT nextval('co_factura_detalle_cod_det_seq'::regclass),
	det text,
	mon double precision,
	cod_fac integer,
	cod_rub character varying(5)
);

ALTER SEQUENCE co_factura_detalle_cod_det_seq OWNED BY co_factura_detalle.cod_det;

--
-- Creando datos de 'co_factura_detalle'
--
INSERT INTO co_factura_detalle VALUES('1','MULTAS POR MORA DE IMPUESTOS','60','1','15301');
INSERT INTO co_factura_detalle VALUES('2','5% FIESTAS PATRONALES','3','1','12114');
INSERT INTO co_factura_detalle VALUES('3','ALUMBRADO PUBLICO','20','2','12108');
INSERT INTO co_factura_detalle VALUES('4','5% FIESTAS PATRONALES','1','2','12114');
--
-- Creando indices PrimaryKey de 'co_factura_detalle'
--
ALTER TABLE ONLY  co_factura_detalle  ADD CONSTRAINT  co_factura_detalle_pkey  PRIMARY KEY  (cod_det);
--

-- Creando indices Unique de 'co_factura_detalle'
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
	cob_fij double precision,
	cob_min double precision,
	condonado boolean
);

--
-- Creando datos de 'co_impuesto'
--
INSERT INTO co_impuesto VALUES('12114','FIESTAS PATRONALES',NULL,'Porcentaje','5','0','2.86','f');
INSERT INTO co_impuesto VALUES('15301','MULTAS POR MORA DE IMPUESTOS',NULL,'Fijo','0','0','2.86','f');
INSERT INTO co_impuesto VALUES('15302','INTERESES MORATORIOS',NULL,'Fijo','0','0','2.86','f');
INSERT INTO co_impuesto VALUES('12108','ALUMBRADO PUBLICO',NULL,'Fijo','0','0.05','2.86','f');
INSERT INTO co_impuesto VALUES('12117','PAVIMENTACION',NULL,'Fijo','0','0.03','2.86','f');
INSERT INTO co_impuesto VALUES('15314','MULTAS',NULL,'Porcentaje','5','0','2.86','f');
INSERT INTO co_impuesto VALUES('15312','MULTAS (REG)',NULL,'Porcentaje','5','0','2.86','f');
INSERT INTO co_impuesto VALUES('15313','MULTAS AL COMERCIO',NULL,'Porcentaje','5','0','2.86','f');
INSERT INTO co_impuesto VALUES('12111','CEMENTERIOS MUNICIPALES',NULL,'Fijo','0','54.2','2.86','f');
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
INSERT INTO co_neginm_imp VALUES('12312332-4234-51','12108');
INSERT INTO co_neginm_imp VALUES('12312332-4234-51','12111');
INSERT INTO co_neginm_imp VALUES('12312332-4234-51','12114');
INSERT INTO co_neginm_imp VALUES('11111111-1111-11','12108');
INSERT INTO co_neginm_imp VALUES('11111111-1111-11','12114');
INSERT INTO co_neginm_imp VALUES('1','12108');
INSERT INTO co_neginm_imp VALUES('1','12117');
INSERT INTO co_neginm_imp VALUES('2','12108');
INSERT INTO co_neginm_imp VALUES('2','12117');
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
    START WITH 8
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
INSERT INTO co_notificacion VALUES('1','Notificacion de cobro','2015-04-26 18:15:05','t');
INSERT INTO co_notificacion VALUES('2','Notificacion de cobro','2015-04-26 18:26:55','t');
INSERT INTO co_notificacion VALUES('3','Notificacion de cobro','2015-04-26 18:48:02','t');
INSERT INTO co_notificacion VALUES('4','Notificacion de cobro','2015-04-26 18:54:56','t');
INSERT INTO co_notificacion VALUES('5','Notificacion de cobro','2015-04-26 22:11:27','t');
INSERT INTO co_notificacion VALUES('6','Cobro por título de perpetuidad a nombre de: Angel Alberto Hernandez Vasquez','2015-04-30 11:15:06','t');
INSERT INTO co_notificacion VALUES('7','Cobro por título de perpetuidad a nombre de: Darlene Melissa Gonzales Perez','2015-04-30 11:22:30','t');
INSERT INTO co_notificacion VALUES('8','Cobro por título de perpetuidad a nombre de: Angel Alberto Hernandez Vasquez','2015-04-30 11:23:51','t');
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
-- Estrutura de secuencia rf_persona_cod_per_seq para la tabla 'rf_persona'
--
DROP SEQUENCE IF EXISTS rf_persona_cod_per_seq CASCADE;
CREATE SEQUENCE rf_persona_cod_per_seq
    START WITH 5
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
	est_civ character varying(15)
);

ALTER SEQUENCE rf_persona_cod_per_seq OWNED BY rf_persona.cod_per;

--
-- Creando datos de 'rf_persona'
--
INSERT INTO rf_persona VALUES('1','Angel Alberto','Hernandez','Vasquez','M','1989-09-25','04211231-2','0902-250989-101-1','7933-3980',NULL,'Cuscatlán','San Cristóbal','Canton Santa Anita','Estudiante','Casado/a');
INSERT INTO rf_persona VALUES('2','Darlene Melissa','Gonzales','Perez','F','1992-09-30','05123883-2','1212-300992-001-0','7898-1212',NULL,'Cuscatlán','San Cristóbal','C/San Francisco','Estudiante','Soltero/a');
INSERT INTO rf_persona VALUES('3','Ana Aleyda','Gutierrritos','de Gustavo','F','1880-02-02','04123123-2','0567-564745-647-4','7988-6645',NULL,'Cuscatlán','San Cristóbal','C/ Santa Anita','ama de casa','Casado/a');
INSERT INTO rf_persona VALUES('4','Gustavo Alejandro','Angel','Maravilla','M','1991-07-14','04123432-4','0123-144241-234-1','7912-3131',NULL,'Cuscatlán','Cojutepeque','Santa Lucia','Estudiante','Casado/a');
INSERT INTO rf_persona VALUES('5','Estefani Yaneth','Martinez','Hernandez','F','1989-10-02','01232342-3','1243-021089-101-1','7812-3123',NULL,'Cuscatlán','San Cristóbal','C/Santa Anita','Estudiante','Divorciado/a');
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
    START WITH 1
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
INSERT INTO se_bitacora VALUES('1','Ingreso un nuevo usuario (tavo).','4','2015-05-19','22:05:22.576');
--
-- Creando indices PrimaryKey de 'se_bitacora'
--
ALTER TABLE ONLY  se_bitacora  ADD CONSTRAINT  se_bitacora_pkey  PRIMARY KEY  (cod);
--

-- Creando indices Unique de 'se_bitacora'
--



--
-- Estrutura de secuencia se_usuario_id_seq para la tabla 'se_usuario'
--
DROP SEQUENCE IF EXISTS se_usuario_id_seq CASCADE;
CREATE SEQUENCE se_usuario_id_seq
    START WITH 6
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
	contra character varying(40),
	niv character varying(13),
	act boolean
);

ALTER SEQUENCE se_usuario_id_seq OWNED BY se_usuario.id;

--
-- Creando datos de 'se_usuario'
--
INSERT INTO se_usuario VALUES('4','Gaby Ramirez','gabyto@gmail.com','admin','ec04321e2c7bf2e0b01bac41896796b19f22a244','6','t');
INSERT INTO se_usuario VALUES('5','Raquel Medina','raquel@gmail.com','activo','0d3051b10fb7278b22839a924c454076d4022884','4','t');
INSERT INTO se_usuario VALUES('6','Gustavo','tavo@gmail.com','tavo','ad44c045f149f56e05945f78b9401d81fe5ae2cc','4','t');
--
-- Creando indices PrimaryKey de 'se_usuario'
--
ALTER TABLE ONLY  se_usuario  ADD CONSTRAINT  se_usuario_pkey  PRIMARY KEY  (id);
--

-- Creando indices Unique de 'se_usuario'
--



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
	tra_rem character(2),
	baj_con character(2),
	jor_tra integer,
	ing_med_men double precision,
	otr_tip_ing character varying(25),
	dep_eco_agr character(2),
	rec_ayu character(2),
	rec_ayu_ong character varying(30),
	med_cab character(2),
	acu_amb character varying(20),
	tra_con text,
	com character varying(10),
	con_agr character varying(25),
	dur_rel_sen character varying(30),
	pri_con character(2),
	suf_mal character(2),
	mal_qui character varying(30),
	suf_abu_sex character(2),
	abu_qui_sex character varying(30),
	tra_sep character(2),
	med_cau text,
	rup_ant character(2),
	dur_mal character varying(25),
	ame_rup character(2),
	mal_men character(2),
	tip_mal_men text,
	num_hij integer,
	per_hog text,
	apo_eco_fam character varying(25),
	apo_afe_fam character varying(25),
	apo_cri character varying(25),
	con_sit character(2),
	con_apo character(2),
	man_rel_agr character(2),
	apo_efe_ami character varying(25),
	apo_afe_ami character varying(25),
	ent_con_agr character(2),
	ent_apo_agr character(2),
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
    START WITH 1
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
INSERT INTO um_obs_exp VALUES('1','2015-05-10','Pobre ale');
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
--
-- Creando indices PrimaryKey de 'um_proyecto'
--
ALTER TABLE ONLY  um_proyecto  ADD CONSTRAINT  um_proyecto_pkey  PRIMARY KEY  (cod_pro);
--

-- Creando indices Unique de 'um_proyecto'
--




--
-- Creando relaciones para 'af_activo'
--

ALTER TABLE ONLY af_activo ADD CONSTRAINT af_activo_cod_dep_fkey FOREIGN KEY (cod_dep) REFERENCES af_depto(cod);

--
-- Creando relaciones para 'af_activo'
--

ALTER TABLE ONLY af_activo ADD CONSTRAINT af_activo_cod_tfondo_fkey FOREIGN KEY (cod_tfondo) REFERENCES af_tfondo(cod_tfondo);

--
-- Creando relaciones para 'af_mantenimiento'
--

ALTER TABLE ONLY af_mantenimiento ADD CONSTRAINT af_mantenimiento_cod_act_fkey FOREIGN KEY (cod_act) REFERENCES af_activo(cod_act);

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
-- Creando relaciones para 'ca_enterrado'
--

ALTER TABLE ONLY ca_enterrado ADD CONSTRAINT ca_enterrado_cod_per_fkey FOREIGN KEY (cod_per) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'ca_inmueble'
--

ALTER TABLE ONLY ca_inmueble ADD CONSTRAINT ca_inmueble_cod_pro_fkey FOREIGN KEY (cod_pro) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'ca_perpetuidad'
--

ALTER TABLE ONLY ca_perpetuidad ADD CONSTRAINT ca_perpetuidad_cod_cem_fkey FOREIGN KEY (cod_cem) REFERENCES ca_cementerio(cod_cem);

--
-- Creando relaciones para 'ca_perpetuidad'
--

ALTER TABLE ONLY ca_perpetuidad ADD CONSTRAINT ca_perpetuidad_cod_pro_fkey FOREIGN KEY (cod_pro) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'ca_traspaso'
--

ALTER TABLE ONLY ca_traspaso ADD CONSTRAINT ca_traspaso_cod_pan_fkey FOREIGN KEY (cod_pan) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'ca_traspaso'
--

ALTER TABLE ONLY ca_traspaso ADD CONSTRAINT ca_traspaso_cod_pnu_fkey FOREIGN KEY (cod_pnu) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'ca_traspaso'
--

ALTER TABLE ONLY ca_traspaso ADD CONSTRAINT ca_traspaso_cod_neg_fkey FOREIGN KEY (cod_neg) REFERENCES ca_negocio(cod_neg);

--
-- Creando relaciones para 'co_condonado'
--

ALTER TABLE ONLY co_condonado ADD CONSTRAINT co_condonado_codigo_fkey FOREIGN KEY (codigo) REFERENCES co_impuesto(codigo);

--
-- Creando relaciones para 'co_factura_detalle'
--

ALTER TABLE ONLY co_factura_detalle ADD CONSTRAINT co_factura_detalle_cod_rub_fkey FOREIGN KEY (cod_rub) REFERENCES co_impuesto(codigo);

--
-- Creando relaciones para 'co_factura_detalle'
--

ALTER TABLE ONLY co_factura_detalle ADD CONSTRAINT co_factura_detalle_cod_fac_fkey FOREIGN KEY (cod_fac) REFERENCES co_factura(cod_fac);

--
-- Creando relaciones para 'co_neginm_imp'
--

ALTER TABLE ONLY co_neginm_imp ADD CONSTRAINT co_neginm_imp_cod_imp_fkey FOREIGN KEY (cod_imp) REFERENCES co_impuesto(codigo);

--
-- Creando relaciones para 'um_ben_proy'
--

ALTER TABLE ONLY um_ben_proy ADD CONSTRAINT um_ben_proy_cod_per_fkey FOREIGN KEY (cod_per) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'um_ben_proy'
--

ALTER TABLE ONLY um_ben_proy ADD CONSTRAINT um_ben_proy_cod_pro_fkey FOREIGN KEY (cod_pro) REFERENCES um_proyecto(cod_pro);

--
-- Creando relaciones para 'um_exp_padres'
--

ALTER TABLE ONLY um_exp_padres ADD CONSTRAINT um_exp_padres_cod_pad_fkey FOREIGN KEY (cod_pad) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'um_exp_padres'
--

ALTER TABLE ONLY um_exp_padres ADD CONSTRAINT um_exp_padres_cod_mad_fkey FOREIGN KEY (cod_mad) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'um_expediente'
--

ALTER TABLE ONLY um_expediente ADD CONSTRAINT um_expediente_cod_per_fkey FOREIGN KEY (cod_per) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'um_expediente'
--

ALTER TABLE ONLY um_expediente ADD CONSTRAINT um_expediente_cod_agr_fkey FOREIGN KEY (cod_agr) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'um_gas_proy'
--

ALTER TABLE ONLY um_gas_proy ADD CONSTRAINT um_gas_proy_cod_pro_fkey FOREIGN KEY (cod_pro) REFERENCES um_proyecto(cod_pro);

--
-- Creando relaciones para 'um_per_proy'
--

ALTER TABLE ONLY um_per_proy ADD CONSTRAINT um_per_proy_cod_per_fkey FOREIGN KEY (cod_per) REFERENCES rf_persona(cod_per);

--
-- Creando relaciones para 'um_per_proy'
--

ALTER TABLE ONLY um_per_proy ADD CONSTRAINT um_per_proy_cod_pro_fkey FOREIGN KEY (cod_pro) REFERENCES um_proyecto(cod_pro);