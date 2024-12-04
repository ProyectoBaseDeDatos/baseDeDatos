--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: class; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.class (
    id_class integer NOT NULL,
    name_class text NOT NULL,
    id_phylum integer
);


ALTER TABLE public.class OWNER TO postgres;

--
-- Name: class_id_class_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.class_id_class_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.class_id_class_seq OWNER TO postgres;

--
-- Name: class_id_class_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.class_id_class_seq OWNED BY public.class.id_class;


--
-- Name: epiteloespecifico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.epiteloespecifico (
    id_specificepithet integer NOT NULL,
    epithet text NOT NULL
);


ALTER TABLE public.epiteloespecifico OWNER TO postgres;

--
-- Name: epiteloespecifico_id_specificepithet_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.epiteloespecifico_id_specificepithet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.epiteloespecifico_id_specificepithet_seq OWNER TO postgres;

--
-- Name: epiteloespecifico_id_specificepithet_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.epiteloespecifico_id_specificepithet_seq OWNED BY public.epiteloespecifico.id_specificepithet;


--
-- Name: especimen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especimen (
    catalognumber integer NOT NULL,
    scientificname text NOT NULL,
    lifestage text,
    sex text,
    individualcount integer
);


ALTER TABLE public.especimen OWNER TO postgres;

--
-- Name: especimen_catalognumber_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.especimen_catalognumber_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.especimen_catalognumber_seq OWNER TO postgres;

--
-- Name: especimen_catalognumber_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.especimen_catalognumber_seq OWNED BY public.especimen.catalognumber;


--
-- Name: especimen_imagenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especimen_imagenes (
    id_especimen integer NOT NULL,
    id_foto integer NOT NULL
);


ALTER TABLE public.especimen_imagenes OWNER TO postgres;

--
-- Name: evento_de_coleccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evento_de_coleccion (
    id_evento_recoleccion integer NOT NULL,
    event_date timestamp without time zone NOT NULL,
    id_ubicacion integer
);


ALTER TABLE public.evento_de_coleccion OWNER TO postgres;

--
-- Name: evento_de_coleccion_id_evento_recoleccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evento_de_coleccion_id_evento_recoleccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.evento_de_coleccion_id_evento_recoleccion_seq OWNER TO postgres;

--
-- Name: evento_de_coleccion_id_evento_recoleccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evento_de_coleccion_id_evento_recoleccion_seq OWNED BY public.evento_de_coleccion.id_evento_recoleccion;


--
-- Name: family; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.family (
    id_family integer NOT NULL,
    name_family text NOT NULL,
    id_order integer
);


ALTER TABLE public.family OWNER TO postgres;

--
-- Name: family_id_family_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.family_id_family_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.family_id_family_seq OWNER TO postgres;

--
-- Name: family_id_family_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.family_id_family_seq OWNED BY public.family.id_family;


--
-- Name: genus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genus (
    id_genus integer NOT NULL,
    genus text NOT NULL,
    id_family integer
);


ALTER TABLE public.genus OWNER TO postgres;

--
-- Name: genus_id_genus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genus_id_genus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genus_id_genus_seq OWNER TO postgres;

--
-- Name: genus_id_genus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genus_id_genus_seq OWNED BY public.genus.id_genus;


--
-- Name: imagenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imagenes (
    id_foto integer NOT NULL,
    url text NOT NULL
);


ALTER TABLE public.imagenes OWNER TO postgres;

--
-- Name: imagenes_id_foto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imagenes_id_foto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.imagenes_id_foto_seq OWNER TO postgres;

--
-- Name: imagenes_id_foto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imagenes_id_foto_seq OWNED BY public.imagenes.id_foto;


--
-- Name: instituto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instituto (
    id_instituto integer NOT NULL,
    nombre text NOT NULL,
    direccion text
);


ALTER TABLE public.instituto OWNER TO postgres;

--
-- Name: info_instituto; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.info_instituto AS
 SELECT id_instituto,
    nombre,
    direccion
   FROM public.instituto;


ALTER VIEW public.info_instituto OWNER TO postgres;

--
-- Name: info_recoleccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.info_recoleccion (
    id_recoleccion integer NOT NULL,
    evento integer
);


ALTER TABLE public.info_recoleccion OWNER TO postgres;

--
-- Name: info_recoleccion_id_recoleccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.info_recoleccion_id_recoleccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.info_recoleccion_id_recoleccion_seq OWNER TO postgres;

--
-- Name: info_recoleccion_id_recoleccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.info_recoleccion_id_recoleccion_seq OWNED BY public.info_recoleccion.id_recoleccion;


