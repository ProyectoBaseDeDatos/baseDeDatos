PGDMP  2    ,        	        |            coleccion_entomologica    17.2    17.2 �    
           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    40977    coleccion_entomologica    DATABASE     �   CREATE DATABASE coleccion_entomologica WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
 &   DROP DATABASE coleccion_entomologica;
                     postgres    false                       0    0    SCHEMA public    ACL     *   GRANT USAGE ON SCHEMA public TO profesor;
                        pg_database_owner    false    5            �            1259    41002    class    TABLE     r   CREATE TABLE public.class (
    id_class integer NOT NULL,
    name_class text NOT NULL,
    id_phylum integer
);
    DROP TABLE public.class;
       public         heap r       postgres    false                       0    0    TABLE class    ACL     �   GRANT SELECT,INSERT ON TABLE public.class TO coleccionista;
GRANT SELECT ON TABLE public.class TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.class TO profesor;
          public               postgres    false    222            �            1259    41001    class_id_class_seq    SEQUENCE     �   CREATE SEQUENCE public.class_id_class_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.class_id_class_seq;
       public               postgres    false    222                       0    0    class_id_class_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.class_id_class_seq OWNED BY public.class.id_class;
          public               postgres    false    221                       0    0    SEQUENCE class_id_class_seq    ACL     ?   GRANT USAGE ON SEQUENCE public.class_id_class_seq TO profesor;
          public               postgres    false    221            �            1259    41058    epiteloespecifico    TABLE     n   CREATE TABLE public.epiteloespecifico (
    id_specificepithet integer NOT NULL,
    epithet text NOT NULL
);
 %   DROP TABLE public.epiteloespecifico;
       public         heap r       postgres    false                       0    0    TABLE epiteloespecifico    ACL     �   GRANT SELECT,INSERT ON TABLE public.epiteloespecifico TO coleccionista;
