PGDMP  (    6                |            coleccion_entomologica    17.0    17.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16760    coleccion_entomologica    DATABASE     �   CREATE DATABASE coleccion_entomologica WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252' TABLESPACE = mi_tablespace;
 &   DROP DATABASE coleccion_entomologica;
                     postgres    false            �            1259    16761    class    TABLE     r   CREATE TABLE public.class (
    id_class integer NOT NULL,
    name_class text NOT NULL,
    id_phylum integer
);
    DROP TABLE public.class;
       public         heap r       postgres    false            �           0    0    TABLE class    ACL     <   GRANT SELECT,INSERT ON TABLE public.class TO identificador;
          public               postgres    false    217            �            1259    16766    class_id_class_seq    SEQUENCE     �   CREATE SEQUENCE public.class_id_class_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.class_id_class_seq;
       public               postgres    false    217            �           0    0    class_id_class_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.class_id_class_seq OWNED BY public.class.id_class;
          public               postgres    false    218            �            1259    16767    epiteloespecifico    TABLE     n   CREATE TABLE public.epiteloespecifico (
    id_specificepithet integer NOT NULL,
    epithet text NOT NULL
);
 %   DROP TABLE public.epiteloespecifico;
       public         heap r       postgres    false            �            1259    16772 (   epiteloespecifico_id_specificepithet_seq    SEQUENCE     �   CREATE SEQUENCE public.epiteloespecifico_id_specificepithet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.epiteloespecifico_id_specificepithet_seq;
       public               postgres    false    219            �           0    0 (   epiteloespecifico_id_specificepithet_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.epiteloespecifico_id_specificepithet_seq OWNED BY public.epiteloespecifico.id_specificepithet;
          public               postgres    false    220            �            1259    16773 	   especimen    TABLE     �   CREATE TABLE public.especimen (
    catalognumber integer NOT NULL,
    scientificname text NOT NULL,
    lifestage text,
    sex text,
    individualcount integer
);
    DROP TABLE public.especimen;
       public         heap r       postgres    false            �           0    0    TABLE especimen    ACL     @   GRANT SELECT,INSERT ON TABLE public.especimen TO identificador;
          public               postgres    false    221            �            1259    16778    especimen_catalognumber_seq    SEQUENCE     �   CREATE SEQUENCE public.especimen_catalognumber_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.especimen_catalognumber_seq;
       public               postgres    false    221            �           0    0    especimen_catalognumber_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.especimen_catalognumber_seq OWNED BY public.especimen.catalognumber;
          public               postgres    false    222            �            1259    16779    especimen_imagenes    TABLE     l   CREATE TABLE public.especimen_imagenes (
    id_especimen integer NOT NULL,
    id_foto integer NOT NULL
);
 &   DROP TABLE public.especimen_imagenes;
       public         heap r       postgres    false            �           0    0    TABLE especimen_imagenes    ACL     I   GRANT SELECT,INSERT ON TABLE public.especimen_imagenes TO identificador;
          public               postgres    false    223            �            1259    16782    evento_de_coleccion    TABLE     �   CREATE TABLE public.evento_de_coleccion (
    id_evento_recoleccion integer NOT NULL,
    event_date timestamp without time zone NOT NULL,
    id_ubicacion integer
);
 '   DROP TABLE public.evento_de_coleccion;
       public         heap r       postgres    false            �           0    0    TABLE evento_de_coleccion    ACL     J   GRANT SELECT,INSERT ON TABLE public.evento_de_coleccion TO identificador;
          public               postgres    false    224            �            1259    16785 -   evento_de_coleccion_id_evento_recoleccion_seq    SEQUENCE     �   CREATE SEQUENCE public.evento_de_coleccion_id_evento_recoleccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.evento_de_coleccion_id_evento_recoleccion_seq;
       public               postgres    false    224            �           0    0 -   evento_de_coleccion_id_evento_recoleccion_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.evento_de_coleccion_id_evento_recoleccion_seq OWNED BY public.evento_de_coleccion.id_evento_recoleccion;
          public               postgres    false    225            �            1259    16786    family    TABLE     t   CREATE TABLE public.family (
    id_family integer NOT NULL,
    name_family text NOT NULL,
    id_order integer
);
    DROP TABLE public.family;
       public         heap r       postgres    false            �           0    0    TABLE family    ACL     =   GRANT SELECT,INSERT ON TABLE public.family TO identificador;
          public               postgres    false    226            �            1259    16791    family_id_family_seq    SEQUENCE     �   CREATE SEQUENCE public.family_id_family_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.family_id_family_seq;
       public               postgres    false    226            �           0    0    family_id_family_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.family_id_family_seq OWNED BY public.family.id_family;
          public               postgres    false    227            �            1259    16792    genus    TABLE     m   CREATE TABLE public.genus (
    id_genus integer NOT NULL,
    genus text NOT NULL,
    id_family integer
);
    DROP TABLE public.genus;
       public         heap r       postgres    false            �           0    0    TABLE genus    ACL     <   GRANT SELECT,INSERT ON TABLE public.genus TO identificador;
          public               postgres    false    228            �            1259    16797    genus_id_genus_seq    SEQUENCE     �   CREATE SEQUENCE public.genus_id_genus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.genus_id_genus_seq;
       public               postgres    false    228            �           0    0    genus_id_genus_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.genus_id_genus_seq OWNED BY public.genus.id_genus;
          public               postgres    false    229            �            1259    16798    imagenes    TABLE     V   CREATE TABLE public.imagenes (
    id_foto integer NOT NULL,
    url text NOT NULL
);
    DROP TABLE public.imagenes;
       public         heap r       postgres    false            �           0    0    TABLE imagenes    ACL     ?   GRANT SELECT,INSERT ON TABLE public.imagenes TO identificador;
          public               postgres    false    230            �            1259    16803    imagenes_id_foto_seq    SEQUENCE     �   CREATE SEQUENCE public.imagenes_id_foto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.imagenes_id_foto_seq;
       public               postgres    false    230            �           0    0    imagenes_id_foto_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.imagenes_id_foto_seq OWNED BY public.imagenes.id_foto;
          public               postgres    false    231            �            1259    16808 	   instituto    TABLE     s   CREATE TABLE public.instituto (
    id_instituto integer NOT NULL,
    nombre text NOT NULL,
    direccion text
);
    DROP TABLE public.instituto;
       public         heap r       postgres    false            �            1259    17069    info_instituto    VIEW     o   CREATE VIEW public.info_instituto AS
 SELECT id_instituto,
    nombre,
    direccion
   FROM public.instituto;
 !   DROP VIEW public.info_instituto;
       public       v       postgres    false    234    234    234            �            1259    16804    info_recoleccion    TABLE     b   CREATE TABLE public.info_recoleccion (
    id_recoleccion integer NOT NULL,
    evento integer
);
 $   DROP TABLE public.info_recoleccion;
       public         heap r       postgres    false            �            1259    16807 #   info_recoleccion_id_recoleccion_seq    SEQUENCE     �   CREATE SEQUENCE public.info_recoleccion_id_recoleccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.info_recoleccion_id_recoleccion_seq;
       public               postgres    false    232            �           0    0 #   info_recoleccion_id_recoleccion_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.info_recoleccion_id_recoleccion_seq OWNED BY public.info_recoleccion.id_recoleccion;
          public               postgres    false    233            �            1259    16813    instituto_colectas    TABLE     |   CREATE TABLE public.instituto_colectas (
    id_institucion integer NOT NULL,
    id_evento_recoleccion integer NOT NULL
);
 &   DROP TABLE public.instituto_colectas;
       public         heap r       postgres    false            �            1259    16816    instituto_id_instituto_seq    SEQUENCE     �   CREATE SEQUENCE public.instituto_id_instituto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.instituto_id_instituto_seq;
       public               postgres    false    234            �           0    0    instituto_id_instituto_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.instituto_id_instituto_seq OWNED BY public.instituto.id_instituto;
          public               postgres    false    236            �            1259    16817 	   jerarquia    TABLE     _   CREATE TABLE public.jerarquia (
    id_jerarquia integer NOT NULL,
    nombre text NOT NULL
);
    DROP TABLE public.jerarquia;
       public         heap r       postgres    false            �            1259    16822    jerarquia_id_jerarquia_seq    SEQUENCE     �   CREATE SEQUENCE public.jerarquia_id_jerarquia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.jerarquia_id_jerarquia_seq;
       public               postgres    false    237            �           0    0    jerarquia_id_jerarquia_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.jerarquia_id_jerarquia_seq OWNED BY public.jerarquia.id_jerarquia;
          public               postgres    false    238            �            1259    16823    kingdom    TABLE     a   CREATE TABLE public.kingdom (
    id_kingdom integer NOT NULL,
    name_kingdom text NOT NULL
);
    DROP TABLE public.kingdom;
       public         heap r       postgres    false            �           0    0    TABLE kingdom    ACL     >   GRANT SELECT,INSERT ON TABLE public.kingdom TO identificador;
          public               postgres    false    239            �            1259    16828    kingdom_id_kingdom_seq    SEQUENCE     �   CREATE SEQUENCE public.kingdom_id_kingdom_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.kingdom_id_kingdom_seq;
       public               postgres    false    239            �           0    0    kingdom_id_kingdom_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.kingdom_id_kingdom_seq OWNED BY public.kingdom.id_kingdom;
          public               postgres    false    240            �            1259    16829    participacion_recoleccion    TABLE     {   CREATE TABLE public.participacion_recoleccion (
    id_recoleccion integer NOT NULL,
    id_trabajador integer NOT NULL
);
 -   DROP TABLE public.participacion_recoleccion;
       public         heap r       postgres    false            �            1259    16832    persona    TABLE     �   CREATE TABLE public.persona (
    id_persona integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    edad integer,
    telefono text,
    nacionalidad text,
    CONSTRAINT persona_edad_check CHECK ((edad >= 0))
);
    DROP TABLE public.persona;
       public         heap r       postgres    false            �            1259    16838    persona_id_persona_seq    SEQUENCE     �   CREATE SEQUENCE public.persona_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.persona_id_persona_seq;
       public               postgres    false    242            �           0    0    persona_id_persona_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.persona_id_persona_seq OWNED BY public.persona.id_persona;
          public               postgres    false    243            �            1259    16839    phylum    TABLE     t   CREATE TABLE public.phylum (
    id_phylum integer NOT NULL,
    name_phylum text NOT NULL,
    id_reino integer
);
    DROP TABLE public.phylum;
       public         heap r       postgres    false            �           0    0    TABLE phylum    ACL     =   GRANT SELECT,INSERT ON TABLE public.phylum TO identificador;
          public               postgres    false    244            �            1259    16844    phylum_id_phylum_seq    SEQUENCE     �   CREATE SEQUENCE public.phylum_id_phylum_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.phylum_id_phylum_seq;
       public               postgres    false    244            �           0    0    phylum_id_phylum_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.phylum_id_phylum_seq OWNED BY public.phylum.id_phylum;
          public               postgres    false    245            �            1259    16845    taxon_coleta    TABLE     j   CREATE TABLE public.taxon_coleta (
    id_recoleccion integer NOT NULL,
    especimen integer NOT NULL
);
     DROP TABLE public.taxon_coleta;
       public         heap r       postgres    false            �           0    0    TABLE taxon_coleta    ACL     C   GRANT SELECT,INSERT ON TABLE public.taxon_coleta TO identificador;
          public               postgres    false    246            �            1259    16848 	   taxonomia    TABLE     H  CREATE TABLE public.taxonomia (
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
    DROP TABLE public.taxonomia;
       public         heap r       postgres    false            �           0    0    TABLE taxonomia    ACL     @   GRANT SELECT,INSERT ON TABLE public.taxonomia TO identificador;
          public               postgres    false    247            �            1259    16860 
   trabajador    TABLE     |   CREATE TABLE public.trabajador (
    id_trabajador integer NOT NULL,
    tipo_trabajador integer,
    id_persona integer
);
    DROP TABLE public.trabajador;
       public         heap r       postgres    false            �            1259    16867 	   ubicacion    TABLE     �   CREATE TABLE public.ubicacion (
    id_ubicacion integer NOT NULL,
    latitud numeric,
    longitud numeric,
    altitud numeric,
    locality text,
    habitat text,
    notas text
);
    DROP TABLE public.ubicacion;
       public         heap r       postgres    false            �           0    0    TABLE ubicacion    ACL     @   GRANT SELECT,INSERT ON TABLE public.ubicacion TO identificador;
          public               postgres    false    253                        1259    17084    recoleccion_noviembre_2024    VIEW     D  CREATE VIEW public.recoleccion_noviembre_2024 AS
 SELECT e.event_date,
    u.locality,
    p.nombre AS nombre_persona,
    es.catalognumber,
    es.scientificname,
    es.sex,
    t.kingdom,
    t.phylum,
    t.class,
    t.order_taxonomia,
    t.family,
    t.genus,
    t.specificepithet
   FROM ((((((((public.evento_de_coleccion e
     JOIN public.ubicacion u ON ((e.id_ubicacion = u.id_ubicacion)))
     JOIN public.info_recoleccion ir ON ((e.id_evento_recoleccion = ir.evento)))
     JOIN public.taxon_coleta tc ON ((ir.id_recoleccion = tc.id_recoleccion)))
     JOIN public.especimen es ON ((tc.especimen = es.catalognumber)))
     JOIN public.taxonomia t ON ((es.catalognumber = t.id_especimen)))
     JOIN public.participacion_recoleccion pr ON ((ir.id_recoleccion = pr.id_recoleccion)))
     JOIN public.trabajador tbr ON ((pr.id_trabajador = tbr.id_trabajador)))
     JOIN public.persona p ON ((tbr.id_persona = p.id_persona)))
  WHERE ((e.event_date >= '2024-11-01 00:00:00'::timestamp without time zone) AND (e.event_date <= '2024-11-30 00:00:00'::timestamp without time zone));
 -   DROP VIEW public.recoleccion_noviembre_2024;
       public       v       postgres    false    242    241    232    241    253    253    250    250    247    247    247    247    247    247    247    247    246    246    242    221    221    232    224    224    224    221            �            1259    16854    taxonomiaorder    TABLE     z   CREATE TABLE public.taxonomiaorder (
    id_order integer NOT NULL,
    name_order text NOT NULL,
    id_class integer
);
 "   DROP TABLE public.taxonomiaorder;
       public         heap r       postgres    false            �            1259    16859    taxonomiaorder_id_order_seq    SEQUENCE     �   CREATE SEQUENCE public.taxonomiaorder_id_order_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.taxonomiaorder_id_order_seq;
       public               postgres    false    248            �           0    0    taxonomiaorder_id_order_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.taxonomiaorder_id_order_seq OWNED BY public.taxonomiaorder.id_order;
          public               postgres    false    249            �            1259    16863    trabajador_id_trabajador_seq    SEQUENCE     �   CREATE SEQUENCE public.trabajador_id_trabajador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.trabajador_id_trabajador_seq;
       public               postgres    false    250            �           0    0    trabajador_id_trabajador_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.trabajador_id_trabajador_seq OWNED BY public.trabajador.id_trabajador;
          public               postgres    false    251            �            1259    16864    trabajador_institucion    TABLE     x   CREATE TABLE public.trabajador_institucion (
    id_trabajador integer NOT NULL,
    id_institucion integer NOT NULL
);
 *   DROP TABLE public.trabajador_institucion;
       public         heap r       postgres    false            �            1259    16872    ubicacion_id_ubicacion_seq    SEQUENCE     �   CREATE SEQUENCE public.ubicacion_id_ubicacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.ubicacion_id_ubicacion_seq;
       public               postgres    false    253            �           0    0    ubicacion_id_ubicacion_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.ubicacion_id_ubicacion_seq OWNED BY public.ubicacion.id_ubicacion;
          public               postgres    false    254            �           2604    16873    class id_class    DEFAULT     p   ALTER TABLE ONLY public.class ALTER COLUMN id_class SET DEFAULT nextval('public.class_id_class_seq'::regclass);
 =   ALTER TABLE public.class ALTER COLUMN id_class DROP DEFAULT;
       public               postgres    false    218    217            �           2604    16874 $   epiteloespecifico id_specificepithet    DEFAULT     �   ALTER TABLE ONLY public.epiteloespecifico ALTER COLUMN id_specificepithet SET DEFAULT nextval('public.epiteloespecifico_id_specificepithet_seq'::regclass);
 S   ALTER TABLE public.epiteloespecifico ALTER COLUMN id_specificepithet DROP DEFAULT;
       public               postgres    false    220    219            �           2604    16875    especimen catalognumber    DEFAULT     �   ALTER TABLE ONLY public.especimen ALTER COLUMN catalognumber SET DEFAULT nextval('public.especimen_catalognumber_seq'::regclass);
 F   ALTER TABLE public.especimen ALTER COLUMN catalognumber DROP DEFAULT;
       public               postgres    false    222    221            �           2604    16876 )   evento_de_coleccion id_evento_recoleccion    DEFAULT     �   ALTER TABLE ONLY public.evento_de_coleccion ALTER COLUMN id_evento_recoleccion SET DEFAULT nextval('public.evento_de_coleccion_id_evento_recoleccion_seq'::regclass);
 X   ALTER TABLE public.evento_de_coleccion ALTER COLUMN id_evento_recoleccion DROP DEFAULT;
       public               postgres    false    225    224            �           2604    16877    family id_family    DEFAULT     t   ALTER TABLE ONLY public.family ALTER COLUMN id_family SET DEFAULT nextval('public.family_id_family_seq'::regclass);
 ?   ALTER TABLE public.family ALTER COLUMN id_family DROP DEFAULT;
       public               postgres    false    227    226            �           2604    16878    genus id_genus    DEFAULT     p   ALTER TABLE ONLY public.genus ALTER COLUMN id_genus SET DEFAULT nextval('public.genus_id_genus_seq'::regclass);
 =   ALTER TABLE public.genus ALTER COLUMN id_genus DROP DEFAULT;
       public               postgres    false    229    228            �           2604    16879    imagenes id_foto    DEFAULT     t   ALTER TABLE ONLY public.imagenes ALTER COLUMN id_foto SET DEFAULT nextval('public.imagenes_id_foto_seq'::regclass);
 ?   ALTER TABLE public.imagenes ALTER COLUMN id_foto DROP DEFAULT;
       public               postgres    false    231    230            �           2604    16880    info_recoleccion id_recoleccion    DEFAULT     �   ALTER TABLE ONLY public.info_recoleccion ALTER COLUMN id_recoleccion SET DEFAULT nextval('public.info_recoleccion_id_recoleccion_seq'::regclass);
 N   ALTER TABLE public.info_recoleccion ALTER COLUMN id_recoleccion DROP DEFAULT;
       public               postgres    false    233    232            �           2604    16881    instituto id_instituto    DEFAULT     �   ALTER TABLE ONLY public.instituto ALTER COLUMN id_instituto SET DEFAULT nextval('public.instituto_id_instituto_seq'::regclass);
 E   ALTER TABLE public.instituto ALTER COLUMN id_instituto DROP DEFAULT;
       public               postgres    false    236    234            �           2604    16882    jerarquia id_jerarquia    DEFAULT     �   ALTER TABLE ONLY public.jerarquia ALTER COLUMN id_jerarquia SET DEFAULT nextval('public.jerarquia_id_jerarquia_seq'::regclass);
 E   ALTER TABLE public.jerarquia ALTER COLUMN id_jerarquia DROP DEFAULT;
       public               postgres    false    238    237            �           2604    16883    kingdom id_kingdom    DEFAULT     x   ALTER TABLE ONLY public.kingdom ALTER COLUMN id_kingdom SET DEFAULT nextval('public.kingdom_id_kingdom_seq'::regclass);
 A   ALTER TABLE public.kingdom ALTER COLUMN id_kingdom DROP DEFAULT;
       public               postgres    false    240    239            �           2604    16884    persona id_persona    DEFAULT     x   ALTER TABLE ONLY public.persona ALTER COLUMN id_persona SET DEFAULT nextval('public.persona_id_persona_seq'::regclass);
 A   ALTER TABLE public.persona ALTER COLUMN id_persona DROP DEFAULT;
       public               postgres    false    243    242            �           2604    16885    phylum id_phylum    DEFAULT     t   ALTER TABLE ONLY public.phylum ALTER COLUMN id_phylum SET DEFAULT nextval('public.phylum_id_phylum_seq'::regclass);
 ?   ALTER TABLE public.phylum ALTER COLUMN id_phylum DROP DEFAULT;
       public               postgres    false    245    244            �           2604    16886    taxonomiaorder id_order    DEFAULT     �   ALTER TABLE ONLY public.taxonomiaorder ALTER COLUMN id_order SET DEFAULT nextval('public.taxonomiaorder_id_order_seq'::regclass);
 F   ALTER TABLE public.taxonomiaorder ALTER COLUMN id_order DROP DEFAULT;
       public               postgres    false    249    248            �           2604    16887    trabajador id_trabajador    DEFAULT     �   ALTER TABLE ONLY public.trabajador ALTER COLUMN id_trabajador SET DEFAULT nextval('public.trabajador_id_trabajador_seq'::regclass);
 G   ALTER TABLE public.trabajador ALTER COLUMN id_trabajador DROP DEFAULT;
       public               postgres    false    251    250            �           2604    16888    ubicacion id_ubicacion    DEFAULT     �   ALTER TABLE ONLY public.ubicacion ALTER COLUMN id_ubicacion SET DEFAULT nextval('public.ubicacion_id_ubicacion_seq'::regclass);
 E   ALTER TABLE public.ubicacion ALTER COLUMN id_ubicacion DROP DEFAULT;
       public               postgres    false    254    253            �          0    16761    class 
   TABLE DATA           @   COPY public.class (id_class, name_class, id_phylum) FROM stdin;
    public               postgres    false    217   Y�       �          0    16767    epiteloespecifico 
   TABLE DATA           H   COPY public.epiteloespecifico (id_specificepithet, epithet) FROM stdin;
    public               postgres    false    219   ��       �          0    16773 	   especimen 
   TABLE DATA           c   COPY public.especimen (catalognumber, scientificname, lifestage, sex, individualcount) FROM stdin;
    public               postgres    false    221   ��       �          0    16779    especimen_imagenes 
   TABLE DATA           C   COPY public.especimen_imagenes (id_especimen, id_foto) FROM stdin;
    public               postgres    false    223   M�       �          0    16782    evento_de_coleccion 
   TABLE DATA           ^   COPY public.evento_de_coleccion (id_evento_recoleccion, event_date, id_ubicacion) FROM stdin;
    public               postgres    false    224   r�       �          0    16786    family 
   TABLE DATA           B   COPY public.family (id_family, name_family, id_order) FROM stdin;
    public               postgres    false    226   ��       �          0    16792    genus 
   TABLE DATA           ;   COPY public.genus (id_genus, genus, id_family) FROM stdin;
    public               postgres    false    228   �       �          0    16798    imagenes 
   TABLE DATA           0   COPY public.imagenes (id_foto, url) FROM stdin;
    public               postgres    false    230   c�       �          0    16804    info_recoleccion 
   TABLE DATA           B   COPY public.info_recoleccion (id_recoleccion, evento) FROM stdin;
    public               postgres    false    232   ��       �          0    16808 	   instituto 
   TABLE DATA           D   COPY public.instituto (id_instituto, nombre, direccion) FROM stdin;
    public               postgres    false    234   ��       �          0    16813    instituto_colectas 
   TABLE DATA           S   COPY public.instituto_colectas (id_institucion, id_evento_recoleccion) FROM stdin;
    public               postgres    false    235   �       �          0    16817 	   jerarquia 
   TABLE DATA           9   COPY public.jerarquia (id_jerarquia, nombre) FROM stdin;
    public               postgres    false    237   �       �          0    16823    kingdom 
   TABLE DATA           ;   COPY public.kingdom (id_kingdom, name_kingdom) FROM stdin;
    public               postgres    false    239   `�       �          0    16829    participacion_recoleccion 
   TABLE DATA           R   COPY public.participacion_recoleccion (id_recoleccion, id_trabajador) FROM stdin;
    public               postgres    false    241   ��       �          0    16832    persona 
   TABLE DATA           ]   COPY public.persona (id_persona, nombre, apellido, edad, telefono, nacionalidad) FROM stdin;
    public               postgres    false    242   ��       �          0    16839    phylum 
   TABLE DATA           B   COPY public.phylum (id_phylum, name_phylum, id_reino) FROM stdin;
    public               postgres    false    244   F�       �          0    16845    taxon_coleta 
   TABLE DATA           A   COPY public.taxon_coleta (id_recoleccion, especimen) FROM stdin;
    public               postgres    false    246   r�       �          0    16848 	   taxonomia 
   TABLE DATA           �   COPY public.taxonomia (taxonid, id_especimen, tipo, scientificname, kingdom, phylum, class, order_taxonomia, family, genus, specificepithet) FROM stdin;
    public               postgres    false    247   ��       �          0    16854    taxonomiaorder 
   TABLE DATA           H   COPY public.taxonomiaorder (id_order, name_order, id_class) FROM stdin;
    public               postgres    false    248   {�       �          0    16860 
   trabajador 
   TABLE DATA           P   COPY public.trabajador (id_trabajador, tipo_trabajador, id_persona) FROM stdin;
    public               postgres    false    250   ��       �          0    16864    trabajador_institucion 
   TABLE DATA           O   COPY public.trabajador_institucion (id_trabajador, id_institucion) FROM stdin;
    public               postgres    false    252   ��       �          0    16867 	   ubicacion 
   TABLE DATA           g   COPY public.ubicacion (id_ubicacion, latitud, longitud, altitud, locality, habitat, notas) FROM stdin;
    public               postgres    false    253   �       �           0    0    class_id_class_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.class_id_class_seq', 3, true);
          public               postgres    false    218            �           0    0 (   epiteloespecifico_id_specificepithet_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.epiteloespecifico_id_specificepithet_seq', 6, true);
          public               postgres    false    220            �           0    0    especimen_catalognumber_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.especimen_catalognumber_seq', 6, true);
          public               postgres    false    222            �           0    0 -   evento_de_coleccion_id_evento_recoleccion_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.evento_de_coleccion_id_evento_recoleccion_seq', 6, true);
          public               postgres    false    225            �           0    0    family_id_family_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.family_id_family_seq', 6, true);
          public               postgres    false    227            �           0    0    genus_id_genus_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.genus_id_genus_seq', 6, true);
          public               postgres    false    229            �           0    0    imagenes_id_foto_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.imagenes_id_foto_seq', 2, true);
          public               postgres    false    231            �           0    0 #   info_recoleccion_id_recoleccion_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.info_recoleccion_id_recoleccion_seq', 2, true);
          public               postgres    false    233            �           0    0    instituto_id_instituto_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.instituto_id_instituto_seq', 1, false);
          public               postgres    false    236            �           0    0    jerarquia_id_jerarquia_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.jerarquia_id_jerarquia_seq', 3, true);
          public               postgres    false    238                        0    0    kingdom_id_kingdom_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.kingdom_id_kingdom_seq', 3, true);
          public               postgres    false    240                       0    0    persona_id_persona_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.persona_id_persona_seq', 2, true);
          public               postgres    false    243                       0    0    phylum_id_phylum_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.phylum_id_phylum_seq', 4, true);
          public               postgres    false    245                       0    0    taxonomiaorder_id_order_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.taxonomiaorder_id_order_seq', 6, true);
          public               postgres    false    249                       0    0    trabajador_id_trabajador_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.trabajador_id_trabajador_seq', 2, true);
          public               postgres    false    251                       0    0    ubicacion_id_ubicacion_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.ubicacion_id_ubicacion_seq', 4, true);
          public               postgres    false    254            �           2606    16890    class class_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (id_class);
 :   ALTER TABLE ONLY public.class DROP CONSTRAINT class_pkey;
       public                 postgres    false    217            �           2606    16892 (   epiteloespecifico epiteloespecifico_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.epiteloespecifico
    ADD CONSTRAINT epiteloespecifico_pkey PRIMARY KEY (id_specificepithet);
 R   ALTER TABLE ONLY public.epiteloespecifico DROP CONSTRAINT epiteloespecifico_pkey;
       public                 postgres    false    219            �           2606    16894 *   especimen_imagenes especimen_imagenes_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.especimen_imagenes
    ADD CONSTRAINT especimen_imagenes_pkey PRIMARY KEY (id_especimen, id_foto);
 T   ALTER TABLE ONLY public.especimen_imagenes DROP CONSTRAINT especimen_imagenes_pkey;
       public                 postgres    false    223    223            �           2606    16896    especimen especimen_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.especimen
    ADD CONSTRAINT especimen_pkey PRIMARY KEY (catalognumber);
 B   ALTER TABLE ONLY public.especimen DROP CONSTRAINT especimen_pkey;
       public                 postgres    false    221            �           2606    16898 ,   evento_de_coleccion evento_de_coleccion_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.evento_de_coleccion
    ADD CONSTRAINT evento_de_coleccion_pkey PRIMARY KEY (id_evento_recoleccion);
 V   ALTER TABLE ONLY public.evento_de_coleccion DROP CONSTRAINT evento_de_coleccion_pkey;
       public                 postgres    false    224            �           2606    16900    family family_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.family
    ADD CONSTRAINT family_pkey PRIMARY KEY (id_family);
 <   ALTER TABLE ONLY public.family DROP CONSTRAINT family_pkey;
       public                 postgres    false    226            �           2606    16902    genus genus_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.genus
    ADD CONSTRAINT genus_pkey PRIMARY KEY (id_genus);
 :   ALTER TABLE ONLY public.genus DROP CONSTRAINT genus_pkey;
       public                 postgres    false    228            �           2606    16904    imagenes imagenes_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id_foto);
 @   ALTER TABLE ONLY public.imagenes DROP CONSTRAINT imagenes_pkey;
       public                 postgres    false    230            �           2606    16906 &   info_recoleccion info_recoleccion_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.info_recoleccion
    ADD CONSTRAINT info_recoleccion_pkey PRIMARY KEY (id_recoleccion);
 P   ALTER TABLE ONLY public.info_recoleccion DROP CONSTRAINT info_recoleccion_pkey;
       public                 postgres    false    232            �           2606    16908 *   instituto_colectas instituto_colectas_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.instituto_colectas
    ADD CONSTRAINT instituto_colectas_pkey PRIMARY KEY (id_institucion, id_evento_recoleccion);
 T   ALTER TABLE ONLY public.instituto_colectas DROP CONSTRAINT instituto_colectas_pkey;
       public                 postgres    false    235    235            �           2606    16910    instituto instituto_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.instituto
    ADD CONSTRAINT instituto_pkey PRIMARY KEY (id_instituto);
 B   ALTER TABLE ONLY public.instituto DROP CONSTRAINT instituto_pkey;
       public                 postgres    false    234            �           2606    16912    jerarquia jerarquia_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.jerarquia
    ADD CONSTRAINT jerarquia_pkey PRIMARY KEY (id_jerarquia);
 B   ALTER TABLE ONLY public.jerarquia DROP CONSTRAINT jerarquia_pkey;
       public                 postgres    false    237            �           2606    16914    kingdom kingdom_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.kingdom
    ADD CONSTRAINT kingdom_pkey PRIMARY KEY (id_kingdom);
 >   ALTER TABLE ONLY public.kingdom DROP CONSTRAINT kingdom_pkey;
       public                 postgres    false    239            �           2606    16916 8   participacion_recoleccion participacion_recoleccion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.participacion_recoleccion
    ADD CONSTRAINT participacion_recoleccion_pkey PRIMARY KEY (id_recoleccion, id_trabajador);
 b   ALTER TABLE ONLY public.participacion_recoleccion DROP CONSTRAINT participacion_recoleccion_pkey;
       public                 postgres    false    241    241            �           2606    16918    persona persona_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public                 postgres    false    242            �           2606    16920    phylum phylum_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.phylum
    ADD CONSTRAINT phylum_pkey PRIMARY KEY (id_phylum);
 <   ALTER TABLE ONLY public.phylum DROP CONSTRAINT phylum_pkey;
       public                 postgres    false    244            �           2606    16922    taxon_coleta taxon_coleta_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.taxon_coleta
    ADD CONSTRAINT taxon_coleta_pkey PRIMARY KEY (id_recoleccion, especimen);
 H   ALTER TABLE ONLY public.taxon_coleta DROP CONSTRAINT taxon_coleta_pkey;
       public                 postgres    false    246    246            �           2606    16924    taxonomia taxonomia_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_pkey PRIMARY KEY (taxonid);
 B   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_pkey;
       public                 postgres    false    247            �           2606    16926 "   taxonomiaorder taxonomiaorder_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.taxonomiaorder
    ADD CONSTRAINT taxonomiaorder_pkey PRIMARY KEY (id_order);
 L   ALTER TABLE ONLY public.taxonomiaorder DROP CONSTRAINT taxonomiaorder_pkey;
       public                 postgres    false    248            �           2606    16928 2   trabajador_institucion trabajador_institucion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.trabajador_institucion
    ADD CONSTRAINT trabajador_institucion_pkey PRIMARY KEY (id_trabajador, id_institucion);
 \   ALTER TABLE ONLY public.trabajador_institucion DROP CONSTRAINT trabajador_institucion_pkey;
       public                 postgres    false    252    252            �           2606    16930    trabajador trabajador_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_pkey PRIMARY KEY (id_trabajador);
 D   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_pkey;
       public                 postgres    false    250            �           2606    16932    ubicacion ubicacion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.ubicacion
    ADD CONSTRAINT ubicacion_pkey PRIMARY KEY (id_ubicacion);
 B   ALTER TABLE ONLY public.ubicacion DROP CONSTRAINT ubicacion_pkey;
       public                 postgres    false    253                        2606    16933    class class_id_phylum_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_id_phylum_fkey FOREIGN KEY (id_phylum) REFERENCES public.phylum(id_phylum) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.class DROP CONSTRAINT class_id_phylum_fkey;
       public               postgres    false    244    217    4851                       2606    16938 7   especimen_imagenes especimen_imagenes_id_especimen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.especimen_imagenes
    ADD CONSTRAINT especimen_imagenes_id_especimen_fkey FOREIGN KEY (id_especimen) REFERENCES public.especimen(catalognumber);
 a   ALTER TABLE ONLY public.especimen_imagenes DROP CONSTRAINT especimen_imagenes_id_especimen_fkey;
       public               postgres    false    221    4825    223                       2606    16943 2   especimen_imagenes especimen_imagenes_id_foto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.especimen_imagenes
    ADD CONSTRAINT especimen_imagenes_id_foto_fkey FOREIGN KEY (id_foto) REFERENCES public.imagenes(id_foto);
 \   ALTER TABLE ONLY public.especimen_imagenes DROP CONSTRAINT especimen_imagenes_id_foto_fkey;
       public               postgres    false    223    4835    230                       2606    16948 9   evento_de_coleccion evento_de_coleccion_id_ubicacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.evento_de_coleccion
    ADD CONSTRAINT evento_de_coleccion_id_ubicacion_fkey FOREIGN KEY (id_ubicacion) REFERENCES public.ubicacion(id_ubicacion) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.evento_de_coleccion DROP CONSTRAINT evento_de_coleccion_id_ubicacion_fkey;
       public               postgres    false    253    224    4863                       2606    16953    family family_id_order_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.family
    ADD CONSTRAINT family_id_order_fkey FOREIGN KEY (id_order) REFERENCES public.taxonomiaorder(id_order) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.family DROP CONSTRAINT family_id_order_fkey;
       public               postgres    false    248    226    4857                       2606    16958    genus genus_id_family_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.genus
    ADD CONSTRAINT genus_id_family_fkey FOREIGN KEY (id_family) REFERENCES public.family(id_family) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.genus DROP CONSTRAINT genus_id_family_fkey;
       public               postgres    false    4831    226    228                       2606    16963 -   info_recoleccion info_recoleccion_evento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.info_recoleccion
    ADD CONSTRAINT info_recoleccion_evento_fkey FOREIGN KEY (evento) REFERENCES public.evento_de_coleccion(id_evento_recoleccion) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.info_recoleccion DROP CONSTRAINT info_recoleccion_evento_fkey;
       public               postgres    false    4829    224    232                       2606    16968 @   instituto_colectas instituto_colectas_id_evento_recoleccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.instituto_colectas
    ADD CONSTRAINT instituto_colectas_id_evento_recoleccion_fkey FOREIGN KEY (id_evento_recoleccion) REFERENCES public.evento_de_coleccion(id_evento_recoleccion);
 j   ALTER TABLE ONLY public.instituto_colectas DROP CONSTRAINT instituto_colectas_id_evento_recoleccion_fkey;
       public               postgres    false    224    235    4829                       2606    16973 9   instituto_colectas instituto_colectas_id_institucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.instituto_colectas
    ADD CONSTRAINT instituto_colectas_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.instituto(id_instituto);
 c   ALTER TABLE ONLY public.instituto_colectas DROP CONSTRAINT instituto_colectas_id_institucion_fkey;
       public               postgres    false    4839    235    234            	           2606    16978 G   participacion_recoleccion participacion_recoleccion_id_recoleccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.participacion_recoleccion
    ADD CONSTRAINT participacion_recoleccion_id_recoleccion_fkey FOREIGN KEY (id_recoleccion) REFERENCES public.info_recoleccion(id_recoleccion);
 q   ALTER TABLE ONLY public.participacion_recoleccion DROP CONSTRAINT participacion_recoleccion_id_recoleccion_fkey;
       public               postgres    false    241    232    4837            
           2606    16983 F   participacion_recoleccion participacion_recoleccion_id_trabajador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.participacion_recoleccion
    ADD CONSTRAINT participacion_recoleccion_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES public.trabajador(id_trabajador);
 p   ALTER TABLE ONLY public.participacion_recoleccion DROP CONSTRAINT participacion_recoleccion_id_trabajador_fkey;
       public               postgres    false    4859    241    250                       2606    16988    phylum phylum_id_reino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.phylum
    ADD CONSTRAINT phylum_id_reino_fkey FOREIGN KEY (id_reino) REFERENCES public.kingdom(id_kingdom) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.phylum DROP CONSTRAINT phylum_id_reino_fkey;
       public               postgres    false    239    244    4845                       2606    16993 (   taxon_coleta taxon_coleta_especimen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxon_coleta
    ADD CONSTRAINT taxon_coleta_especimen_fkey FOREIGN KEY (especimen) REFERENCES public.especimen(catalognumber);
 R   ALTER TABLE ONLY public.taxon_coleta DROP CONSTRAINT taxon_coleta_especimen_fkey;
       public               postgres    false    246    221    4825                       2606    16998 -   taxon_coleta taxon_coleta_id_recoleccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxon_coleta
    ADD CONSTRAINT taxon_coleta_id_recoleccion_fkey FOREIGN KEY (id_recoleccion) REFERENCES public.info_recoleccion(id_recoleccion);
 W   ALTER TABLE ONLY public.taxon_coleta DROP CONSTRAINT taxon_coleta_id_recoleccion_fkey;
       public               postgres    false    246    232    4837                       2606    17003    taxonomia taxonomia_class_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_class_fkey FOREIGN KEY (class) REFERENCES public.class(id_class) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_class_fkey;
       public               postgres    false    247    217    4821                       2606    17008    taxonomia taxonomia_family_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_family_fkey FOREIGN KEY (family) REFERENCES public.family(id_family) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_family_fkey;
       public               postgres    false    247    226    4831                       2606    17013    taxonomia taxonomia_genus_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_genus_fkey FOREIGN KEY (genus) REFERENCES public.genus(id_genus) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_genus_fkey;
       public               postgres    false    247    4833    228                       2606    17018 %   taxonomia taxonomia_id_especimen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_id_especimen_fkey FOREIGN KEY (id_especimen) REFERENCES public.especimen(catalognumber);
 O   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_id_especimen_fkey;
       public               postgres    false    4825    247    221                       2606    17023     taxonomia taxonomia_kingdom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_kingdom_fkey FOREIGN KEY (kingdom) REFERENCES public.kingdom(id_kingdom) ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_kingdom_fkey;
       public               postgres    false    4845    247    239                       2606    17028 (   taxonomia taxonomia_order_taxonomia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_order_taxonomia_fkey FOREIGN KEY (order_taxonomia) REFERENCES public.taxonomiaorder(id_order) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_order_taxonomia_fkey;
       public               postgres    false    4857    247    248                       2606    17033    taxonomia taxonomia_phylum_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_phylum_fkey FOREIGN KEY (phylum) REFERENCES public.phylum(id_phylum) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_phylum_fkey;
       public               postgres    false    247    244    4851                       2606    17038 (   taxonomia taxonomia_specificepithet_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_specificepithet_fkey FOREIGN KEY (specificepithet) REFERENCES public.epiteloespecifico(id_specificepithet) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_specificepithet_fkey;
       public               postgres    false    219    247    4823                       2606    17043 +   taxonomiaorder taxonomiaorder_id_class_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomiaorder
    ADD CONSTRAINT taxonomiaorder_id_class_fkey FOREIGN KEY (id_class) REFERENCES public.class(id_class) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.taxonomiaorder DROP CONSTRAINT taxonomiaorder_id_class_fkey;
       public               postgres    false    248    4821    217                       2606    17048 %   trabajador trabajador_id_persona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_id_persona_fkey;
       public               postgres    false    242    4849    250                       2606    17053 A   trabajador_institucion trabajador_institucion_id_institucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador_institucion
    ADD CONSTRAINT trabajador_institucion_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.instituto(id_instituto);
 k   ALTER TABLE ONLY public.trabajador_institucion DROP CONSTRAINT trabajador_institucion_id_institucion_fkey;
       public               postgres    false    252    4839    234                       2606    17058 @   trabajador_institucion trabajador_institucion_id_trabajador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador_institucion
    ADD CONSTRAINT trabajador_institucion_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES public.trabajador(id_trabajador);
 j   ALTER TABLE ONLY public.trabajador_institucion DROP CONSTRAINT trabajador_institucion_id_trabajador_fkey;
       public               postgres    false    250    252    4859                       2606    17063 *   trabajador trabajador_tipo_trabajador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_tipo_trabajador_fkey FOREIGN KEY (tipo_trabajador) REFERENCES public.jerarquia(id_jerarquia) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_tipo_trabajador_fkey;
       public               postgres    false    250    4843    237            �      x�3���+NM.I�4����� )��      �   2   x�3�LN�-H-.)�,�2��ML�H���2��H-J.�IM�+-����� +�2      �   y   x�u�;
�@�Z:Ş �'u0�J��F��Jf?9��.��f�z�3r��ʹ$��k(GVQ�+v0�*A�E��ҏ`�B�����J�n��k`�z:ʭڡ>�m�t�"n��2�      �      x�3�4�2�4����� �      �   W   x�m��� C��,�i/��,�?��Bү�WvFKA
�+�\����j|y±�e�7�g���n��@�K�<ǃlz���"a      �   4   x�3�tN,JL�LIL�4�2�H,������r�q���f&��f\1z\\\ �"i      �   6   x�3�t�L��KI�I�4�2�H,�����4�2�tN�-���/)-�4����� 9K�      �   D   x�3��())(���O�H�-�I�K�����MLO-�O�L��KI�I��*H�2§� � 3'3�0F��� �6�      �      x�3�4�2�4�2�4�2������� m�      �      x������ � �      �      x������ � �      �   2   x�3�(�OK-�/�2��LI�+�L�LNL�9�R��sR�K��=... Re      �      x�3�t���M��L����� '      �      x�3�4�2�4�2�&@:F��� y�      �   �   x�3��)�,�t�L��46�4555426153��M��LN���2�t�I��N���K,�4� ���07351��J�2��*M��x�0�(h�H�.�0� 3����DN�C�
�� F�m��t����M�)����� �U+J      �      x�3�t,*�(�/�OI�4����� @)@      �      x�3�4�2�4�2�4�2�1z\\\ +�      �   �   x���=n�0Fg�� ɢ(j�ԭ�"Qb���ؾݦ?s�@�Ç�7f�1���V�P��uG��1�A�l*�j.�LKӹRnw��Ǵ�p>�+	]�D�D@�r[�SŞɡ��Ʒr��inE�e]�e�C쑡bʀ�
�9��s���(9��;��eݏm��C�Y�r�����x�`T��%z��w&锝���/��&�W�      �   -   x�3�t��I�/(I-J�4�2��I-�L���8=*sS���=... ��H      �   #   x�3�4�4�2�B.c�?Nc.e����� D�d      �      x������ � �      �   �   x�E�M�0�ׯ��h|-��5nЍa�,/CZ�Ǹ�n��G�$%��f���@�b�S��Uh�����P#���z��.@���r;���{Y����{v"�
S�e��L ���{�=TܝI�t$�O҅q�B�^��V���$B�᷿B�:�^+!�S�90     