--
-- Name: instituto_colectas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instituto_colectas (
    id_institucion integer NOT NULL,
    id_evento_recoleccion integer NOT NULL
);


ALTER TABLE public.instituto_colectas OWNER TO postgres;

--
-- Name: instituto_id_instituto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instituto_id_instituto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituto_id_instituto_seq OWNER TO postgres;

--
-- Name: instituto_id_instituto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instituto_id_instituto_seq OWNED BY public.instituto.id_instituto;


--
-- Name: jerarquia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jerarquia (
    id_jerarquia integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.jerarquia OWNER TO postgres;

--
-- Name: jerarquia_id_jerarquia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jerarquia_id_jerarquia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jerarquia_id_jerarquia_seq OWNER TO postgres;

--
-- Name: jerarquia_id_jerarquia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jerarquia_id_jerarquia_seq OWNED BY public.jerarquia.id_jerarquia;


--
-- Name: kingdom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kingdom (
    id_kingdom integer NOT NULL,
    name_kingdom text NOT NULL
);


ALTER TABLE public.kingdom OWNER TO postgres;

--
-- Name: kingdom_id_kingdom_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kingdom_id_kingdom_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kingdom_id_kingdom_seq OWNER TO postgres;

--
-- Name: kingdom_id_kingdom_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kingdom_id_kingdom_seq OWNED BY public.kingdom.id_kingdom;


--
-- Name: participacion_recoleccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.participacion_recoleccion (
    id_recoleccion integer NOT NULL,
    id_trabajador integer NOT NULL
);


ALTER TABLE public.participacion_recoleccion OWNER TO postgres;

--
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persona (
    id_persona integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    edad integer,
    telefono text,
    nacionalidad text,
    CONSTRAINT persona_edad_check CHECK ((edad >= 0))
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- Name: persona_id_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persona_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.persona_id_persona_seq OWNER TO postgres;

--
-- Name: persona_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persona_id_persona_seq OWNED BY public.persona.id_persona;


--
-- Name: phylum; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phylum (
    id_phylum integer NOT NULL,
    name_phylum text NOT NULL,
    id_reino integer
);


ALTER TABLE public.phylum OWNER TO postgres;

--
-- Name: phylum_id_phylum_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phylum_id_phylum_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.phylum_id_phylum_seq OWNER TO postgres;

--
-- Name: phylum_id_phylum_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phylum_id_phylum_seq OWNED BY public.phylum.id_phylum;


--
-- Name: taxon_coleta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taxon_coleta (
    id_recoleccion integer NOT NULL,
    especimen integer NOT NULL
);


ALTER TABLE public.taxon_coleta OWNER TO postgres;

--
-- Name: taxonomia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taxonomia (
    taxonid uuid DEFAULT gen_random_uuid() NOT NULL,
    id_especimen integer,
    tipo text NOT NULL,
    scientificname text NOT NULL,
    kingdom integer,
    phylum integer,
    class integer,
    order_taxonomia integer,
    family integer,
    genus integer,
    specificepithet integer
);


ALTER TABLE public.taxonomia OWNER TO postgres;

--
-- Name: taxonomiaorder; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taxonomiaorder (
    id_order integer NOT NULL,
    name_order text NOT NULL,
    id_class integer
);


ALTER TABLE public.taxonomiaorder OWNER TO postgres;

--
-- Name: taxonomiaorder_id_order_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taxonomiaorder_id_order_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.taxonomiaorder_id_order_seq OWNER TO postgres;

--
-- Name: taxonomiaorder_id_order_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taxonomiaorder_id_order_seq OWNED BY public.taxonomiaorder.id_order;


--
-- Name: trabajador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trabajador (
    id_trabajador integer NOT NULL,
    tipo_trabajador integer,
    id_persona integer
);


ALTER TABLE public.trabajador OWNER TO postgres;

--
-- Name: trabajador_id_trabajador_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trabajador_id_trabajador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trabajador_id_trabajador_seq OWNER TO postgres;

--
-- Name: trabajador_id_trabajador_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trabajador_id_trabajador_seq OWNED BY public.trabajador.id_trabajador;


--
-- Name: trabajador_institucion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trabajador_institucion (
    id_trabajador integer NOT NULL,
    id_institucion integer NOT NULL
);


ALTER TABLE public.trabajador_institucion OWNER TO postgres;

--
-- Name: ubicacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ubicacion (
    id_ubicacion integer NOT NULL,
    latitud numeric,
    longitud numeric,
    altitud numeric,
    locality text,
    habitat text,
    notas text
);


ALTER TABLE public.ubicacion OWNER TO postgres;

--
-- Name: ubicacion_id_ubicacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ubicacion_id_ubicacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ubicacion_id_ubicacion_seq OWNER TO postgres;

--
-- Name: ubicacion_id_ubicacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ubicacion_id_ubicacion_seq OWNED BY public.ubicacion.id_ubicacion;


--
-- Name: class id_class; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class ALTER COLUMN id_class SET DEFAULT nextval('public.class_id_class_seq'::regclass);


--
-- Name: epiteloespecifico id_specificepithet; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.epiteloespecifico ALTER COLUMN id_specificepithet SET DEFAULT nextval('public.epiteloespecifico_id_specificepithet_seq'::regclass);


--
-- Name: especimen catalognumber; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especimen ALTER COLUMN catalognumber SET DEFAULT nextval('public.especimen_catalognumber_seq'::regclass);


--
-- Name: evento_de_coleccion id_evento_recoleccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento_de_coleccion ALTER COLUMN id_evento_recoleccion SET DEFAULT nextval('public.evento_de_coleccion_id_evento_recoleccion_seq'::regclass);


--
-- Name: family id_family; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family ALTER COLUMN id_family SET DEFAULT nextval('public.family_id_family_seq'::regclass);


--
-- Name: genus id_genus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genus ALTER COLUMN id_genus SET DEFAULT nextval('public.genus_id_genus_seq'::regclass);


--
-- Name: imagenes id_foto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes ALTER COLUMN id_foto SET DEFAULT nextval('public.imagenes_id_foto_seq'::regclass);


--
-- Name: info_recoleccion id_recoleccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.info_recoleccion ALTER COLUMN id_recoleccion SET DEFAULT nextval('public.info_recoleccion_id_recoleccion_seq'::regclass);


--
-- Name: instituto id_instituto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituto ALTER COLUMN id_instituto SET DEFAULT nextval('public.instituto_id_instituto_seq'::regclass);


--
-- Name: jerarquia id_jerarquia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jerarquia ALTER COLUMN id_jerarquia SET DEFAULT nextval('public.jerarquia_id_jerarquia_seq'::regclass);


--
-- Name: kingdom id_kingdom; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kingdom ALTER COLUMN id_kingdom SET DEFAULT nextval('public.kingdom_id_kingdom_seq'::regclass);


--
-- Name: persona id_persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona ALTER COLUMN id_persona SET DEFAULT nextval('public.persona_id_persona_seq'::regclass);


--
-- Name: phylum id_phylum; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phylum ALTER COLUMN id_phylum SET DEFAULT nextval('public.phylum_id_phylum_seq'::regclass);


--
-- Name: taxonomiaorder id_order; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomiaorder ALTER COLUMN id_order SET DEFAULT nextval('public.taxonomiaorder_id_order_seq'::regclass);


--
-- Name: trabajador id_trabajador; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador ALTER COLUMN id_trabajador SET DEFAULT nextval('public.trabajador_id_trabajador_seq'::regclass);


--
-- Name: ubicacion id_ubicacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion ALTER COLUMN id_ubicacion SET DEFAULT nextval('public.ubicacion_id_ubicacion_seq'::regclass);


--
-- Data for Name: class; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.class (id_class, name_class, id_phylum) FROM stdin;
3	Insecta	4
\.


--
-- Data for Name: epiteloespecifico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.epiteloespecifico (id_specificepithet, epithet) FROM stdin;
4	campestris
5	machaon
6	herculeanus
\.


--
-- Data for Name: especimen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.especimen (catalognumber, scientificname, lifestage, sex, individualcount) FROM stdin;
4	Cicindela campestris	Adulto	Femenino	1
5	Papilio machaon	Larva	\N	5
6	Camponotus herculeanus	Adulto	Masculino	2
\.


--
-- Data for Name: especimen_imagenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.especimen_imagenes (id_especimen, id_foto) FROM stdin;
4	1
5	2
\.


--
-- Data for Name: evento_de_coleccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evento_de_coleccion (id_evento_recoleccion, event_date, id_ubicacion) FROM stdin;
5	2024-11-01 10:00:00	3
6	2024-11-05 14:30:00	4
\.


--
-- Data for Name: family; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.family (id_family, name_family, id_order) FROM stdin;
4	Carabidae	4
5	Papilionidae	5
6	Formicidae	6
\.


--
-- Data for Name: genus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genus (id_genus, genus, id_family) FROM stdin;
4	Cicindela	4
5	Papilio	5
6	Camponotus	6
\.


--
-- Data for Name: imagenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imagenes (id_foto, url) FROM stdin;
1	https://example.com/images/cicindela.jpg
2	https://example.com/images/papilio.jpg
\.


--
-- Data for Name: info_recoleccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.info_recoleccion (id_recoleccion, evento) FROM stdin;
1	5
2	6
\.


--
-- Data for Name: instituto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instituto (id_instituto, nombre, direccion) FROM stdin;
\.


--
-- Data for Name: instituto_colectas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instituto_colectas (id_institucion, id_evento_recoleccion) FROM stdin;
\.


--
-- Data for Name: jerarquia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jerarquia (id_jerarquia, nombre) FROM stdin;
1	Profesor
2	Identificador
3	Recolector
\.


--
-- Data for Name: kingdom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kingdom (id_kingdom, name_kingdom) FROM stdin;
3	Animalia
\.


--
-- Data for Name: participacion_recoleccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.participacion_recoleccion (id_recoleccion, id_trabajador) FROM stdin;
1	1
2	2
\.


--
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persona (id_persona, nombre, apellido, edad, telefono, nacionalidad) FROM stdin;
1	Luis	Diaz	34	5551234567	Mexicano
2	Alex	Salinas	28	5559876543	Mexicana
\.


--
-- Data for Name: phylum; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phylum (id_phylum, name_phylum, id_reino) FROM stdin;
4	Arthropoda	3
\.


--
-- Data for Name: taxon_coleta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taxon_coleta (id_recoleccion, especimen) FROM stdin;
1	4
2	5
\.


--
-- Data for Name: taxonomia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taxonomia (taxonid, id_especimen, tipo, scientificname, kingdom, phylum, class, order_taxonomia, family, genus, specificepithet) FROM stdin;
\.


--
-- Data for Name: taxonomiaorder; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taxonomiaorder (id_order, name_order, id_class) FROM stdin;
4	Coleoptera	3
5	Lepidoptera	3
6	Hymenoptera	3
\.


--
-- Data for Name: trabajador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trabajador (id_trabajador, tipo_trabajador, id_persona) FROM stdin;
1	1	1
2	2	2
\.


--
-- Data for Name: trabajador_institucion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trabajador_institucion (id_trabajador, id_institucion) FROM stdin;
\.


--
-- Data for Name: ubicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ubicacion (id_ubicacion, latitud, longitud, altitud, locality, habitat, notas) FROM stdin;
3	19.4326	-99.1332	2240	Ciudad de M‚xico	Bosque Urbano	Bosque en Chapultepec
4	21.1619	-86.8515	5	Canc£n	Selva Baja	Zona costera
\.


--
-- Name: class_id_class_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.class_id_class_seq', 3, true);


--
-- Name: epiteloespecifico_id_specificepithet_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.epiteloespecifico_id_specificepithet_seq', 6, true);


--
-- Name: especimen_catalognumber_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.especimen_catalognumber_seq', 6, true);


--
-- Name: evento_de_coleccion_id_evento_recoleccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evento_de_coleccion_id_evento_recoleccion_seq', 6, true);


--
-- Name: family_id_family_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.family_id_family_seq', 6, true);


--
-- Name: genus_id_genus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genus_id_genus_seq', 6, true);


--
-- Name: imagenes_id_foto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imagenes_id_foto_seq', 2, true);


--
-- Name: info_recoleccion_id_recoleccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.info_recoleccion_id_recoleccion_seq', 2, true);


--
-- Name: instituto_id_instituto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instituto_id_instituto_seq', 1, false);


--
-- Name: jerarquia_id_jerarquia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jerarquia_id_jerarquia_seq', 3, true);


--
-- Name: kingdom_id_kingdom_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kingdom_id_kingdom_seq', 3, true);


--
-- Name: persona_id_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persona_id_persona_seq', 2, true);


--
-- Name: phylum_id_phylum_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phylum_id_phylum_seq', 4, true);


--
-- Name: taxonomiaorder_id_order_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taxonomiaorder_id_order_seq', 6, true);


--
-- Name: trabajador_id_trabajador_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trabajador_id_trabajador_seq', 2, true);


--
-- Name: ubicacion_id_ubicacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ubicacion_id_ubicacion_seq', 4, true);


--
-- Name: class class_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (id_class);


--
-- Name: epiteloespecifico epiteloespecifico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.epiteloespecifico
    ADD CONSTRAINT epiteloespecifico_pkey PRIMARY KEY (id_specificepithet);


--
-- Name: especimen_imagenes especimen_imagenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especimen_imagenes
    ADD CONSTRAINT especimen_imagenes_pkey PRIMARY KEY (id_especimen, id_foto);


--
-- Name: especimen especimen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especimen
    ADD CONSTRAINT especimen_pkey PRIMARY KEY (catalognumber);


--
-- Name: evento_de_coleccion evento_de_coleccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento_de_coleccion
    ADD CONSTRAINT evento_de_coleccion_pkey PRIMARY KEY (id_evento_recoleccion);


--
-- Name: family family_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family
    ADD CONSTRAINT family_pkey PRIMARY KEY (id_family);


--
-- Name: genus genus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genus
    ADD CONSTRAINT genus_pkey PRIMARY KEY (id_genus);


--
-- Name: imagenes imagenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id_foto);


--
-- Name: info_recoleccion info_recoleccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.info_recoleccion
    ADD CONSTRAINT info_recoleccion_pkey PRIMARY KEY (id_recoleccion);


--
-- Name: instituto_colectas instituto_colectas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituto_colectas
    ADD CONSTRAINT instituto_colectas_pkey PRIMARY KEY (id_institucion, id_evento_recoleccion);


--
-- Name: instituto instituto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituto
    ADD CONSTRAINT instituto_pkey PRIMARY KEY (id_instituto);


--
-- Name: jerarquia jerarquia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jerarquia
    ADD CONSTRAINT jerarquia_pkey PRIMARY KEY (id_jerarquia);


--
-- Name: kingdom kingdom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kingdom
    ADD CONSTRAINT kingdom_pkey PRIMARY KEY (id_kingdom);


--
-- Name: participacion_recoleccion participacion_recoleccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacion_recoleccion
    ADD CONSTRAINT participacion_recoleccion_pkey PRIMARY KEY (id_recoleccion, id_trabajador);


--
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);


