PGDMP                         u        	   practica1    9.6.5    9.6.5 %    ~           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16400 	   practica1    DATABASE     �   CREATE DATABASE practica1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Mexico.1252' LC_CTYPE = 'Spanish_Mexico.1252';
    DROP DATABASE practica1;
             postgres    false            	            2615    24610    Casillas    SCHEMA        CREATE SCHEMA "Casillas";
    DROP SCHEMA "Casillas";
             postgres    false            
            2615    16401 
   Geografico    SCHEMA        CREATE SCHEMA "Geografico";
    DROP SCHEMA "Geografico";
             postgres    false                        2615    24624    Partidos_politicos    SCHEMA     $   CREATE SCHEMA "Partidos_politicos";
 "   DROP SCHEMA "Partidos_politicos";
             postgres    false                        2615    24640    Representantes    SCHEMA         CREATE SCHEMA "Representantes";
    DROP SCHEMA "Representantes";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12387    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    24611    casillas    TABLE     �   CREATE TABLE casillas (
    id_estado numeric(10,10) NOT NULL,
    id_distrito numeric(10,10) NOT NULL,
    seccion "char",
    tipo_casilla "char",
    aprobada boolean
);
     DROP TABLE "Casillas".casillas;
       Casillas         postgres    false    9            �            1259    24600 	   distritos    TABLE     ~   CREATE TABLE distritos (
    id_estado numeric(10,10) NOT NULL,
    id_distrito numeric(10,10) NOT NULL,
    nombre "char"
);
 #   DROP TABLE "Geografico".distritos;
    
   Geografico         postgres    false    10            �            1259    16402    estados    TABLE     \   CREATE TABLE estados (
    id_estado numeric(10,10) NOT NULL,
    nombre "char" NOT NULL
);
 !   DROP TABLE "Geografico".estados;
    
   Geografico         postgres    false    10            �            1259    24625    partidos    TABLE     �   CREATE TABLE partidos (
    id_estado numeric(10,10) NOT NULL,
    id_distrito numeric(10,10) NOT NULL,
    id_partido numeric(10,10) NOT NULL,
    nombre "char",
    siglas "char"
);
 *   DROP TABLE "Partidos_politicos".partidos;
       Partidos_politicos         postgres    false    7            �            1259    24653    Asistencias    TABLE         CREATE TABLE "Asistencias" (
);
 +   DROP TABLE "Representantes"."Asistencias";
       Representantes         postgres    false    8            �            1259    24650    Log_representantes_aprobados    TABLE     1   CREATE TABLE "Log_representantes_aprobados" (
);
 <   DROP TABLE "Representantes"."Log_representantes_aprobados";
       Representantes         postgres    false    8            �            1259    24641    Representantes_aprobados    TABLE     -   CREATE TABLE "Representantes_aprobados" (
);
 8   DROP TABLE "Representantes"."Representantes_aprobados";
       Representantes         postgres    false    8            �            1259    24644    Representantes_preliminares    TABLE     0   CREATE TABLE "Representantes_preliminares" (
);
 ;   DROP TABLE "Representantes"."Representantes_preliminares";
       Representantes         postgres    false    8            �            1259    24647    Representantes_sustituciones    TABLE     1   CREATE TABLE "Representantes_sustituciones" (
);
 <   DROP TABLE "Representantes"."Representantes_sustituciones";
       Representantes         postgres    false    8            u          0    24611    casillas 
   TABLE DATA               T   COPY casillas (id_estado, id_distrito, seccion, tipo_casilla, aprobada) FROM stdin;
    Casillas       postgres    false    191   %       t          0    24600 	   distritos 
   TABLE DATA               <   COPY distritos (id_estado, id_distrito, nombre) FROM stdin;
 
   Geografico       postgres    false    190   1%       s          0    16402    estados 
   TABLE DATA               -   COPY estados (id_estado, nombre) FROM stdin;
 
   Geografico       postgres    false    189   N%       v          0    24625    partidos 
   TABLE DATA               O   COPY partidos (id_estado, id_distrito, id_partido, nombre, siglas) FROM stdin;
    Partidos_politicos       postgres    false    192   k%       {          0    24653    Asistencias 
   TABLE DATA                   COPY "Asistencias"  FROM stdin;
    Representantes       postgres    false    197   �%       z          0    24650    Log_representantes_aprobados 
   TABLE DATA               1   COPY "Log_representantes_aprobados"  FROM stdin;
    Representantes       postgres    false    196   �%       w          0    24641    Representantes_aprobados 
   TABLE DATA               -   COPY "Representantes_aprobados"  FROM stdin;
    Representantes       postgres    false    193   �%       x          0    24644    Representantes_preliminares 
   TABLE DATA               0   COPY "Representantes_preliminares"  FROM stdin;
    Representantes       postgres    false    194   �%       y          0    24647    Representantes_sustituciones 
   TABLE DATA               1   COPY "Representantes_sustituciones"  FROM stdin;
    Representantes       postgres    false    195   �%       �           2606    24604    distritos distritos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY distritos
    ADD CONSTRAINT distritos_pkey PRIMARY KEY (id_distrito);
 H   ALTER TABLE ONLY "Geografico".distritos DROP CONSTRAINT distritos_pkey;
    
   Geografico         postgres    false    190    190            �           2606    24594    estados estados_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id_estado);
 D   ALTER TABLE ONLY "Geografico".estados DROP CONSTRAINT estados_pkey;
    
   Geografico         postgres    false    189    189            �           2606    24629    partidos partidos_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY partidos
    ADD CONSTRAINT partidos_pkey PRIMARY KEY (id_partido);
 N   ALTER TABLE ONLY "Partidos_politicos".partidos DROP CONSTRAINT partidos_pkey;
       Partidos_politicos         postgres    false    192    192            �           2606    24619 "   casillas casillas_id_distrito_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY casillas
    ADD CONSTRAINT casillas_id_distrito_fkey FOREIGN KEY (id_distrito) REFERENCES "Geografico".distritos(id_distrito);
 P   ALTER TABLE ONLY "Casillas".casillas DROP CONSTRAINT casillas_id_distrito_fkey;
       Casillas       postgres    false    190    2038    191            �           2606    24614     casillas casillas_id_estado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY casillas
    ADD CONSTRAINT casillas_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES "Geografico".estados(id_estado);
 N   ALTER TABLE ONLY "Casillas".casillas DROP CONSTRAINT casillas_id_estado_fkey;
       Casillas       postgres    false    191    2036    189            �           2606    24605    distritos id_estado    FK CONSTRAINT     o   ALTER TABLE ONLY distritos
    ADD CONSTRAINT id_estado FOREIGN KEY (id_estado) REFERENCES estados(id_estado);
 C   ALTER TABLE ONLY "Geografico".distritos DROP CONSTRAINT id_estado;
    
   Geografico       postgres    false    2036    189    190            �           2606    24635 "   partidos partidos_id_distrito_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY partidos
    ADD CONSTRAINT partidos_id_distrito_fkey FOREIGN KEY (id_distrito) REFERENCES "Geografico".distritos(id_distrito);
 Z   ALTER TABLE ONLY "Partidos_politicos".partidos DROP CONSTRAINT partidos_id_distrito_fkey;
       Partidos_politicos       postgres    false    192    2038    190            �           2606    24630     partidos partidos_id_estado_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY partidos
    ADD CONSTRAINT partidos_id_estado_fkey FOREIGN KEY (id_estado) REFERENCES "Geografico".estados(id_estado);
 X   ALTER TABLE ONLY "Partidos_politicos".partidos DROP CONSTRAINT partidos_id_estado_fkey;
       Partidos_politicos       postgres    false    192    189    2036            u      x������ � �      t      x������ � �      s      x������ � �      v      x������ � �      {      x������ � �      z      x������ � �      w      x������ � �      x      x������ � �      y      x������ � �     