GRANT SELECT ON TABLE public.epiteloespecifico TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.epiteloespecifico TO profesor;
          public               postgres    false    230            �            1259    41057 (   epiteloespecifico_id_specificepithet_seq    SEQUENCE     �   CREATE SEQUENCE public.epiteloespecifico_id_specificepithet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.epiteloespecifico_id_specificepithet_seq;
       public               postgres    false    230                       0    0 (   epiteloespecifico_id_specificepithet_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.epiteloespecifico_id_specificepithet_seq OWNED BY public.epiteloespecifico.id_specificepithet;
          public               postgres    false    229                       0    0 1   SEQUENCE epiteloespecifico_id_specificepithet_seq    ACL     U   GRANT USAGE ON SEQUENCE public.epiteloespecifico_id_specificepithet_seq TO profesor;
          public               postgres    false    229            �            1259    41067 	   especimen    TABLE     �   CREATE TABLE public.especimen (
    catalognumber integer NOT NULL,
    scientificname text NOT NULL,
    lifestage text,
    sex text,
    individualcount integer
);
    DROP TABLE public.especimen;
       public         heap r       postgres    false                       0    0    TABLE especimen    ACL     �   GRANT SELECT,INSERT ON TABLE public.especimen TO coleccionista;
GRANT SELECT ON TABLE public.especimen TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.especimen TO profesor;
          public               postgres    false    232            �            1259    41066    especimen_catalognumber_seq    SEQUENCE     �   CREATE SEQUENCE public.especimen_catalognumber_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.especimen_catalognumber_seq;
       public               postgres    false    232                       0    0    especimen_catalognumber_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.especimen_catalognumber_seq OWNED BY public.especimen.catalognumber;
          public               postgres    false    231                       0    0 $   SEQUENCE especimen_catalognumber_seq    ACL     H   GRANT USAGE ON SEQUENCE public.especimen_catalognumber_seq TO profesor;
          public               postgres    false    231            �            1259    41222    especimen_imagenes    TABLE     l   CREATE TABLE public.especimen_imagenes (
    id_especimen integer NOT NULL,
    id_foto integer NOT NULL
);
 &   DROP TABLE public.especimen_imagenes;
       public         heap r       postgres    false                       0    0    TABLE especimen_imagenes    ACL     �   GRANT SELECT,INSERT ON TABLE public.especimen_imagenes TO coleccionista;
GRANT SELECT ON TABLE public.especimen_imagenes TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.especimen_imagenes TO profesor;
          public               postgres    false    253            �            1259    41094    evento_de_coleccion    TABLE     �   CREATE TABLE public.evento_de_coleccion (
    id_evento_recoleccion integer NOT NULL,
    event_date timestamp without time zone NOT NULL,
    id_ubicacion integer
);
 '   DROP TABLE public.evento_de_coleccion;
       public         heap r       postgres    false                       0    0    TABLE evento_de_coleccion    ACL     �   GRANT SELECT,INSERT ON TABLE public.evento_de_coleccion TO coleccionista;
GRANT SELECT ON TABLE public.evento_de_coleccion TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.evento_de_coleccion TO profesor;
          public               postgres    false    238            �            1259    41093 -   evento_de_coleccion_id_evento_recoleccion_seq    SEQUENCE     �   CREATE SEQUENCE public.evento_de_coleccion_id_evento_recoleccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.evento_de_coleccion_id_evento_recoleccion_seq;
       public               postgres    false    238                       0    0 -   evento_de_coleccion_id_evento_recoleccion_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.evento_de_coleccion_id_evento_recoleccion_seq OWNED BY public.evento_de_coleccion.id_evento_recoleccion;
          public               postgres    false    237                       0    0 6   SEQUENCE evento_de_coleccion_id_evento_recoleccion_seq    ACL     Z   GRANT USAGE ON SEQUENCE public.evento_de_coleccion_id_evento_recoleccion_seq TO profesor;
          public               postgres    false    237            �            1259    41030    family    TABLE     t   CREATE TABLE public.family (
    id_family integer NOT NULL,
    name_family text NOT NULL,
    id_order integer
);
    DROP TABLE public.family;
       public         heap r       postgres    false                       0    0    TABLE family    ACL     �   GRANT SELECT,INSERT ON TABLE public.family TO coleccionista;
GRANT SELECT ON TABLE public.family TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.family TO profesor;
          public               postgres    false    226            �            1259    41192    taxon_colecta    TABLE     k   CREATE TABLE public.taxon_colecta (
    id_recoleccion integer NOT NULL,
    especimen integer NOT NULL
);
 !   DROP TABLE public.taxon_colecta;
       public         heap r       postgres    false                       0    0    TABLE taxon_colecta    ACL     �   GRANT SELECT,INSERT ON TABLE public.taxon_colecta TO coleccionista;
GRANT SELECT ON TABLE public.taxon_colecta TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.taxon_colecta TO profesor;
          public               postgres    false    251            �            1259    41237 	   taxonomia    TABLE     H  CREATE TABLE public.taxonomia (
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
       public         heap r       postgres    false                       0    0    TABLE taxonomia    ACL     �   GRANT SELECT,INSERT ON TABLE public.taxonomia TO coleccionista;
GRANT SELECT ON TABLE public.taxonomia TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.taxonomia TO profesor;
          public               postgres    false    254            �            1259    41292    familia    VIEW     �  CREATE VIEW public.familia AS
 SELECT e.catalognumber AS id_especimen,
    e.scientificname,
    e.lifestage,
    e.sex,
    e.individualcount,
    f.name_family AS familia
   FROM (((public.especimen e
     JOIN public.taxon_colecta tc ON ((e.catalognumber = tc.especimen)))
     JOIN public.taxonomia t ON ((e.catalognumber = t.id_especimen)))
     JOIN public.family f ON ((t.family = f.id_family)));
    DROP VIEW public.familia;
       public       v       postgres    false    254    226    226    232    232    232    232    232    251    254                       0    0    TABLE familia    ACL     �   GRANT SELECT,INSERT ON TABLE public.familia TO coleccionista;
GRANT SELECT ON TABLE public.familia TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.familia TO profesor;
          public               postgres    false    255            �            1259    41029    family_id_family_seq    SEQUENCE     �   CREATE SEQUENCE public.family_id_family_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.family_id_family_seq;
       public               postgres    false    226                        0    0    family_id_family_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.family_id_family_seq OWNED BY public.family.id_family;
          public               postgres    false    225            !           0    0    SEQUENCE family_id_family_seq    ACL     A   GRANT USAGE ON SEQUENCE public.family_id_family_seq TO profesor;
          public               postgres    false    225            �            1259    41044    genus    TABLE     m   CREATE TABLE public.genus (
    id_genus integer NOT NULL,
    genus text NOT NULL,
    id_family integer
);
    DROP TABLE public.genus;
       public         heap r       postgres    false            "           0    0    TABLE genus    ACL     �   GRANT SELECT,INSERT ON TABLE public.genus TO coleccionista;
GRANT SELECT ON TABLE public.genus TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.genus TO profesor;
          public               postgres    false    228            �            1259    41043    genus_id_genus_seq    SEQUENCE     �   CREATE SEQUENCE public.genus_id_genus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.genus_id_genus_seq;
       public               postgres    false    228            #           0    0    genus_id_genus_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.genus_id_genus_seq OWNED BY public.genus.id_genus;
          public               postgres    false    227            $           0    0    SEQUENCE genus_id_genus_seq    ACL     ?   GRANT USAGE ON SEQUENCE public.genus_id_genus_seq TO profesor;
          public               postgres    false    227            �            1259    41106    info_recoleccion    TABLE     b   CREATE TABLE public.info_recoleccion (
    id_recoleccion integer NOT NULL,
    evento integer
);
 $   DROP TABLE public.info_recoleccion;
       public         heap r       postgres    false            %           0    0    TABLE info_recoleccion    ACL     �   GRANT SELECT,INSERT ON TABLE public.info_recoleccion TO coleccionista;
GRANT SELECT ON TABLE public.info_recoleccion TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.info_recoleccion TO profesor;
          public               postgres    false    240            �            1259    41154 	   instituto    TABLE     s   CREATE TABLE public.instituto (
    id_instituto integer NOT NULL,
    nombre text NOT NULL,
    direccion text
);
    DROP TABLE public.instituto;
       public         heap r       postgres    false            &           0    0    TABLE instituto    ACL     �   GRANT SELECT,INSERT ON TABLE public.instituto TO coleccionista;
GRANT SELECT ON TABLE public.instituto TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.instituto TO profesor;
          public               postgres    false    248            �            1259    41177    instituto_colectas    TABLE     |   CREATE TABLE public.instituto_colectas (
    id_institucion integer NOT NULL,
    id_evento_recoleccion integer NOT NULL
);
 &   DROP TABLE public.instituto_colectas;
       public         heap r       postgres    false            '           0    0    TABLE instituto_colectas    ACL     �   GRANT SELECT,INSERT ON TABLE public.instituto_colectas TO coleccionista;
GRANT SELECT ON TABLE public.instituto_colectas TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.instituto_colectas TO profesor;
          public               postgres    false    250            �            1259    41207    participacion_recoleccion    TABLE     {   CREATE TABLE public.participacion_recoleccion (
    id_recoleccion integer NOT NULL,
    id_trabajador integer NOT NULL
);
 -   DROP TABLE public.participacion_recoleccion;
       public         heap r       postgres    false            (           0    0    TABLE participacion_recoleccion    ACL     �   GRANT SELECT,INSERT ON TABLE public.participacion_recoleccion TO coleccionista;
GRANT SELECT ON TABLE public.participacion_recoleccion TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.participacion_recoleccion TO profesor;
          public               postgres    false    252            �            1259    41118    persona    TABLE     �   CREATE TABLE public.persona (
    id_persona integer NOT NULL,
    nombre text NOT NULL,
    apellido text NOT NULL,
    edad integer,
    telefono text,
    nacionalidad text,
    CONSTRAINT persona_edad_check CHECK ((edad >= 0))
);
    DROP TABLE public.persona;
       public         heap r       postgres    false            )           0    0    TABLE persona    ACL     �   GRANT SELECT,INSERT ON TABLE public.persona TO coleccionista;
GRANT SELECT ON TABLE public.persona TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.persona TO profesor;
          public               postgres    false    242            �            1259    41137 
   trabajador    TABLE     |   CREATE TABLE public.trabajador (
    id_trabajador integer NOT NULL,
    tipo_trabajador integer,
    id_persona integer
);
    DROP TABLE public.trabajador;
       public         heap r       postgres    false            *           0    0    TABLE trabajador    ACL     �   GRANT SELECT,INSERT ON TABLE public.trabajador TO coleccionista;
GRANT SELECT ON TABLE public.trabajador TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.trabajador TO profesor;
          public               postgres    false    246            �            1259    41085 	   ubicacion    TABLE     �   CREATE TABLE public.ubicacion (
    id_ubicacion integer NOT NULL,
    latitud numeric,
    longitud numeric,
    altitud numeric,
    locality text,
    habitat text,
    notas text
);
    DROP TABLE public.ubicacion;
       public         heap r       postgres    false            +           0    0    TABLE ubicacion    ACL     �   GRANT SELECT,INSERT ON TABLE public.ubicacion TO coleccionista;
GRANT SELECT ON TABLE public.ubicacion TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.ubicacion TO profesor;
          public               postgres    false    236                       1259    41302    habitat    VIEW     �  CREATE VIEW public.habitat AS
 SELECT u.habitat,
    t.scientificname AS scientific_name,
    t.tipo AS taxon_type,
    s.lifestage AS life_stage,
    s.sex,
    s.individualcount AS individual_count,
    edc.event_date AS collection_date,
    per.nombre AS collector_name,
    per.apellido AS collector_lastname,
    inst.nombre AS institution_name
   FROM ((((((((((public.taxonomia t
     JOIN public.especimen s ON ((t.id_especimen = s.catalognumber)))
     JOIN public.taxon_colecta tc ON ((tc.especimen = s.catalognumber)))
     JOIN public.info_recoleccion ir ON ((tc.id_recoleccion = ir.id_recoleccion)))
     JOIN public.evento_de_coleccion edc ON ((ir.evento = edc.id_evento_recoleccion)))
     JOIN public.ubicacion u ON ((edc.id_ubicacion = u.id_ubicacion)))
     JOIN public.participacion_recoleccion pr ON ((pr.id_recoleccion = ir.id_recoleccion)))
     JOIN public.trabajador t_worker ON ((pr.id_trabajador = t_worker.id_trabajador)))
     JOIN public.persona per ON ((t_worker.id_persona = per.id_persona)))
     JOIN public.instituto_colectas ic ON ((ic.id_evento_recoleccion = edc.id_evento_recoleccion)))
     JOIN public.instituto inst ON ((ic.id_institucion = inst.id_instituto)));
    DROP VIEW public.habitat;
       public       v       postgres    false    232    254    254    254    252    252    251    251    250    250    248    248    246    246    242    242    242    240    240    238    238    238    236    236    232    232    232            ,           0    0    TABLE habitat    ACL     �   GRANT SELECT,INSERT ON TABLE public.habitat TO coleccionista;
GRANT SELECT ON TABLE public.habitat TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.habitat TO profesor;
          public               postgres    false    257            �            1259    41076    imagenes    TABLE     V   CREATE TABLE public.imagenes (
    id_foto integer NOT NULL,
    url text NOT NULL
);
    DROP TABLE public.imagenes;
       public         heap r       postgres    false            -           0    0    TABLE imagenes    ACL     �   GRANT SELECT,INSERT ON TABLE public.imagenes TO coleccionista;
GRANT SELECT ON TABLE public.imagenes TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.imagenes TO profesor;
          public               postgres    false    234            �            1259    41075    imagenes_id_foto_seq    SEQUENCE     �   CREATE SEQUENCE public.imagenes_id_foto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.imagenes_id_foto_seq;
       public               postgres    false    234            .           0    0    imagenes_id_foto_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.imagenes_id_foto_seq OWNED BY public.imagenes.id_foto;
          public               postgres    false    233            /           0    0    SEQUENCE imagenes_id_foto_seq    ACL     A   GRANT USAGE ON SEQUENCE public.imagenes_id_foto_seq TO profesor;
          public               postgres    false    233            �            1259    41105 #   info_recoleccion_id_recoleccion_seq    SEQUENCE     �   CREATE SEQUENCE public.info_recoleccion_id_recoleccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.info_recoleccion_id_recoleccion_seq;
       public               postgres    false    240            0           0    0 #   info_recoleccion_id_recoleccion_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.info_recoleccion_id_recoleccion_seq OWNED BY public.info_recoleccion.id_recoleccion;
          public               postgres    false    239            1           0    0 ,   SEQUENCE info_recoleccion_id_recoleccion_seq    ACL     P   GRANT USAGE ON SEQUENCE public.info_recoleccion_id_recoleccion_seq TO profesor;
          public               postgres    false    239            �            1259    41153    instituto_id_instituto_seq    SEQUENCE     �   CREATE SEQUENCE public.instituto_id_instituto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.instituto_id_instituto_seq;
       public               postgres    false    248            2           0    0    instituto_id_instituto_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.instituto_id_instituto_seq OWNED BY public.instituto.id_instituto;
          public               postgres    false    247            3           0    0 #   SEQUENCE instituto_id_instituto_seq    ACL     G   GRANT USAGE ON SEQUENCE public.instituto_id_instituto_seq TO profesor;
          public               postgres    false    247            �            1259    41128 	   jerarquia    TABLE     _   CREATE TABLE public.jerarquia (
    id_jerarquia integer NOT NULL,
    nombre text NOT NULL
);
    DROP TABLE public.jerarquia;
       public         heap r       postgres    false            4           0    0    TABLE jerarquia    ACL     �   GRANT SELECT,INSERT ON TABLE public.jerarquia TO coleccionista;
GRANT SELECT ON TABLE public.jerarquia TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.jerarquia TO profesor;
          public               postgres    false    244            �            1259    41127    jerarquia_id_jerarquia_seq    SEQUENCE     �   CREATE SEQUENCE public.jerarquia_id_jerarquia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.jerarquia_id_jerarquia_seq;
       public               postgres    false    244            5           0    0    jerarquia_id_jerarquia_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.jerarquia_id_jerarquia_seq OWNED BY public.jerarquia.id_jerarquia;
          public               postgres    false    243            6           0    0 #   SEQUENCE jerarquia_id_jerarquia_seq    ACL     G   GRANT USAGE ON SEQUENCE public.jerarquia_id_jerarquia_seq TO profesor;
          public               postgres    false    243            �            1259    40979    kingdom    TABLE     a   CREATE TABLE public.kingdom (
    id_kingdom integer NOT NULL,
    name_kingdom text NOT NULL
);
    DROP TABLE public.kingdom;
       public         heap r       postgres    false            7           0    0    TABLE kingdom    ACL     �   GRANT SELECT,INSERT ON TABLE public.kingdom TO coleccionista;
GRANT SELECT ON TABLE public.kingdom TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.kingdom TO profesor;
          public               postgres    false    218            �            1259    40978    kingdom_id_kingdom_seq    SEQUENCE     �   CREATE SEQUENCE public.kingdom_id_kingdom_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.kingdom_id_kingdom_seq;
       public               postgres    false    218            8           0    0    kingdom_id_kingdom_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.kingdom_id_kingdom_seq OWNED BY public.kingdom.id_kingdom;
          public               postgres    false    217            9           0    0    SEQUENCE kingdom_id_kingdom_seq    ACL     C   GRANT USAGE ON SEQUENCE public.kingdom_id_kingdom_seq TO profesor;
          public               postgres    false    217            �            1259    40988    phylum    TABLE     t   CREATE TABLE public.phylum (
    id_phylum integer NOT NULL,
    name_phylum text NOT NULL,
    id_reino integer
);
    DROP TABLE public.phylum;
       public         heap r       postgres    false            :           0    0    TABLE phylum    ACL     �   GRANT SELECT,INSERT ON TABLE public.phylum TO coleccionista;
GRANT SELECT ON TABLE public.phylum TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.phylum TO profesor;
          public               postgres    false    220            �            1259    41016    taxonomiaorder    TABLE     z   CREATE TABLE public.taxonomiaorder (
    id_order integer NOT NULL,
    name_order text NOT NULL,
    id_class integer
);
 "   DROP TABLE public.taxonomiaorder;
       public         heap r       postgres    false            ;           0    0    TABLE taxonomiaorder    ACL     �   GRANT SELECT,INSERT ON TABLE public.taxonomiaorder TO coleccionista;
GRANT SELECT ON TABLE public.taxonomiaorder TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.taxonomiaorder TO profesor;
          public               postgres    false    224                        1259    41297    nombre_reino    VIEW     �  CREATE VIEW public.nombre_reino AS
 SELECT k.name_kingdom AS kingdom_name,
    p.name_phylum AS phylum_name,
    c.name_class AS class_name,
    o.name_order AS order_name,
    f.name_family AS family_name,
    g.genus AS genus_name,
    e.epithet AS specific_epithet,
    t.scientificname AS scientific_name,
    t.tipo AS taxon_type,
    s.lifestage AS life_stage,
    s.sex,
    s.individualcount AS individual_count,
    u.locality,
    u.habitat,
    u.latitud AS latitude,
    u.longitud AS longitude,
    u.altitud AS altitude,
    edc.event_date AS collection_date,
    per.nombre AS collector_name,
    per.apellido AS collector_lastname,
    inst.nombre AS institution_name
   FROM (((((((((((((((((public.taxonomia t
     JOIN public.kingdom k ON ((t.kingdom = k.id_kingdom)))
     JOIN public.phylum p ON ((t.phylum = p.id_phylum)))
     JOIN public.class c ON ((t.class = c.id_class)))
     JOIN public.taxonomiaorder o ON ((t.order_taxonomia = o.id_order)))
     JOIN public.family f ON ((t.family = f.id_family)))
     JOIN public.genus g ON ((t.genus = g.id_genus)))
     JOIN public.epiteloespecifico e ON ((t.specificepithet = e.id_specificepithet)))
     JOIN public.especimen s ON ((t.id_especimen = s.catalognumber)))
     JOIN public.taxon_colecta tc ON ((tc.especimen = s.catalognumber)))
     JOIN public.info_recoleccion ir ON ((tc.id_recoleccion = ir.id_recoleccion)))
     JOIN public.evento_de_coleccion edc ON ((ir.evento = edc.id_evento_recoleccion)))
     JOIN public.ubicacion u ON ((edc.id_ubicacion = u.id_ubicacion)))
     JOIN public.participacion_recoleccion pr ON ((pr.id_recoleccion = ir.id_recoleccion)))
     JOIN public.trabajador t_worker ON ((pr.id_trabajador = t_worker.id_trabajador)))
     JOIN public.persona per ON ((t_worker.id_persona = per.id_persona)))
     JOIN public.instituto_colectas ic ON ((ic.id_evento_recoleccion = edc.id_evento_recoleccion)))
     JOIN public.instituto inst ON ((ic.id_institucion = inst.id_instituto)));
    DROP VIEW public.nombre_reino;
       public       v       postgres    false    252    252    254    232    254    254    254    254    232    230    254    254    254    254    248    228    228    226    254    226    224    224    222    222    220    220    218    218    230    246    246    242    242    242    240    240    238    238    238    236    236    236    236    236    248    250    250    251    236    232    232    251            <           0    0    TABLE nombre_reino    ACL     �   GRANT SELECT,INSERT ON TABLE public.nombre_reino TO coleccionista;
GRANT SELECT ON TABLE public.nombre_reino TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.nombre_reino TO profesor;
          public               postgres    false    256            �            1259    41117    persona_id_persona_seq    SEQUENCE     �   CREATE SEQUENCE public.persona_id_persona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.persona_id_persona_seq;
       public               postgres    false    242            =           0    0    persona_id_persona_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.persona_id_persona_seq OWNED BY public.persona.id_persona;
          public               postgres    false    241            >           0    0    SEQUENCE persona_id_persona_seq    ACL     C   GRANT USAGE ON SEQUENCE public.persona_id_persona_seq TO profesor;
          public               postgres    false    241            �            1259    40987    phylum_id_phylum_seq    SEQUENCE     �   CREATE SEQUENCE public.phylum_id_phylum_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.phylum_id_phylum_seq;
       public               postgres    false    220            ?           0    0    phylum_id_phylum_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.phylum_id_phylum_seq OWNED BY public.phylum.id_phylum;
          public               postgres    false    219            @           0    0    SEQUENCE phylum_id_phylum_seq    ACL     A   GRANT USAGE ON SEQUENCE public.phylum_id_phylum_seq TO profesor;
          public               postgres    false    219            �            1259    41015    taxonomiaorder_id_order_seq    SEQUENCE     �   CREATE SEQUENCE public.taxonomiaorder_id_order_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.taxonomiaorder_id_order_seq;
       public               postgres    false    224            A           0    0    taxonomiaorder_id_order_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.taxonomiaorder_id_order_seq OWNED BY public.taxonomiaorder.id_order;
          public               postgres    false    223            B           0    0 $   SEQUENCE taxonomiaorder_id_order_seq    ACL     H   GRANT USAGE ON SEQUENCE public.taxonomiaorder_id_order_seq TO profesor;
          public               postgres    false    223            �            1259    41136    trabajador_id_trabajador_seq    SEQUENCE     �   CREATE SEQUENCE public.trabajador_id_trabajador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.trabajador_id_trabajador_seq;
       public               postgres    false    246            C           0    0    trabajador_id_trabajador_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.trabajador_id_trabajador_seq OWNED BY public.trabajador.id_trabajador;
          public               postgres    false    245            D           0    0 %   SEQUENCE trabajador_id_trabajador_seq    ACL     I   GRANT USAGE ON SEQUENCE public.trabajador_id_trabajador_seq TO profesor;
          public               postgres    false    245            �            1259    41162    trabajador_institucion    TABLE     x   CREATE TABLE public.trabajador_institucion (
    id_trabajador integer NOT NULL,
    id_institucion integer NOT NULL
);
 *   DROP TABLE public.trabajador_institucion;
       public         heap r       postgres    false            E           0    0    TABLE trabajador_institucion    ACL     �   GRANT SELECT,INSERT ON TABLE public.trabajador_institucion TO coleccionista;
GRANT SELECT ON TABLE public.trabajador_institucion TO identificador;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.trabajador_institucion TO profesor;
          public               postgres    false    249            �            1259    41084    ubicacion_id_ubicacion_seq    SEQUENCE     �   CREATE SEQUENCE public.ubicacion_id_ubicacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.ubicacion_id_ubicacion_seq;
       public               postgres    false    236            F           0    0    ubicacion_id_ubicacion_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.ubicacion_id_ubicacion_seq OWNED BY public.ubicacion.id_ubicacion;
          public               postgres    false    235            G           0    0 #   SEQUENCE ubicacion_id_ubicacion_seq    ACL     G   GRANT USAGE ON SEQUENCE public.ubicacion_id_ubicacion_seq TO profesor;
          public               postgres    false    235            �           2604    41005    class id_class    DEFAULT     p   ALTER TABLE ONLY public.class ALTER COLUMN id_class SET DEFAULT nextval('public.class_id_class_seq'::regclass);
 =   ALTER TABLE public.class ALTER COLUMN id_class DROP DEFAULT;
       public               postgres    false    221    222    222            �           2604    41061 $   epiteloespecifico id_specificepithet    DEFAULT     �   ALTER TABLE ONLY public.epiteloespecifico ALTER COLUMN id_specificepithet SET DEFAULT nextval('public.epiteloespecifico_id_specificepithet_seq'::regclass);
 S   ALTER TABLE public.epiteloespecifico ALTER COLUMN id_specificepithet DROP DEFAULT;
       public               postgres    false    230    229    230            �           2604    41070    especimen catalognumber    DEFAULT     �   ALTER TABLE ONLY public.especimen ALTER COLUMN catalognumber SET DEFAULT nextval('public.especimen_catalognumber_seq'::regclass);
 F   ALTER TABLE public.especimen ALTER COLUMN catalognumber DROP DEFAULT;
       public               postgres    false    232    231    232            �           2604    41097 )   evento_de_coleccion id_evento_recoleccion    DEFAULT     �   ALTER TABLE ONLY public.evento_de_coleccion ALTER COLUMN id_evento_recoleccion SET DEFAULT nextval('public.evento_de_coleccion_id_evento_recoleccion_seq'::regclass);
 X   ALTER TABLE public.evento_de_coleccion ALTER COLUMN id_evento_recoleccion DROP DEFAULT;
       public               postgres    false    237    238    238            �           2604    41033    family id_family    DEFAULT     t   ALTER TABLE ONLY public.family ALTER COLUMN id_family SET DEFAULT nextval('public.family_id_family_seq'::regclass);
 ?   ALTER TABLE public.family ALTER COLUMN id_family DROP DEFAULT;
       public               postgres    false    225    226    226            �           2604    41047    genus id_genus    DEFAULT     p   ALTER TABLE ONLY public.genus ALTER COLUMN id_genus SET DEFAULT nextval('public.genus_id_genus_seq'::regclass);
 =   ALTER TABLE public.genus ALTER COLUMN id_genus DROP DEFAULT;
       public               postgres    false    228    227    228            �           2604    41079    imagenes id_foto    DEFAULT     t   ALTER TABLE ONLY public.imagenes ALTER COLUMN id_foto SET DEFAULT nextval('public.imagenes_id_foto_seq'::regclass);
 ?   ALTER TABLE public.imagenes ALTER COLUMN id_foto DROP DEFAULT;
       public               postgres    false    234    233    234                        2604    41109    info_recoleccion id_recoleccion    DEFAULT     �   ALTER TABLE ONLY public.info_recoleccion ALTER COLUMN id_recoleccion SET DEFAULT nextval('public.info_recoleccion_id_recoleccion_seq'::regclass);
 N   ALTER TABLE public.info_recoleccion ALTER COLUMN id_recoleccion DROP DEFAULT;
       public               postgres    false    239    240    240                       2604    41157    instituto id_instituto    DEFAULT     �   ALTER TABLE ONLY public.instituto ALTER COLUMN id_instituto SET DEFAULT nextval('public.instituto_id_instituto_seq'::regclass);
 E   ALTER TABLE public.instituto ALTER COLUMN id_instituto DROP DEFAULT;
       public               postgres    false    247    248    248                       2604    41131    jerarquia id_jerarquia    DEFAULT     �   ALTER TABLE ONLY public.jerarquia ALTER COLUMN id_jerarquia SET DEFAULT nextval('public.jerarquia_id_jerarquia_seq'::regclass);
 E   ALTER TABLE public.jerarquia ALTER COLUMN id_jerarquia DROP DEFAULT;
       public               postgres    false    244    243    244            �           2604    40982    kingdom id_kingdom    DEFAULT     x   ALTER TABLE ONLY public.kingdom ALTER COLUMN id_kingdom SET DEFAULT nextval('public.kingdom_id_kingdom_seq'::regclass);
 A   ALTER TABLE public.kingdom ALTER COLUMN id_kingdom DROP DEFAULT;
       public               postgres    false    218    217    218                       2604    41121    persona id_persona    DEFAULT     x   ALTER TABLE ONLY public.persona ALTER COLUMN id_persona SET DEFAULT nextval('public.persona_id_persona_seq'::regclass);
 A   ALTER TABLE public.persona ALTER COLUMN id_persona DROP DEFAULT;
       public               postgres    false    241    242    242            �           2604    40991    phylum id_phylum    DEFAULT     t   ALTER TABLE ONLY public.phylum ALTER COLUMN id_phylum SET DEFAULT nextval('public.phylum_id_phylum_seq'::regclass);
 ?   ALTER TABLE public.phylum ALTER COLUMN id_phylum DROP DEFAULT;
       public               postgres    false    220    219    220            �           2604    41019    taxonomiaorder id_order    DEFAULT     �   ALTER TABLE ONLY public.taxonomiaorder ALTER COLUMN id_order SET DEFAULT nextval('public.taxonomiaorder_id_order_seq'::regclass);
 F   ALTER TABLE public.taxonomiaorder ALTER COLUMN id_order DROP DEFAULT;
       public               postgres    false    223    224    224                       2604    41140    trabajador id_trabajador    DEFAULT     �   ALTER TABLE ONLY public.trabajador ALTER COLUMN id_trabajador SET DEFAULT nextval('public.trabajador_id_trabajador_seq'::regclass);
 G   ALTER TABLE public.trabajador ALTER COLUMN id_trabajador DROP DEFAULT;
       public               postgres    false    246    245    246            �           2604    41088    ubicacion id_ubicacion    DEFAULT     �   ALTER TABLE ONLY public.ubicacion ALTER COLUMN id_ubicacion SET DEFAULT nextval('public.ubicacion_id_ubicacion_seq'::regclass);
 E   ALTER TABLE public.ubicacion ALTER COLUMN id_ubicacion DROP DEFAULT;
       public               postgres    false    236    235    236            �          0    41002    class 
   TABLE DATA           @   COPY public.class (id_class, name_class, id_phylum) FROM stdin;
    public               postgres    false    222   �      �          0    41058    epiteloespecifico 
   TABLE DATA           H   COPY public.epiteloespecifico (id_specificepithet, epithet) FROM stdin;
    public               postgres    false    230   �      �          0    41067 	   especimen 
   TABLE DATA           c   COPY public.especimen (catalognumber, scientificname, lifestage, sex, individualcount) FROM stdin;
    public               postgres    false    232                   0    41222    especimen_imagenes 
   TABLE DATA           C   COPY public.especimen_imagenes (id_especimen, id_foto) FROM stdin;
    public               postgres    false    253   X      �          0    41094    evento_de_coleccion 
   TABLE DATA           ^   COPY public.evento_de_coleccion (id_evento_recoleccion, event_date, id_ubicacion) FROM stdin;
    public               postgres    false    238   y      �          0    41030    family 
   TABLE DATA           B   COPY public.family (id_family, name_family, id_order) FROM stdin;
    public               postgres    false    226   �      �          0    41044    genus 
   TABLE DATA           ;   COPY public.genus (id_genus, genus, id_family) FROM stdin;
    public               postgres    false    228   �      �          0    41076    imagenes 
   TABLE DATA           0   COPY public.imagenes (id_foto, url) FROM stdin;
    public               postgres    false    234         �          0    41106    info_recoleccion 
   TABLE DATA           B   COPY public.info_recoleccion (id_recoleccion, evento) FROM stdin;
    public               postgres    false    240   C                0    41154 	   instituto 
   TABLE DATA           D   COPY public.instituto (id_instituto, nombre, direccion) FROM stdin;
    public               postgres    false    248   d                0    41177    instituto_colectas 
   TABLE DATA           S   COPY public.instituto_colectas (id_institucion, id_evento_recoleccion) FROM stdin;
    public               postgres    false    250   �      �          0    41128 	   jerarquia 
   TABLE DATA           9   COPY public.jerarquia (id_jerarquia, nombre) FROM stdin;
    public               postgres    false    244   �      �          0    40979    kingdom 
   TABLE DATA           ;   COPY public.kingdom (id_kingdom, name_kingdom) FROM stdin;
    public               postgres    false    218                   0    41207    participacion_recoleccion 
   TABLE DATA           R   COPY public.participacion_recoleccion (id_recoleccion, id_trabajador) FROM stdin;
    public               postgres    false    252   P      �          0    41118    persona 
   TABLE DATA           ]   COPY public.persona (id_persona, nombre, apellido, edad, telefono, nacionalidad) FROM stdin;
    public               postgres    false    242   u      �          0    40988    phylum 
   TABLE DATA           B   COPY public.phylum (id_phylum, name_phylum, id_reino) FROM stdin;
    public               postgres    false    220   �                0    41192    taxon_colecta 
   TABLE DATA           B   COPY public.taxon_colecta (id_recoleccion, especimen) FROM stdin;
    public               postgres    false    251   �                0    41237 	   taxonomia 
   TABLE DATA           �   COPY public.taxonomia (taxonid, id_especimen, tipo, scientificname, kingdom, phylum, class, order_taxonomia, family, genus, specificepithet) FROM stdin;
    public               postgres    false    254         �          0    41016    taxonomiaorder 
   TABLE DATA           H   COPY public.taxonomiaorder (id_order, name_order, id_class) FROM stdin;
    public               postgres    false    224   �      �          0    41137 
   trabajador 
   TABLE DATA           P   COPY public.trabajador (id_trabajador, tipo_trabajador, id_persona) FROM stdin;
    public               postgres    false    246   �                0    41162    trabajador_institucion 
   TABLE DATA           O   COPY public.trabajador_institucion (id_trabajador, id_institucion) FROM stdin;
    public               postgres    false    249   �      �          0    41085 	   ubicacion 
   TABLE DATA           g   COPY public.ubicacion (id_ubicacion, latitud, longitud, altitud, locality, habitat, notas) FROM stdin;
    public               postgres    false    236   �      H           0    0    class_id_class_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.class_id_class_seq', 1, true);
          public               postgres    false    221            I           0    0 (   epiteloespecifico_id_specificepithet_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.epiteloespecifico_id_specificepithet_seq', 1, true);
          public               postgres    false    229            J           0    0    especimen_catalognumber_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.especimen_catalognumber_seq', 1, true);
          public               postgres    false    231            K           0    0 -   evento_de_coleccion_id_evento_recoleccion_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.evento_de_coleccion_id_evento_recoleccion_seq', 1, true);
          public               postgres    false    237            L           0    0    family_id_family_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.family_id_family_seq', 1, true);
          public               postgres    false    225            M           0    0    genus_id_genus_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.genus_id_genus_seq', 1, true);
          public               postgres    false    227            N           0    0    imagenes_id_foto_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.imagenes_id_foto_seq', 1, true);
          public               postgres    false    233            O           0    0 #   info_recoleccion_id_recoleccion_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.info_recoleccion_id_recoleccion_seq', 1, true);
          public               postgres    false    239            P           0    0    instituto_id_instituto_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.instituto_id_instituto_seq', 1, true);
          public               postgres    false    247            Q           0    0    jerarquia_id_jerarquia_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.jerarquia_id_jerarquia_seq', 2, true);
          public               postgres    false    243            R           0    0    kingdom_id_kingdom_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.kingdom_id_kingdom_seq', 2, true);
          public               postgres    false    217            S           0    0    persona_id_persona_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.persona_id_persona_seq', 2, true);
          public               postgres    false    241            T           0    0    phylum_id_phylum_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.phylum_id_phylum_seq', 1, true);
          public               postgres    false    219            U           0    0    taxonomiaorder_id_order_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.taxonomiaorder_id_order_seq', 1, true);
          public               postgres    false    223            V           0    0    trabajador_id_trabajador_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.trabajador_id_trabajador_seq', 2, true);
          public               postgres    false    245            W           0    0    ubicacion_id_ubicacion_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.ubicacion_id_ubicacion_seq', 1, true);
          public               postgres    false    235                       2606    41009    class class_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_pkey PRIMARY KEY (id_class);
 :   ALTER TABLE ONLY public.class DROP CONSTRAINT class_pkey;
       public                 postgres    false    222                       2606    41065 (   epiteloespecifico epiteloespecifico_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.epiteloespecifico
    ADD CONSTRAINT epiteloespecifico_pkey PRIMARY KEY (id_specificepithet);
 R   ALTER TABLE ONLY public.epiteloespecifico DROP CONSTRAINT epiteloespecifico_pkey;
       public                 postgres    false    230            0           2606    41226 *   especimen_imagenes especimen_imagenes_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.especimen_imagenes
    ADD CONSTRAINT especimen_imagenes_pkey PRIMARY KEY (id_especimen, id_foto);
 T   ALTER TABLE ONLY public.especimen_imagenes DROP CONSTRAINT especimen_imagenes_pkey;
       public                 postgres    false    253    253                       2606    41074    especimen especimen_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.especimen
    ADD CONSTRAINT especimen_pkey PRIMARY KEY (catalognumber);
 B   ALTER TABLE ONLY public.especimen DROP CONSTRAINT especimen_pkey;
       public                 postgres    false    232                       2606    41099 ,   evento_de_coleccion evento_de_coleccion_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.evento_de_coleccion
    ADD CONSTRAINT evento_de_coleccion_pkey PRIMARY KEY (id_evento_recoleccion);
 V   ALTER TABLE ONLY public.evento_de_coleccion DROP CONSTRAINT evento_de_coleccion_pkey;
       public                 postgres    false    238                       2606    41037    family family_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.family
    ADD CONSTRAINT family_pkey PRIMARY KEY (id_family);
 <   ALTER TABLE ONLY public.family DROP CONSTRAINT family_pkey;
       public                 postgres    false    226                       2606    41051    genus genus_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.genus
    ADD CONSTRAINT genus_pkey PRIMARY KEY (id_genus);
 :   ALTER TABLE ONLY public.genus DROP CONSTRAINT genus_pkey;
       public                 postgres    false    228                       2606    41083    imagenes imagenes_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id_foto);
 @   ALTER TABLE ONLY public.imagenes DROP CONSTRAINT imagenes_pkey;
       public                 postgres    false    234                       2606    41111 &   info_recoleccion info_recoleccion_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.info_recoleccion
    ADD CONSTRAINT info_recoleccion_pkey PRIMARY KEY (id_recoleccion);
 P   ALTER TABLE ONLY public.info_recoleccion DROP CONSTRAINT info_recoleccion_pkey;
       public                 postgres    false    240            *           2606    41181 *   instituto_colectas instituto_colectas_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.instituto_colectas
    ADD CONSTRAINT instituto_colectas_pkey PRIMARY KEY (id_institucion, id_evento_recoleccion);
 T   ALTER TABLE ONLY public.instituto_colectas DROP CONSTRAINT instituto_colectas_pkey;
       public                 postgres    false    250    250            &           2606    41161    instituto instituto_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.instituto
    ADD CONSTRAINT instituto_pkey PRIMARY KEY (id_instituto);
 B   ALTER TABLE ONLY public.instituto DROP CONSTRAINT instituto_pkey;
       public                 postgres    false    248            "           2606    41135    jerarquia jerarquia_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.jerarquia
    ADD CONSTRAINT jerarquia_pkey PRIMARY KEY (id_jerarquia);
 B   ALTER TABLE ONLY public.jerarquia DROP CONSTRAINT jerarquia_pkey;
       public                 postgres    false    244                       2606    40986    kingdom kingdom_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.kingdom
    ADD CONSTRAINT kingdom_pkey PRIMARY KEY (id_kingdom);
 >   ALTER TABLE ONLY public.kingdom DROP CONSTRAINT kingdom_pkey;
       public                 postgres    false    218            .           2606    41211 8   participacion_recoleccion participacion_recoleccion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.participacion_recoleccion
    ADD CONSTRAINT participacion_recoleccion_pkey PRIMARY KEY (id_recoleccion, id_trabajador);
 b   ALTER TABLE ONLY public.participacion_recoleccion DROP CONSTRAINT participacion_recoleccion_pkey;
       public                 postgres    false    252    252                        2606    41126    persona persona_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id_persona);
 >   ALTER TABLE ONLY public.persona DROP CONSTRAINT persona_pkey;
       public                 postgres    false    242            
           2606    40995    phylum phylum_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.phylum
    ADD CONSTRAINT phylum_pkey PRIMARY KEY (id_phylum);
 <   ALTER TABLE ONLY public.phylum DROP CONSTRAINT phylum_pkey;
       public                 postgres    false    220            ,           2606    41196     taxon_colecta taxon_colecta_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.taxon_colecta
    ADD CONSTRAINT taxon_colecta_pkey PRIMARY KEY (id_recoleccion, especimen);
 J   ALTER TABLE ONLY public.taxon_colecta DROP CONSTRAINT taxon_colecta_pkey;
       public                 postgres    false    251    251            2           2606    41244    taxonomia taxonomia_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_pkey PRIMARY KEY (taxonid);
 B   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_pkey;
       public                 postgres    false    254                       2606    41023 "   taxonomiaorder taxonomiaorder_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.taxonomiaorder
    ADD CONSTRAINT taxonomiaorder_pkey PRIMARY KEY (id_order);
 L   ALTER TABLE ONLY public.taxonomiaorder DROP CONSTRAINT taxonomiaorder_pkey;
       public                 postgres    false    224            (           2606    41166 2   trabajador_institucion trabajador_institucion_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.trabajador_institucion
    ADD CONSTRAINT trabajador_institucion_pkey PRIMARY KEY (id_trabajador, id_institucion);
 \   ALTER TABLE ONLY public.trabajador_institucion DROP CONSTRAINT trabajador_institucion_pkey;
       public                 postgres    false    249    249            $           2606    41142    trabajador trabajador_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_pkey PRIMARY KEY (id_trabajador);
 D   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_pkey;
       public                 postgres    false    246                       2606    41092    ubicacion ubicacion_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.ubicacion
    ADD CONSTRAINT ubicacion_pkey PRIMARY KEY (id_ubicacion);
 B   ALTER TABLE ONLY public.ubicacion DROP CONSTRAINT ubicacion_pkey;
       public                 postgres    false    236            4           2606    41010    class class_id_phylum_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.class
    ADD CONSTRAINT class_id_phylum_fkey FOREIGN KEY (id_phylum) REFERENCES public.phylum(id_phylum) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.class DROP CONSTRAINT class_id_phylum_fkey;
       public               postgres    false    4874    220    222            D           2606    41227 7   especimen_imagenes especimen_imagenes_id_especimen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.especimen_imagenes
    ADD CONSTRAINT especimen_imagenes_id_especimen_fkey FOREIGN KEY (id_especimen) REFERENCES public.especimen(catalognumber);
 a   ALTER TABLE ONLY public.especimen_imagenes DROP CONSTRAINT especimen_imagenes_id_especimen_fkey;
       public               postgres    false    4886    232    253            E           2606    41232 2   especimen_imagenes especimen_imagenes_id_foto_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.especimen_imagenes
    ADD CONSTRAINT especimen_imagenes_id_foto_fkey FOREIGN KEY (id_foto) REFERENCES public.imagenes(id_foto);
 \   ALTER TABLE ONLY public.especimen_imagenes DROP CONSTRAINT especimen_imagenes_id_foto_fkey;
       public               postgres    false    253    4888    234            8           2606    41100 9   evento_de_coleccion evento_de_coleccion_id_ubicacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.evento_de_coleccion
    ADD CONSTRAINT evento_de_coleccion_id_ubicacion_fkey FOREIGN KEY (id_ubicacion) REFERENCES public.ubicacion(id_ubicacion) ON DELETE CASCADE;
 c   ALTER TABLE ONLY public.evento_de_coleccion DROP CONSTRAINT evento_de_coleccion_id_ubicacion_fkey;
       public               postgres    false    236    4890    238            6           2606    41038    family family_id_order_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.family
    ADD CONSTRAINT family_id_order_fkey FOREIGN KEY (id_order) REFERENCES public.taxonomiaorder(id_order) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.family DROP CONSTRAINT family_id_order_fkey;
       public               postgres    false    224    226    4878            7           2606    41052    genus genus_id_family_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.genus
    ADD CONSTRAINT genus_id_family_fkey FOREIGN KEY (id_family) REFERENCES public.family(id_family) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.genus DROP CONSTRAINT genus_id_family_fkey;
       public               postgres    false    226    4880    228            9           2606    41112 -   info_recoleccion info_recoleccion_evento_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.info_recoleccion
    ADD CONSTRAINT info_recoleccion_evento_fkey FOREIGN KEY (evento) REFERENCES public.evento_de_coleccion(id_evento_recoleccion) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.info_recoleccion DROP CONSTRAINT info_recoleccion_evento_fkey;
       public               postgres    false    240    238    4892            >           2606    41187 @   instituto_colectas instituto_colectas_id_evento_recoleccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.instituto_colectas
    ADD CONSTRAINT instituto_colectas_id_evento_recoleccion_fkey FOREIGN KEY (id_evento_recoleccion) REFERENCES public.evento_de_coleccion(id_evento_recoleccion);
 j   ALTER TABLE ONLY public.instituto_colectas DROP CONSTRAINT instituto_colectas_id_evento_recoleccion_fkey;
       public               postgres    false    238    4892    250            ?           2606    41182 9   instituto_colectas instituto_colectas_id_institucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.instituto_colectas
    ADD CONSTRAINT instituto_colectas_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.instituto(id_instituto);
 c   ALTER TABLE ONLY public.instituto_colectas DROP CONSTRAINT instituto_colectas_id_institucion_fkey;
       public               postgres    false    248    250    4902            B           2606    41212 G   participacion_recoleccion participacion_recoleccion_id_recoleccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.participacion_recoleccion
    ADD CONSTRAINT participacion_recoleccion_id_recoleccion_fkey FOREIGN KEY (id_recoleccion) REFERENCES public.info_recoleccion(id_recoleccion);
 q   ALTER TABLE ONLY public.participacion_recoleccion DROP CONSTRAINT participacion_recoleccion_id_recoleccion_fkey;
       public               postgres    false    4894    240    252            C           2606    41217 F   participacion_recoleccion participacion_recoleccion_id_trabajador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.participacion_recoleccion
    ADD CONSTRAINT participacion_recoleccion_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES public.trabajador(id_trabajador);
 p   ALTER TABLE ONLY public.participacion_recoleccion DROP CONSTRAINT participacion_recoleccion_id_trabajador_fkey;
       public               postgres    false    252    4900    246            3           2606    40996    phylum phylum_id_reino_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.phylum
    ADD CONSTRAINT phylum_id_reino_fkey FOREIGN KEY (id_reino) REFERENCES public.kingdom(id_kingdom) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.phylum DROP CONSTRAINT phylum_id_reino_fkey;
       public               postgres    false    218    220    4872            @           2606    41202 *   taxon_colecta taxon_colecta_especimen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxon_colecta
    ADD CONSTRAINT taxon_colecta_especimen_fkey FOREIGN KEY (especimen) REFERENCES public.especimen(catalognumber);
 T   ALTER TABLE ONLY public.taxon_colecta DROP CONSTRAINT taxon_colecta_especimen_fkey;
       public               postgres    false    4886    251    232            A           2606    41197 /   taxon_colecta taxon_colecta_id_recoleccion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxon_colecta
    ADD CONSTRAINT taxon_colecta_id_recoleccion_fkey FOREIGN KEY (id_recoleccion) REFERENCES public.info_recoleccion(id_recoleccion);
 Y   ALTER TABLE ONLY public.taxon_colecta DROP CONSTRAINT taxon_colecta_id_recoleccion_fkey;
       public               postgres    false    4894    251    240            F           2606    41260    taxonomia taxonomia_class_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_class_fkey FOREIGN KEY (class) REFERENCES public.class(id_class) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_class_fkey;
       public               postgres    false    222    254    4876            G           2606    41270    taxonomia taxonomia_family_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_family_fkey FOREIGN KEY (family) REFERENCES public.family(id_family) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_family_fkey;
       public               postgres    false    254    4880    226            H           2606    41275    taxonomia taxonomia_genus_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_genus_fkey FOREIGN KEY (genus) REFERENCES public.genus(id_genus) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_genus_fkey;
       public               postgres    false    254    228    4882            I           2606    41245 %   taxonomia taxonomia_id_especimen_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_id_especimen_fkey FOREIGN KEY (id_especimen) REFERENCES public.especimen(catalognumber);
 O   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_id_especimen_fkey;
       public               postgres    false    254    4886    232            J           2606    41250     taxonomia taxonomia_kingdom_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_kingdom_fkey FOREIGN KEY (kingdom) REFERENCES public.kingdom(id_kingdom) ON DELETE SET NULL;
 J   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_kingdom_fkey;
       public               postgres    false    254    218    4872            K           2606    41265 (   taxonomia taxonomia_order_taxonomia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_order_taxonomia_fkey FOREIGN KEY (order_taxonomia) REFERENCES public.taxonomiaorder(id_order) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_order_taxonomia_fkey;
       public               postgres    false    254    4878    224            L           2606    41255    taxonomia taxonomia_phylum_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_phylum_fkey FOREIGN KEY (phylum) REFERENCES public.phylum(id_phylum) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_phylum_fkey;
       public               postgres    false    254    4874    220            M           2606    41280 (   taxonomia taxonomia_specificepithet_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomia
    ADD CONSTRAINT taxonomia_specificepithet_fkey FOREIGN KEY (specificepithet) REFERENCES public.epiteloespecifico(id_specificepithet) ON DELETE SET NULL;
 R   ALTER TABLE ONLY public.taxonomia DROP CONSTRAINT taxonomia_specificepithet_fkey;
       public               postgres    false    254    4884    230            5           2606    41024 +   taxonomiaorder taxonomiaorder_id_class_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxonomiaorder
    ADD CONSTRAINT taxonomiaorder_id_class_fkey FOREIGN KEY (id_class) REFERENCES public.class(id_class) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.taxonomiaorder DROP CONSTRAINT taxonomiaorder_id_class_fkey;
       public               postgres    false    4876    224    222            :           2606    41148 %   trabajador trabajador_id_persona_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_id_persona_fkey FOREIGN KEY (id_persona) REFERENCES public.persona(id_persona) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_id_persona_fkey;
       public               postgres    false    246    4896    242            <           2606    41172 A   trabajador_institucion trabajador_institucion_id_institucion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador_institucion
    ADD CONSTRAINT trabajador_institucion_id_institucion_fkey FOREIGN KEY (id_institucion) REFERENCES public.instituto(id_instituto);
 k   ALTER TABLE ONLY public.trabajador_institucion DROP CONSTRAINT trabajador_institucion_id_institucion_fkey;
       public               postgres    false    4902    249    248            =           2606    41167 @   trabajador_institucion trabajador_institucion_id_trabajador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador_institucion
    ADD CONSTRAINT trabajador_institucion_id_trabajador_fkey FOREIGN KEY (id_trabajador) REFERENCES public.trabajador(id_trabajador);
 j   ALTER TABLE ONLY public.trabajador_institucion DROP CONSTRAINT trabajador_institucion_id_trabajador_fkey;
       public               postgres    false    246    4900    249            ;           2606    41143 *   trabajador trabajador_tipo_trabajador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.trabajador
    ADD CONSTRAINT trabajador_tipo_trabajador_fkey FOREIGN KEY (tipo_trabajador) REFERENCES public.jerarquia(id_jerarquia) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.trabajador DROP CONSTRAINT trabajador_tipo_trabajador_fkey;
       public               postgres    false    246    244    4898            �      x�3���+NM.I�4����� )��      �      x�3�L.J-�,I�+����� 0Q�      �   1   x�3�t*JL���+-VH.J-�,I�+�tL)�)�����s�r��qqq 5�            x�3�4����� ]      �   "   x�3�4202�50�54U04�2 !NC�=... L$�      �      x�3�tN,JL�LIL�4����� 4��      �      x�3�t*JL���+-�4����� 7�      �   2   x�3��())(���O�H�-�I�K���O*JL���+-6��*H����� 7��      �      x�3�4����� ]         W   x�3���+.�,)-�W�KL���K�QHIUpM���O?�6�ӱLO���(=5�$�X!��H���XG�9�4%1����ʊ��|�=... �G�            x�3�4����� ]      �   #   x�3�JM��IM.�/�2�(�OK-2c���� ��      �   !   x�3�t���M��L�2�,(*MMJ����� `��            x�3�4�2�4����� ��      �   K   x�3��*M��8��(���ؔ���������̜�7�"391/�ˈ�1/�����\�#�Ks3Sc��=... sCp      �      x�3�t,*�(�/�OI�4����� ?�;            x�3�4����� ]         S   x�3L36130N�M340�5141յ4ON�56207030IJ1H�4���+NM.��t*JL���+-VH.J-�,I�+�"A�=... ���      �      x�3�t��I�/(I-J�4����� ?T5      �      x�3�4�4�2�B�=... 
            x�3�4�2�=... ��      �   l   x�3�4��3162�Ե��3466�4221�t�,MILQHIU�=��"39��)���4U�$5� '1%�3*?/Q��(�$5=3%Q!9?O!1�$Q!)3?%�,��(������ ��     