--
-- Name: phylum phylum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phylum
    ADD CONSTRAINT phylum_pkey PRIMARY KEY (id_phylum);


--
-- Name: taxon_coleta taxon_coleta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxon_coleta
    ADD CONSTRAINT taxon_coleta_pkey PRIMARY KEY (id_recoleccion, especimen);


--
-- Name: taxonomia taxonomia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_pkey PRIMARY KEY (taxonid);


--
-- Name: taxonomiaorder taxonomiaorder_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomiaorder
    ADD CONSTRAINT taxonomiaorder_pkey PRIMARY KEY (id_order);


--
-- Name: trabajador_institucion trabajador_institucion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador_institucion
    ADD CONSTRAINT trabajador_institucion_pkey PRIMARY KEY (id_trabajador, id_institucion);


--
-- Name: trabajador trabajador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_pkey PRIMARY KEY (id_trabajador);


--
-- Name: ubicacion ubicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ubicacion
    ADD CONSTRAINT ubicacion_pkey PRIMARY KEY (id_ubicacion);


--
-- Name: class class_id_phylum_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_id_phylum_fkey FOREIGN KEY (id_phylum) REFERENCES public.phylum(id_phylum) ON DELETE CASCADE;


--
-- Name: especimen_imagenes especimen_imagenes_id_especimen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especimen_imagenes
    ADD CONSTRAINT especimen_imagenes_id_especimen_fkey FOREIGN KEY (id_especimen) REFERENCES public.especimen(catalognumber);


