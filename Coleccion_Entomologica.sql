PGDMP  $    '                |            ColeccionEntomologica    17.2    17.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    24576    ColeccionEntomologica    DATABASE     �   CREATE DATABASE "ColeccionEntomologica" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
 '   DROP DATABASE "ColeccionEntomologica";
                     postgres    false            �            1259    24846    class    TABLE     r   CREATE TABLE public.class (
    id_class integer NOT NULL,
    name_class text NOT NULL,
    id_phylum integer
);
    DROP TABLE public.class;
       public         heap r       postgres    false            �            1259    24845    class_id_class_seq    SEQUENCE     �   CREATE SEQUENCE public.class_id_class_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.class_id_class_seq;
       public               postgres    false    222            �           0    0    class_id_class_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.class_id_class_seq OWNED BY public.class.id_class;
          public               postgres    false    221            �            1259    24902    epiteloespecifico    TABLE     n   CREATE TABLE public.epiteloespecifico (
    id_specificepithet integer NOT NULL,
    epithet text NOT NULL
);
 %   DROP TABLE public.epiteloespecifico;
       public         heap r       postgres    false            �            1259    24901 (   epiteloespecifico_id_specificepithet_seq    SEQUENCE     �   CREATE SEQUENCE public.epiteloespecifico_id_specificepithet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.epiteloespecifico_id_specificepithet_seq;
       public               postgres    false    230                        0    0 (   epiteloespecifico_id_specificepithet_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.epiteloespecifico_id_specificepithet_seq OWNED BY public.epiteloespecifico.id_specificepithet;
          public               postgres    false    229            �            1259    24911 	   especimen    TABLE     �   CREATE TABLE public.especimen (
    catalognumber integer NOT NULL,
    scientificname text NOT NULL,
    lifestage text,
    sex text,
    individualcount integer
);
    DROP TABLE public.especimen;
       public         heap r       postgres    false            �            1259    24910    especimen_catalognumber_seq    SEQUENCE     �   CREATE SEQUENCE public.especimen_catalognumber_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.especimen_catalognumber_seq;
       public               postgres    false    232                       0    0    especimen_catalognumber_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.especimen_catalognumber_seq OWNED BY public.especimen.catalognumber;
          public               postgres    false    231            �            1259    25066    especimen_imagenes    TABLE     l   CREATE TABLE public.especimen_imagenes (
    id_especimen integer NOT NULL,
    id_foto integer NOT NULL
);
 &   DROP TABLE public.especimen_imagenes;
       public         heap r       postgres    false            �            1259    24938    evento_de_coleccion    TABLE     �   CREATE TABLE public.evento_de_coleccion (
    id_evento_recoleccion integer NOT NULL,
    event_date timestamp without time zone NOT NULL,
    id_ubicacion integer
);
 '   DROP TABLE public.evento_de_coleccion;
       public         heap r       postgres    false            �            1259    24937 -   evento_de_coleccion_id_evento_recoleccion_seq    SEQUENCE     �   CREATE SEQUENCE public.evento_de_coleccion_id_evento_recoleccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.evento_de_coleccion_id_evento_recoleccion_seq;
       public               postgres    false    238                       0    0 -   evento_de_coleccion_id_evento_recoleccion_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.evento_de_coleccion_id_evento_recoleccion_seq OWNED BY public.evento_de_coleccion.id_evento_recoleccion;
          public               postgres    false    237            �            1259    24874    family    TABLE     t   CREATE TABLE public.family (
    id_family integer NOT NULL,
    name_family text NOT NULL,
    id_order integer
);
    DROP TABLE public.family;
       public         heap r       postgres    false            �            1259    24873    family_id_family_seq    SEQUENCE     �   CREATE SEQUENCE public.family_id_family_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.family_id_family_seq;
       public               postgres    false    226                       0    0    family_id_family_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.family_id_family_seq OWNED BY public.family.id_family;
          public               postgres    false    225            �            1259    24888    genus    TABLE     m   CREATE TABLE public.genus (
    id_genus integer NOT NULL,
    genus text NOT NULL,
    id_family integer
);
    DROP TABLE public.genus;
       public         heap r       postgres    false            �            1259    24887    genus_id_genus_seq    SEQUENCE     �   CREATE SEQUENCE public.genus_id_genus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.genus_id_genus_seq;
       public               postgres    false    228                       0    0    genus_id_genus_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.genus_id_genus_seq OWNED BY public.genus.id_genus;
          public               postgres    false    227            �            1259    24920    imagenes    TABLE     V   CREATE TABLE public.imagenes (
    id_foto integer NOT NULL,
    url text NOT NULL
);
    DROP TABLE public.imagenes;
       public         heap r       postgres    false            �            1259    24919    imagenes_id_foto_seq    SEQUENCE     �   CREATE SEQUENCE public.imagenes_id_foto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.imagenes_id_foto_seq;
       public               postgres    false    234                       0    0    imagenes_id_foto_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.imagenes_id_foto_seq OWNED BY public.imagenes.id_foto;
          public               postgres    false    233            �            1259    24950    info_recoleccion    TABLE     b   CREATE TABLE public.info_recoleccion (
    id_recoleccion integer NOT NULL,
    evento integer
);
 $   DROP TABLE public.info_recoleccion;
       public         heap r       postgres    false            �            1259    24949 #   info_recoleccion_id_recoleccion_seq    SEQUENCE     �   CREATE SEQUENCE public.info_recoleccion_id_recoleccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.info_recoleccion_id_recoleccion_seq;
       public               postgres    false    240                       0    0 #   info_recoleccion_id_recoleccion_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.info_recoleccion_id_recoleccion_seq OWNED BY public.info_recoleccion.id_recoleccion;
          public               postgres    false    239            �            1259    24998 	   instituto    TABLE     s   CREATE TABLE public.instituto (
    id_instituto integer NOT NULL,
    nombre text NOT NULL,
    direccion text
);
    DROP TABLE public.instituto;
       public         heap r       postgres    false            �            1259    25021    instituto_colectas    TABLE     |   CREATE TABLE public.instituto_colectas (
    id_institucion integer NOT NULL,
    id_evento_recoleccion integer NOT NULL
);
 &   DROP TABLE public.instituto_colectas;
       public         heap r       postgres    false            �            1259    24997    instituto_id_instituto_seq    SEQUENCE     �   CREATE SEQUENCE public.instituto_id_instituto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.instituto_id_instituto_seq;
       public               postgres    false    248                       0    0    instituto_id_instituto_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.instituto_id_instituto_seq OWNED BY public.instituto.id_instituto;
          public               postgres    false    247            �            1259    24972 	   jerarquia    TABLE     _   CREATE TABLE public.jerarquia (
    id_jerarquia integer NOT NULL,
    nombre text NOT NULL
);
    DROP TABLE public.jerarquia;
       public         heap r       postgres    false            �            1259    24971    jerarquia_id_jerarquia_seq    SEQUENCE     �   CREATE SEQUENCE public.jerarquia_id_jerarquia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.jerarquia_id_jerarquia_seq;
       public               postgres    false    244                       0    0    jerarquia_id_jerarquia_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.jerarquia_id_jerarquia_seq OWNED BY public.jerarquia.id_jerarquia;
          public               postgres    false    243            �            1259    24823    kingdom    TABLE     a   CREATE TABLE public.kingdom (
    id_kingdom integer NOT NULL,
    name_kingdom text NOT NULL
);
    DROP TABLE public.kingdom;
       public         heap r       postgres    false            �            1259    24822    kingdom_id_kingdom_seq    SEQUENCE     �   CREATE SEQUENCE public.kingdom_id_kingdom_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.kingdom_id_kingdom_seq;
       public               postgres    false    218            	           0    0    kingdom_id_kingdom_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.kingdom_id_kingdom_seq OWNED BY public.kingdom.id_kingdom;
          public               postgres    false    217            �            1259    25051    participacion_recoleccion    TABLE     {   CREATE TABLE public.participacion_recoleccion (
    id_recoleccion integer NOT NULL,
    id_trabajador integer NOT NULL
);
 -   DROP TABLE public.participacion_recoleccion;
       public         heap r       postgres    false            �            1259    24962    persona    TABLE     �   CREATE TABLE public.persona (
    id_persona integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    edad integer,
    telefono text,
    nacionalidad text,
    CONSTRAINT persona_edad_check CHECK ((edad >= 0))
);
    DROP TABLE public.persona;
       public         heap r       postgres    false            �            1259    24961    persona_id_persona_seq    SEQUENCE     �   CREATE SEQUENCE public.persona_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.persona_id_persona_seq;
       public               postgres    false    242            
           0    0    persona_id_persona_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.persona_id_persona_seq OWNED BY public.persona.id_persona;
          public               postgres    false    241            �            1259    24832    phylum    TABLE     t   CREATE TABLE public.phylum (
    id_phylum integer NOT NULL,
    name_phylum text NOT NULL,
    id_reino integer
);
    DROP TABLE public.phylum;
       public         heap r       postgres    false            �            1259    24831    phylum_id_phylum_seq    SEQUENCE     �   CREATE SEQUENCE public.phylum_id_phylum_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.phylum_id_phylum_seq;
       public               postgres    false    220                       0    0    phylum_id_phylum_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.phylum_id_phylum_seq OWNED BY public.phylum.id_phylum;
          public               postgres    false    219            �            1259    25036    taxon_coleta    TABLE     j   CREATE TABLE public.taxon_coleta (
    id_recoleccion integer NOT NULL,
    especimen integer NOT NULL
);
     DROP TABLE public.taxon_coleta;
       public         heap r       postgres    false            �            1259    25081 	   taxonomia    TABLE     H  CREATE TABLE public.taxonomia (
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
       public         heap r       postgres    false            �            1259    24860    taxonomiaorder    TABLE     z   CREATE TABLE public.taxonomiaorder (
    id_order integer NOT NULL,
    name_order text NOT NULL,
    id_class integer
);
 "   DROP TABLE public.taxonomiaorder;
       public         heap r       postgres    false            �            1259    24859    taxonomiaorder_id_order_seq    SEQUENCE     �   CREATE SEQUENCE public.taxonomiaorder_id_order_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.taxonomiaorder_id_order_seq;
       public               postgres    false    224                       0    0    taxonomiaorder_id_order_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.taxonomiaorder_id_order_seq OWNED BY public.taxonomiaorder.id_order;
          public               postgres    false    223            �            1259    24981 
   trabajador    TABLE     |   CREATE TABLE public.trabajador (
    id_trabajador integer NOT NULL,
    tipo_trabajador integer,
    id_persona integer
);
    DROP TABLE public.trabajador;
       public         heap r       postgres    false            �            1259    24980    trabajador_id_trabajador_seq    SEQUENCE     �   CREATE SEQUENCE public.trabajador_id_trabajador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.trabajador_id_trabajador_seq;
       public               postgres    false    246                       0    0    trabajador_id_trabajador_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.trabajador_id_trabajador_seq OWNED BY public.trabajador.id_trabajador;
          public               postgres    false    245            �            1259    25006    trabajador_institucion    TABLE     x   CREATE TABLE public.trabajador_institucion (
    id_trabajador integer NOT NULL,
    id_institucion integer NOT NULL
);
 *   DROP TABLE public.trabajador_institucion;
       public         heap r       postgres    false            �            1259    24929 	   ubicacion    TABLE     �   CREATE TABLE public.ubicacion (
    id_ubicacion integer NOT NULL,
    latitud numeric,
    longitud numeric,
    altitud numeric,
    locality text,
    habitat text,
    notas text
);
    DROP TABLE public.ubicacion;
       public         heap r       postgres    false            �            1259    24928    ubicacion_id_ubicacion_seq    SEQUENCE     �   CREATE SEQUENCE public.ubicacion_id_ubicacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.ubicacion_id_ubicacion_seq;
       public               postgres    false    236                       0    0    ubicacion_id_ubicacion_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.ubicacion_id_ubicacion_seq OWNED BY public.ubicacion.id_ubicacion;
          public               postgres    false    235            �           2604    24849    class id_class    DEFAULT     p   ALTER TABLE ONLY public.class ALTER COLUMN id_class SET DEFAULT nextval('public.class_id_class_seq'::regclass);
 =   ALTER TABLE public.class ALTER COLUMN id_class DROP DEFAULT;
       public               postgres    false    222    221    222            �           2604    24905 $   epiteloespecifico id_specificepithet    DEFAULT     �   ALTER TABLE ONLY public.epiteloespecifico ALTER COLUMN id_specificepithet SET DEFAULT nextval('public.epiteloespecifico_id_specificepithet_seq'::regclass);
 S   ALTER TABLE public.epiteloespecifico ALTER COLUMN id_specificepithet DROP DEFAULT;
       public               postgres    false    229    230    230            �           2604    24914    especimen catalognumber    DEFAULT     �   ALTER TABLE ONLY public.especimen ALTER COLUMN catalognumber SET DEFAULT nextval('public.especimen_catalognumber_seq'::regclass);
 F   ALTER TABLE public.especimen ALTER COLUMN catalognumber DROP DEFAULT;
       public               postgres    false    231    232    232            �           2604    24941 )   evento_de_coleccion id_evento_recoleccion    DEFAULT     �   ALTER TABLE ONLY public.evento_de_coleccion ALTER COLUMN id_evento_recoleccion SET DEFAULT nextval('public.evento_de_coleccion_id_evento_recoleccion_seq'::regclass);
 X   ALTER TABLE public.evento_de_coleccion ALTER COLUMN id_evento_recoleccion DROP DEFAULT;
       public               postgres    false    238    237    238            �           2604    24877    family id_family    DEFAULT     t   ALTER TABLE ONLY public.family ALTER COLUMN id_family SET DEFAULT nextval('public.family_id_family_seq'::regclass);
 ?   ALTER TABLE public.family ALTER COLUMN id_family DROP DEFAULT;
       public               postgres    false    226    225    226            �           2604    24891    genus id_genus    DEFAULT     p   ALTER TABLE ONLY public.genus ALTER COLUMN id_genus SET DEFAULT nextval('public.genus_id_genus_seq'::regclass);
 =   ALTER TABLE public.genus ALTER COLUMN id_genus DROP DEFAULT;
       public               postgres    false    227    228    228            �           2604    24923    imagenes id_foto    DEFAULT     t   ALTER TABLE ONLY public.imagenes ALTER COLUMN id_foto SET DEFAULT nextval('public.imagenes_id_foto_seq'::regclass);
 ?   ALTER TABLE public.imagenes ALTER COLUMN id_foto DROP DEFAULT;
       public               postgres    false    233    234    234            �           2604    24953    info_recoleccion id_recoleccion    DEFAULT     �   ALTER TABLE ONLY public.info_recoleccion ALTER COLUMN id_recoleccion SET DEFAULT nextval('public.info_recoleccion_id_recoleccion_seq'::regclass);
 N   ALTER TABLE public.info_recoleccion ALTER COLUMN id_recoleccion DROP DEFAULT;
       public               postgres    false    240    239    240            �           2604    25001    instituto id_instituto    DEFAULT     �   ALTER TABLE ONLY public.instituto ALTER COLUMN id_instituto SET DEFAULT nextval('public.instituto_id_instituto_seq'::regclass);
 E   ALTER TABLE public.instituto ALTER COLUMN id_instituto DROP DEFAULT;
       public               postgres    false    248    247    248            �           2604    24975    jerarquia id_jerarquia    DEFAULT     �   ALTER TABLE ONLY public.jerarquia ALTER COLUMN id_jerarquia SET DEFAULT nextval('public.jerarquia_id_jerarquia_seq'::regclass);
 E   ALTER TABLE public.jerarquia ALTER COLUMN id_jerarquia DROP DEFAULT;
       public               postgres    false    244    243    244            �           2604    24826    kingdom id_kingdom    DEFAULT     x   ALTER TABLE ONLY public.kingdom ALTER COLUMN id_kingdom SET DEFAULT nextval('public.kingdom_id_kingdom_seq'::regclass);
 A   ALTER TABLE public.kingdom ALTER COLUMN id_kingdom DROP DEFAULT;
       public               postgres    false    217    218    218            �           2604    24965    persona id_persona    DEFAULT     x   ALTER TABLE ONLY public.persona ALTER COLUMN id_persona SET DEFAULT nextval('public.persona_id_persona_seq'::regclass);
 A   ALTER TABLE public.persona ALTER COLUMN id_persona DROP DEFAULT;
       public               postgres    false    241    242    242            �           2604    24835    phylum id_phylum    DEFAULT     t   ALTER TABLE ONLY public.phylum ALTER COLUMN id_phylum SET DEFAULT nextval('public.phylum_id_phylum_seq'::regclass);
 ?   ALTER TABLE public.phylum ALTER COLUMN id_phylum DROP DEFAULT;
       public               postgres    false    220    219    220            �           2604    24863    taxonomiaorder id_order    DEFAULT     �   ALTER TABLE ONLY public.taxonomiaorder ALTER COLUMN id_order SET DEFAULT nextval('public.taxonomiaorder_id_order_seq'::regclass);
 F   ALTER TABLE public.taxonomiaorder ALTER COLUMN id_order DROP DEFAULT;
       public               postgres    false    224    223    224            �           2604    24984    trabajador id_trabajador    DEFAULT     �   ALTER TABLE ONLY public.trabajador ALTER COLUMN id_trabajador SET DEFAULT nextval('public.trabajador_id_trabajador_seq'::regclass);
 G   ALTER TABLE public.trabajador ALTER COLUMN id_trabajador DROP DEFAULT;
       public               postgres    false    246    245    246            �           2604    24932    ubicacion id_ubicacion    DEFAULT     �   ALTER TABLE ONLY public.ubicacion ALTER COLUMN id_ubicacion SET DEFAULT nextval('public.ubicacion_id_ubicacion_seq'::regclass);
 E   ALTER TABLE public.ubicacion ALTER COLUMN id_ubicacion DROP DEFAULT;
       public               postgres    false    235    236    236            �          0    24846    class 
   TABLE DATA           @   COPY public.class (id_class, name_class, id_phylum) FROM stdin;
    public               postgres    false    222   
�       �          0    24902    epiteloespecifico 
   TABLE DATA           H   COPY public.epiteloespecifico (id_specificepithet, epithet) FROM stdin;
    public               postgres    false    230   3�       �          0    24911 	   especimen 
   TABLE DATA           c   COPY public.especimen (catalognumber, scientificname, lifestage, sex, individualcount) FROM stdin;
    public               postgres    false    232   u�       �          0    25066    especimen_imagenes 
   TABLE DATA           C   COPY public.especimen_imagenes (id_especimen, id_foto) FROM stdin;
    public               postgres    false    253   ��       �          0    24938    evento_de_coleccion 
   TABLE DATA           ^   COPY public.evento_de_coleccion (id_evento_recoleccion, event_date, id_ubicacion) FROM stdin;
    public               postgres    false    238   �       �          0    24874    family 
   TABLE DATA           B   COPY public.family (id_family, name_family, id_order) FROM stdin;
    public               postgres    false    226   Y�       �          0    24888    genus 
   TABLE DATA           ;   COPY public.genus (id_genus, genus, id_family) FROM stdin;
    public               postgres    false    228   ��       �          0    24920    imagenes 
   TABLE DATA           0   COPY public.imagenes (id_foto, url) FROM stdin;
    public               postgres    false    234   ��       �          0    24950    info_recoleccion 
   TABLE DATA           B   COPY public.info_recoleccion (id_recoleccion, evento) FROM stdin;
    public               postgres    false    240   7�       �          0    24998 	   instituto 
   TABLE DATA           D   COPY public.instituto (id_instituto, nombre, direccion) FROM stdin;
    public               postgres    false    248   \�       �          0    25021    instituto_colectas 
   TABLE DATA           S   COPY public.instituto_colectas (id_institucion, id_evento_recoleccion) FROM stdin;
    public               postgres    false    250   ��       �          0    24972 	   jerarquia 
   TABLE DATA           9   COPY public.jerarquia (id_jerarquia, nombre) FROM stdin;
    public               postgres    false    244   ��       �          0    24823    kingdom 
   TABLE DATA           ;   COPY public.kingdom (id_kingdom, name_kingdom) FROM stdin;
    public               postgres    false    218   ��       �          0    25051    participacion_recoleccion 
   TABLE DATA           R   COPY public.participacion_recoleccion (id_recoleccion, id_trabajador) FROM stdin;
    public               postgres    false    252   �       �          0    24962    persona 
   TABLE DATA           ]   COPY public.persona (id_persona, nombre, apellido, edad, telefono, nacionalidad) FROM stdin;
    public               postgres    false    242   ?�       �          0    24832    phylum 
   TABLE DATA           B   COPY public.phylum (id_phylum, name_phylum, id_reino) FROM stdin;
    public               postgres    false    220   ��       �          0    25036    taxon_coleta 
   TABLE DATA           A   COPY public.taxon_coleta (id_recoleccion, especimen) FROM stdin;
    public               postgres    false    251   ��       �          0    25081 	   taxonomia 
   TABLE DATA           �   COPY public.taxonomia (taxonid, id_especimen, tipo, scientificname, kingdom, phylum, class, order_taxonomia, family, genus, specificepithet) FROM stdin;
    public               postgres    false    254   ��       �          0    24860    taxonomiaorder 
   TABLE DATA           H   COPY public.taxonomiaorder (id_order, name_order, id_class) FROM stdin;
    public               postgres    false    224   �       �          0    24981 
   trabajador 
   TABLE DATA           P   COPY public.trabajador (id_trabajador, tipo_trabajador, id_persona) FROM stdin;
    public               postgres    false    246   H�       �          0    25006    trabajador_institucion 
   TABLE DATA           O   COPY public.trabajador_institucion (id_trabajador, id_institucion) FROM stdin;
    public               postgres    false    249   o�       �          0    24929 	   ubicacion 
   TABLE DATA           g   COPY public.ubicacion (id_ubicacion, latitud, longitud, altitud, locality, habitat, notas) FROM stdin;
    public               postgres    false    236   ��                  0    0    class_id_class_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.class_id_class_seq', 3, true);
          public               postgres    false    221                       0    0 (   epiteloespecifico_id_specificepithet_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.epiteloespecifico_id_specificepithet_seq', 6, true);
          public               postgres    false    229                       0    0    especimen_catalognumber_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.especimen_catalognumber_seq', 6, true);
          public               postgres    false    231                       0    0 -   evento_de_coleccion_id_evento_recoleccion_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.evento_de_coleccion_id_evento_recoleccion_seq', 6, true);
          public               postgres    false    237                       0    0    family_id_family_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.family_id_family_seq', 6, true);
          public               postgres    false    225                       0    0    genus_id_genus_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.genus_id_genus_seq', 6, true);
          public               postgres    false    227                       0    0    imagenes_id_foto_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.imagenes_id_foto_seq', 2, true);
          public               postgres    false    233                       0    0 #   info_recoleccion_id_recoleccion_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.info_recoleccion_id_recoleccion_seq', 2, true);
          public               postgres    false    239                       0    0    instituto_id_instituto_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.instituto_id_instituto_seq', 1, true);
          public               postgres    false    247                       0    0    jerarquia_id_jerarquia_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.jerarquia_id_jerarquia_seq', 3, true);
          public               postgres    false    243                       0    0    kingdom_id_kingdom_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.kingdom_id_kingdom_seq', 3, true);
          public               postgres    false    217                       0    0    persona_id_persona_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.persona_id_persona_seq', 2, true);
          public               postgres    false    241                       0    0    phylum_id_phylum_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.phylum_id_phylum_seq', 4, true);
          public               postgres    false    219                       0    0    taxonomiaorder_id_order_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.taxonomiaorder_id_order_seq', 6, true);
          public               postgres    false    223                       0    0    trabajador_id_trabajador_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.trabajador_id_trabajador_seq', 2, true);
          public               postgres    false    245                       0    0    ubicacion_id_ubicacion_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.ubicacion_id_ubicacion_seq', 4, true);
          public               postgres    false    235                        2606    24853    class class_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (id_class);
 :   ALTER TABLE ONLY public.class DROP CONSTRAINT class_pkey;
       public                 postgres    false    222                       2606    24909 (   epiteloespecifico epiteloespecifico_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.epiteloespecifico
    ADD CONSTRAINT epiteloespecifico_pkey PRIMARY KEY (id_specificepithet);
 R   ALTER TABLE ONLY public.epiteloespecifico DROP CONSTRAINT epiteloespecifico_pkey;
       public                 postgres    false    230            $           2606    25070 *   especimen_imagenes especimen_imagenes_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.especimen_imagenes
    ADD CONSTRAINT especimen_imagenes_pkey PRIMARY KEY (id_especimen, id_foto);
 T   ALTER TABLE ONLY public.especimen_imagenes DROP CONSTRAINT especimen_imagenes_pkey;
       public                 postgres    false    253    253            
           2606    24918    especimen especimen_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.especimen
    ADD CONSTRAINT especimen_pkey PRIMARY KEY (catalognumber);
 B   ALTER TABLE ONLY public.especimen DROP CONSTRAINT especimen_pkey;
       public                 postgres    false    232                       2606    24943 ,   evento_de_coleccion evento_de_coleccion_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.evento_de_coleccion
    ADD CONSTRAINT evento_de_coleccion_pkey PRIMARY KEY (id_evento_recoleccion);
 V   ALTER TABLE ONLY public.evento_de_coleccion DROP CONSTRAINT evento_de_coleccion_pkey;
       public                 postgres    false    238                       2606    24881    family family_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.family
    ADD CONSTRAINT family_pkey PRIMARY KEY (id_family);
 <   ALTER TABLE ONLY public.family DROP CONSTRAINT family_pkey;
       public                 postgres    false    226                       2606    24895    genus genus_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.genus
    ADD CONSTRAINT genus_pkey PRIMARY KEY (id_genus);
 :   ALTER TABLE ONLY public.genus DROP CONSTRAINT genus_pkey;
       public                 postgres    false    228                       2606    24927    imagenes imagenes_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id_foto);
 @   ALTER TABLE ONLY public.imagenes DROP CONSTRAINT imagenes_pkey;
       public                 postgres    false    234                       2606    24955 &   info_recoleccion info_recoleccion_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.info_recoleccion
    ADD CONSTRAINT info_recoleccion_pkey PRIMARY KEY (id_recoleccion);
 P   ALTER TABLE ONLY public.info_recoleccion DROP CONSTRAINT info_recoleccion_pkey;
       public                 postgres    false    240                       2606    25025 *   instituto_colectas instituto_colectas_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.instituto_colectas
    ADD CONSTRAINT instituto_colectas_pkey PRIMARY KEY (id_institucion, id_evento_recoleccion);
 T   ALTER TABLE ONLY public.instituto_colectas DROP CONSTRAINT instituto_colectas_pkey;
       public                 postgres    false    250    250                       2606    25005    instituto instituto_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.instituto
    ADD CONSTRAINT instituto_pkey PRIMARY KEY (id_instituto);
 B   ALTER TABLE ONLY public.instituto DROP CONSTRAINT instituto_pkey;
       public                 postgres    false    248                       2606    24979    jerarquia jerarquia_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.jerarquia
    ADD CONSTRAINT jerarquia_pkey PRIMARY KEY (id_jerarquia);
 B   ALTER TABLE ONLY public.jerarquia DROP CONSTRAINT jerarquia_pkey;
       public                 postgres    false    244            �           2606    24830    kingdom kingdom_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.kingdom
    ADD CONSTRAINT kingdom_pkey PRIMARY KEY (id_kingdom);
 >   ALTER TABLE ONLY public.kingdom DROP CONSTRAINT kingdom_pkey;
       public                 postgres    false    218            "           2606    25055 8   participacion_recoleccion participacion_recoleccion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.participacion_recoleccion
    ADD CONSTRAINT participacion_recoleccion_pkey PRIMARY KEY (id_recoleccion, id_trabajador);
 b   ALTER TABLE ONLY public.participacion_recoleccion DROP CONSTRAINT participacion_recoleccion_pkey;
       public                 postgres    false    252    252                       2606    24970    persona persona_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public                 postgres    false    242            �           2606    24839    phylum phylum_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.phylum
    ADD CONSTRAINT phylum_pkey PRIMARY KEY (id_phylum);
 <   ALTER TABLE ONLY public.phylum DROP CONSTRAINT phylum_pkey;
       public                 postgres    false    220                        2606    25040    taxon_coleta taxon_coleta_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.taxon_coleta
    ADD CONSTRAINT taxon_coleta_pkey PRIMARY KEY (id_recoleccion, especimen);
 H   ALTER TABLE ONLY public.taxon_coleta DROP CONSTRAINT taxon_coleta_pkey;
       public                 postgres    false    251    251            &           2606    25088    taxonomia taxonomia_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_pkey PRIMARY KEY (taxonid);
 B   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_pkey;
       public                 postgres    false    254                       2606    24867 "   taxonomiaorder taxonomiaorder_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.taxonomiaorder
    ADD CONSTRAINT taxonomiaorder_pkey PRIMARY KEY (id_order);
 L   ALTER TABLE ONLY public.taxonomiaorder DROP CONSTRAINT taxonomiaorder_pkey;
       public                 postgres    false    224                       2606    25010 2   trabajador_institucion trabajador_institucion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.trabajador_institucion
    ADD CONSTRAINT trabajador_institucion_pkey PRIMARY KEY (id_trabajador, id_institucion);
 \   ALTER TABLE ONLY public.trabajador_institucion DROP CONSTRAINT trabajador_institucion_pkey;
       public                 postgres    false    249    249                       2606    24986    trabajador trabajador_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_pkey PRIMARY KEY (id_trabajador);
 D   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_pkey;
       public                 postgres    false    246                       2606    24936    ubicacion ubicacion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.ubicacion
    ADD CONSTRAINT ubicacion_pkey PRIMARY KEY (id_ubicacion);
 B   ALTER TABLE ONLY public.ubicacion DROP CONSTRAINT ubicacion_pkey;
       public                 postgres    false    236            (           2606    24854    class class_id_phylum_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_id_phylum_fkey FOREIGN KEY (id_phylum) REFERENCES public.phylum(id_phylum) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.class DROP CONSTRAINT class_id_phylum_fkey;
       public               postgres    false    220    4862    222            8           2606    25071 7   especimen_imagenes especimen_imagenes_id_especimen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.especimen_imagenes
    ADD CONSTRAINT especimen_imagenes_id_especimen_fkey FOREIGN KEY (id_especimen) REFERENCES public.especimen(catalognumber);
 a   ALTER TABLE ONLY public.especimen_imagenes DROP CONSTRAINT especimen_imagenes_id_especimen_fkey;
       public               postgres    false    253    4874    232            9           2606    25076 2   especimen_imagenes especimen_imagenes_id_foto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.especimen_imagenes
    ADD CONSTRAINT especimen_imagenes_id_foto_fkey FOREIGN KEY (id_foto) REFERENCES public.imagenes(id_foto);
 \   ALTER TABLE ONLY public.especimen_imagenes DROP CONSTRAINT especimen_imagenes_id_foto_fkey;
       public               postgres    false    234    253    4876            ,           2606    24944 9   evento_de_coleccion evento_de_coleccion_id_ubicacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.evento_de_coleccion
    ADD CONSTRAINT evento_de_coleccion_id_ubicacion_fkey FOREIGN KEY (id_ubicacion) REFERENCES public.ubicacion(id_ubicacion) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.evento_de_coleccion DROP CONSTRAINT evento_de_coleccion_id_ubicacion_fkey;
       public               postgres    false    236    238    4878            *           2606    24882    family family_id_order_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.family
    ADD CONSTRAINT family_id_order_fkey FOREIGN KEY (id_order) REFERENCES public.taxonomiaorder(id_order) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.family DROP CONSTRAINT family_id_order_fkey;
       public               postgres    false    4866    226    224            +           2606    24896    genus genus_id_family_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.genus
    ADD CONSTRAINT genus_id_family_fkey FOREIGN KEY (id_family) REFERENCES public.family(id_family) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.genus DROP CONSTRAINT genus_id_family_fkey;
       public               postgres    false    226    4868    228            -           2606    24956 -   info_recoleccion info_recoleccion_evento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.info_recoleccion
    ADD CONSTRAINT info_recoleccion_evento_fkey FOREIGN KEY (evento) REFERENCES public.evento_de_coleccion(id_evento_recoleccion) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.info_recoleccion DROP CONSTRAINT info_recoleccion_evento_fkey;
       public               postgres    false    4880    238    240            2           2606    25031 @   instituto_colectas instituto_colectas_id_evento_recoleccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.instituto_colectas
    ADD CONSTRAINT instituto_colectas_id_evento_recoleccion_fkey FOREIGN KEY (id_evento_recoleccion) REFERENCES public.evento_de_coleccion(id_evento_recoleccion);
 j   ALTER TABLE ONLY public.instituto_colectas DROP CONSTRAINT instituto_colectas_id_evento_recoleccion_fkey;
       public               postgres    false    250    238    4880            3           2606    25026 9   instituto_colectas instituto_colectas_id_institucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.instituto_colectas
    ADD CONSTRAINT instituto_colectas_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.instituto(id_instituto);
 c   ALTER TABLE ONLY public.instituto_colectas DROP CONSTRAINT instituto_colectas_id_institucion_fkey;
       public               postgres    false    250    4890    248            6           2606    25056 G   participacion_recoleccion participacion_recoleccion_id_recoleccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.participacion_recoleccion
    ADD CONSTRAINT participacion_recoleccion_id_recoleccion_fkey FOREIGN KEY (id_recoleccion) REFERENCES public.info_recoleccion(id_recoleccion);
 q   ALTER TABLE ONLY public.participacion_recoleccion DROP CONSTRAINT participacion_recoleccion_id_recoleccion_fkey;
       public               postgres    false    240    252    4882            7           2606    25061 F   participacion_recoleccion participacion_recoleccion_id_trabajador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.participacion_recoleccion
    ADD CONSTRAINT participacion_recoleccion_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES public.trabajador(id_trabajador);
 p   ALTER TABLE ONLY public.participacion_recoleccion DROP CONSTRAINT participacion_recoleccion_id_trabajador_fkey;
       public               postgres    false    246    4888    252            '           2606    24840    phylum phylum_id_reino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.phylum
    ADD CONSTRAINT phylum_id_reino_fkey FOREIGN KEY (id_reino) REFERENCES public.kingdom(id_kingdom) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.phylum DROP CONSTRAINT phylum_id_reino_fkey;
       public               postgres    false    218    4860    220            4           2606    25046 (   taxon_coleta taxon_coleta_especimen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxon_coleta
    ADD CONSTRAINT taxon_coleta_especimen_fkey FOREIGN KEY (especimen) REFERENCES public.especimen(catalognumber);
 R   ALTER TABLE ONLY public.taxon_coleta DROP CONSTRAINT taxon_coleta_especimen_fkey;
       public               postgres    false    232    251    4874            5           2606    25041 -   taxon_coleta taxon_coleta_id_recoleccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxon_coleta
    ADD CONSTRAINT taxon_coleta_id_recoleccion_fkey FOREIGN KEY (id_recoleccion) REFERENCES public.info_recoleccion(id_recoleccion);
 W   ALTER TABLE ONLY public.taxon_coleta DROP CONSTRAINT taxon_coleta_id_recoleccion_fkey;
       public               postgres    false    4882    240    251            :           2606    25104    taxonomia taxonomia_class_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_class_fkey FOREIGN KEY (class) REFERENCES public.class(id_class) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_class_fkey;
       public               postgres    false    4864    254    222            ;           2606    25114    taxonomia taxonomia_family_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_family_fkey FOREIGN KEY (family) REFERENCES public.family(id_family) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_family_fkey;
       public               postgres    false    254    4868    226            <           2606    25119    taxonomia taxonomia_genus_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_genus_fkey FOREIGN KEY (genus) REFERENCES public.genus(id_genus) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_genus_fkey;
       public               postgres    false    254    4870    228            =           2606    25089 %   taxonomia taxonomia_id_especimen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_id_especimen_fkey FOREIGN KEY (id_especimen) REFERENCES public.especimen(catalognumber);
 O   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_id_especimen_fkey;
       public               postgres    false    254    4874    232            >           2606    25094     taxonomia taxonomia_kingdom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_kingdom_fkey FOREIGN KEY (kingdom) REFERENCES public.kingdom(id_kingdom) ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_kingdom_fkey;
       public               postgres    false    218    254    4860            ?           2606    25109 (   taxonomia taxonomia_order_taxonomia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_order_taxonomia_fkey FOREIGN KEY (order_taxonomia) REFERENCES public.taxonomiaorder(id_order) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_order_taxonomia_fkey;
       public               postgres    false    254    4866    224            @           2606    25099    taxonomia taxonomia_phylum_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_phylum_fkey FOREIGN KEY (phylum) REFERENCES public.phylum(id_phylum) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_phylum_fkey;
       public               postgres    false    220    254    4862            A           2606    25124 (   taxonomia taxonomia_specificepithet_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_specificepithet_fkey FOREIGN KEY (specificepithet) REFERENCES public.epiteloespecifico(id_specificepithet) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_specificepithet_fkey;
       public               postgres    false    230    4872    254            )           2606    24868 +   taxonomiaorder taxonomiaorder_id_class_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomiaorder
    ADD CONSTRAINT taxonomiaorder_id_class_fkey FOREIGN KEY (id_class) REFERENCES public.class(id_class) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.taxonomiaorder DROP CONSTRAINT taxonomiaorder_id_class_fkey;
       public               postgres    false    4864    224    222            .           2606    24992 %   trabajador trabajador_id_persona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_id_persona_fkey;
       public               postgres    false    4884    246    242            0           2606    25016 A   trabajador_institucion trabajador_institucion_id_institucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador_institucion
    ADD CONSTRAINT trabajador_institucion_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.instituto(id_instituto);
 k   ALTER TABLE ONLY public.trabajador_institucion DROP CONSTRAINT trabajador_institucion_id_institucion_fkey;
       public               postgres    false    248    4890    249            1           2606    25011 @   trabajador_institucion trabajador_institucion_id_trabajador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador_institucion
    ADD CONSTRAINT trabajador_institucion_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES public.trabajador(id_trabajador);
 j   ALTER TABLE ONLY public.trabajador_institucion DROP CONSTRAINT trabajador_institucion_id_trabajador_fkey;
       public               postgres    false    4888    249    246            /           2606    24987 *   trabajador trabajador_tipo_trabajador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_tipo_trabajador_fkey FOREIGN KEY (tipo_trabajador) REFERENCES public.jerarquia(id_jerarquia) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_tipo_trabajador_fkey;
       public               postgres    false    246    4886    244            �      x�3���+NM.I�4����� )��      �   2   x�3�LN�-H-.)�,�2��ML�H���2��H-J.�IM�+-����� +�2      �   p   x�=�M
�@��ur�9AA��K��J���4��LR���[7n_x���6I��ڊV�o=5��d15����Ф2�7z�|@�F�h>_7o��]J�I`��P�􃮼��qx'<      �      x�3�4�2�4����� �      �   /   x�3�4202�54�50T04�2 !Nc.3�������1X܄+F��� ���      �   4   x�3�tN,JL�LIL�4�2�H,������r�q���f&��f\1z\\\ �"i      �   6   x�3�t�L��KI�I�4�2�H,�����4�2�tN�-���/)-�4����� 9K�      �   D   x�3��())(���O�H�-�I�K�����MLO-�O�L��KI�I��*H�2§� � 3'3�0F��� �6�      �      x�3�4�2�4����� !�      �   '   x�3���+.�,)-�W0�L�,JMN���S0����� ��	      �      x������ � �      �   2   x�3�(�OK-�/�2��LI�+�L�LNL�9�R��sR�K��=... Re      �      x�3�t���M��L����� '      �      x�3�4�2�4����� ��      �   N   x�3��)�,�t�L��46�4555426153��M��LN���2�t�I��N���K,�4� ���07351��J����� +�C      �      x�3�t,*�(�/�OI�4����� @)@      �      x�3�4�2�4����� �      �      x������ � �      �   -   x�3�t��I�/(I-J�4�2��I-�L���8=*sS���=... ��H      �      x�3�4�4�2�B�=... 
      �      x������ � �      �   �   x�=ǻ�0 ��<�-�qM�h�a�DPd�(���M�I�x�3���F{hB��Z��~˔13��ףO��L�q�P���+�۰��IX�J*�4���SD*��.p��N�э�Ta���3��B� �m(7     