--
-- Name: especimen_imagenes especimen_imagenes_id_foto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especimen_imagenes
    ADD CONSTRAINT especimen_imagenes_id_foto_fkey FOREIGN KEY (id_foto) REFERENCES public.imagenes(id_foto);


--
-- Name: evento_de_coleccion evento_de_coleccion_id_ubicacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evento_de_coleccion
    ADD CONSTRAINT evento_de_coleccion_id_ubicacion_fkey FOREIGN KEY (id_ubicacion) REFERENCES public.ubicacion(id_ubicacion) ON DELETE CASCADE;


--
-- Name: family family_id_order_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.family
    ADD CONSTRAINT family_id_order_fkey FOREIGN KEY (id_order) REFERENCES public.taxonomiaorder(id_order) ON DELETE CASCADE;


--
-- Name: genus genus_id_family_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genus
    ADD CONSTRAINT genus_id_family_fkey FOREIGN KEY (id_family) REFERENCES public.family(id_family) ON DELETE CASCADE;


--
-- Name: info_recoleccion info_recoleccion_evento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.info_recoleccion
    ADD CONSTRAINT info_recoleccion_evento_fkey FOREIGN KEY (evento) REFERENCES public.evento_de_coleccion(id_evento_recoleccion) ON DELETE CASCADE;


--
-- Name: instituto_colectas instituto_colectas_id_evento_recoleccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituto_colectas
    ADD CONSTRAINT instituto_colectas_id_evento_recoleccion_fkey FOREIGN KEY (id_evento_recoleccion) REFERENCES public.evento_de_coleccion(id_evento_recoleccion);


--
-- Name: instituto_colectas instituto_colectas_id_institucion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituto_colectas
    ADD CONSTRAINT instituto_colectas_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.instituto(id_instituto);


--
-- Name: participacion_recoleccion participacion_recoleccion_id_recoleccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacion_recoleccion
    ADD CONSTRAINT participacion_recoleccion_id_recoleccion_fkey FOREIGN KEY (id_recoleccion) REFERENCES public.info_recoleccion(id_recoleccion);


--
-- Name: participacion_recoleccion participacion_recoleccion_id_trabajador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacion_recoleccion
    ADD CONSTRAINT participacion_recoleccion_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES public.trabajador(id_trabajador);


--
-- Name: phylum phylum_id_reino_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phylum
    ADD CONSTRAINT phylum_id_reino_fkey FOREIGN KEY (id_reino) REFERENCES public.kingdom(id_kingdom) ON DELETE CASCADE;


--
-- Name: taxon_coleta taxon_coleta_especimen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxon_coleta
    ADD CONSTRAINT taxon_coleta_especimen_fkey FOREIGN KEY (especimen) REFERENCES public.especimen(catalognumber);


--
-- Name: taxon_coleta taxon_coleta_id_recoleccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxon_coleta
    ADD CONSTRAINT taxon_coleta_id_recoleccion_fkey FOREIGN KEY (id_recoleccion) REFERENCES public.info_recoleccion(id_recoleccion);


--
-- Name: taxonomia taxonomia_class_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_class_fkey FOREIGN KEY (class) REFERENCES public.class(id_class) ON DELETE SET NULL;


--
-- Name: taxonomia taxonomia_family_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_family_fkey FOREIGN KEY (family) REFERENCES public.family(id_family) ON DELETE SET NULL;


--
-- Name: taxonomia taxonomia_genus_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_genus_fkey FOREIGN KEY (genus) REFERENCES public.genus(id_genus) ON DELETE SET NULL;


--
-- Name: taxonomia taxonomia_id_especimen_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_id_especimen_fkey FOREIGN KEY (id_especimen) REFERENCES public.especimen(catalognumber);


--
-- Name: taxonomia taxonomia_kingdom_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_kingdom_fkey FOREIGN KEY (kingdom) REFERENCES public.kingdom(id_kingdom) ON DELETE SET NULL;


--
-- Name: taxonomia taxonomia_order_taxonomia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_order_taxonomia_fkey FOREIGN KEY (order_taxonomia) REFERENCES public.taxonomiaorder(id_order) ON DELETE SET NULL;


--
-- Name: taxonomia taxonomia_phylum_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_phylum_fkey FOREIGN KEY (phylum) REFERENCES public.phylum(id_phylum) ON DELETE SET NULL;


--
-- Name: taxonomia taxonomia_specificepithet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_specificepithet_fkey FOREIGN KEY (specificepithet) REFERENCES public.epiteloespecifico(id_specificepithet) ON DELETE SET NULL;


--
-- Name: taxonomiaorder taxonomiaorder_id_class_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxonomiaorder
    ADD CONSTRAINT taxonomiaorder_id_class_fkey FOREIGN KEY (id_class) REFERENCES public.class(id_class) ON DELETE CASCADE;


--
-- Name: trabajador trabajador_id_persona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON DELETE CASCADE;


--
-- Name: trabajador_institucion trabajador_institucion_id_institucion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador_institucion
    ADD CONSTRAINT trabajador_institucion_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.instituto(id_instituto);


--
-- Name: trabajador_institucion trabajador_institucion_id_trabajador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador_institucion
    ADD CONSTRAINT trabajador_institucion_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES public.trabajador(id_trabajador);


--
-- Name: trabajador trabajador_tipo_trabajador_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_tipo_trabajador_fkey FOREIGN KEY (tipo_trabajador) REFERENCES public.jerarquia(id_jerarquia) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

