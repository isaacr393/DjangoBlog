PGDMP     2                    w            blogDB    10.6 (Debian 10.6-1.pgdg90+1)    10.6 (Debian 10.6-1.pgdg90+1) �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    49155    blogDB    DATABASE     z   CREATE DATABASE "blogDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'es_VE.UTF-8' LC_CTYPE = 'es_VE.UTF-8';
    DROP DATABASE "blogDB";
             isaac    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12980    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    49187 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         isaac    false    3            �            1259    49185    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       isaac    false    203    3            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       isaac    false    202            �            1259    49197    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         isaac    false    3            �            1259    49195    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       isaac    false    3    205            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       isaac    false    204            �            1259    49179    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         isaac    false    3            �            1259    49177    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       isaac    false    3    201            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       isaac    false    200            �            1259    49205 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         isaac    false    3            �            1259    49215    auth_user_groups    TABLE        CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         isaac    false    3            �            1259    49213    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       isaac    false    3    209            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       isaac    false    208            �            1259    49203    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       isaac    false    207    3            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       isaac    false    206            �            1259    49223    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         isaac    false    3            �            1259    49221 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       isaac    false    211    3            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       isaac    false    210            �            1259    49343    blog_comentarios    TABLE     �  CREATE TABLE public.blog_comentarios (
    id integer NOT NULL,
    contenido text NOT NULL,
    "fechaEmision" date NOT NULL,
    me_gusta integer NOT NULL,
    author_id integer NOT NULL,
    post_id integer NOT NULL,
    "comentarioPadre_id" integer,
    orden integer,
    CONSTRAINT blog_comentarios_me_gusta_check CHECK ((me_gusta >= 0)),
    CONSTRAINT blog_comentarios_orden_check CHECK ((orden >= 0))
);
 $   DROP TABLE public.blog_comentarios;
       public         isaac    false    3            �            1259    49341    blog_comentarios_id_seq    SEQUENCE     �   CREATE SEQUENCE public.blog_comentarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.blog_comentarios_id_seq;
       public       isaac    false    3    221            �           0    0    blog_comentarios_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.blog_comentarios_id_seq OWNED BY public.blog_comentarios.id;
            public       isaac    false    220            �            1259    49316    blog_perfil    TABLE     h   CREATE TABLE public.blog_perfil (
    id integer NOT NULL,
    perfil character varying(10) NOT NULL
);
    DROP TABLE public.blog_perfil;
       public         isaac    false    3            �            1259    49314    blog_perfil_id_seq    SEQUENCE     �   CREATE SEQUENCE public.blog_perfil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.blog_perfil_id_seq;
       public       isaac    false    215    3            �           0    0    blog_perfil_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.blog_perfil_id_seq OWNED BY public.blog_perfil.id;
            public       isaac    false    214            �            1259    49332 	   blog_post    TABLE       CREATE TABLE public.blog_post (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    tags character varying(100) NOT NULL,
    contenido text NOT NULL,
    "fechaEmision" date NOT NULL,
    author_id integer NOT NULL,
    "perfilVer_id" integer NOT NULL
);
    DROP TABLE public.blog_post;
       public         isaac    false    3            �            1259    49330    blog_post_id_seq    SEQUENCE     �   CREATE SEQUENCE public.blog_post_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.blog_post_id_seq;
       public       isaac    false    3    219            �           0    0    blog_post_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.blog_post_id_seq OWNED BY public.blog_post.id;
            public       isaac    false    218            �            1259    49324    blog_usuario    TABLE     �   CREATE TABLE public.blog_usuario (
    id integer NOT NULL,
    "user" character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    perfil_id integer NOT NULL
);
     DROP TABLE public.blog_usuario;
       public         isaac    false    3            �            1259    49322    blog_usuario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.blog_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.blog_usuario_id_seq;
       public       isaac    false    217    3            �           0    0    blog_usuario_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.blog_usuario_id_seq OWNED BY public.blog_usuario.id;
            public       isaac    false    216            �            1259    49283    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         isaac    false    3            �            1259    49281    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       isaac    false    213    3            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       isaac    false    212            �            1259    49169    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         isaac    false    3            �            1259    49167    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       isaac    false    3    199            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       isaac    false    198            �            1259    49158    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         isaac    false    3            �            1259    49156    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       isaac    false    197    3            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       isaac    false    196            �            1259    49389    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         isaac    false    3            �
           2604    49190    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       isaac    false    203    202    203            �
           2604    49200    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       isaac    false    205    204    205            �
           2604    49182    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       isaac    false    201    200    201            �
           2604    49208    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       isaac    false    207    206    207            �
           2604    49218    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       isaac    false    209    208    209            �
           2604    49226    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       isaac    false    211    210    211                       2604    49346    blog_comentarios id    DEFAULT     z   ALTER TABLE ONLY public.blog_comentarios ALTER COLUMN id SET DEFAULT nextval('public.blog_comentarios_id_seq'::regclass);
 B   ALTER TABLE public.blog_comentarios ALTER COLUMN id DROP DEFAULT;
       public       isaac    false    221    220    221                       2604    49319    blog_perfil id    DEFAULT     p   ALTER TABLE ONLY public.blog_perfil ALTER COLUMN id SET DEFAULT nextval('public.blog_perfil_id_seq'::regclass);
 =   ALTER TABLE public.blog_perfil ALTER COLUMN id DROP DEFAULT;
       public       isaac    false    215    214    215                       2604    49335    blog_post id    DEFAULT     l   ALTER TABLE ONLY public.blog_post ALTER COLUMN id SET DEFAULT nextval('public.blog_post_id_seq'::regclass);
 ;   ALTER TABLE public.blog_post ALTER COLUMN id DROP DEFAULT;
       public       isaac    false    218    219    219                       2604    49327    blog_usuario id    DEFAULT     r   ALTER TABLE ONLY public.blog_usuario ALTER COLUMN id SET DEFAULT nextval('public.blog_usuario_id_seq'::regclass);
 >   ALTER TABLE public.blog_usuario ALTER COLUMN id DROP DEFAULT;
       public       isaac    false    216    217    217            �
           2604    49286    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       isaac    false    213    212    213            �
           2604    49172    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       isaac    false    199    198    199            �
           2604    49161    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       isaac    false    196    197    197            �          0    49187 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       isaac    false    203   �       �          0    49197    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       isaac    false    205   !�       �          0    49179    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       isaac    false    201   >�       �          0    49205 	   auth_user 
   TABLE DATA               �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       isaac    false    207   �       �          0    49215    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       isaac    false    209   ��       �          0    49223    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       isaac    false    211   ��       �          0    49343    blog_comentarios 
   TABLE DATA               �   COPY public.blog_comentarios (id, contenido, "fechaEmision", me_gusta, author_id, post_id, "comentarioPadre_id", orden) FROM stdin;
    public       isaac    false    221   ͹       �          0    49316    blog_perfil 
   TABLE DATA               1   COPY public.blog_perfil (id, perfil) FROM stdin;
    public       isaac    false    215   @�       �          0    49332 	   blog_post 
   TABLE DATA               j   COPY public.blog_post (id, title, tags, contenido, "fechaEmision", author_id, "perfilVer_id") FROM stdin;
    public       isaac    false    219   l�       �          0    49324    blog_usuario 
   TABLE DATA               G   COPY public.blog_usuario (id, "user", password, perfil_id) FROM stdin;
    public       isaac    false    217   a�       �          0    49283    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       isaac    false    213   ��       �          0    49169    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       isaac    false    199   �       �          0    49158    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       isaac    false    197   ��       �          0    49389    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       isaac    false    222   ��       �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       isaac    false    202            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       isaac    false    204            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);
            public       isaac    false    200            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       isaac    false    208                        0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);
            public       isaac    false    206                       0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
            public       isaac    false    210                       0    0    blog_comentarios_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.blog_comentarios_id_seq', 131, true);
            public       isaac    false    220                       0    0    blog_perfil_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.blog_perfil_id_seq', 2, true);
            public       isaac    false    214                       0    0    blog_post_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.blog_post_id_seq', 16, true);
            public       isaac    false    218                       0    0    blog_usuario_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.blog_usuario_id_seq', 2, true);
            public       isaac    false    216                       0    0    django_admin_log_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 127, true);
            public       isaac    false    212                       0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);
            public       isaac    false    198                       0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);
            public       isaac    false    196                       2606    49312    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         isaac    false    203                       2606    49249 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         isaac    false    205    205                       2606    49202 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         isaac    false    205                       2606    49192    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         isaac    false    203                       2606    49235 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         isaac    false    201    201                       2606    49184 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         isaac    false    201            $           2606    49220 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         isaac    false    209            '           2606    49264 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         isaac    false    209    209                       2606    49210    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         isaac    false    207            *           2606    49228 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         isaac    false    211            -           2606    49278 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         isaac    false    211    211            !           2606    49306     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         isaac    false    207            =           2606    49352 &   blog_comentarios blog_comentarios_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.blog_comentarios
    ADD CONSTRAINT blog_comentarios_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.blog_comentarios DROP CONSTRAINT blog_comentarios_pkey;
       public         isaac    false    221            3           2606    49321    blog_perfil blog_perfil_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.blog_perfil
    ADD CONSTRAINT blog_perfil_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.blog_perfil DROP CONSTRAINT blog_perfil_pkey;
       public         isaac    false    215            :           2606    49340    blog_post blog_post_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.blog_post DROP CONSTRAINT blog_post_pkey;
       public         isaac    false    219            6           2606    49329    blog_usuario blog_usuario_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.blog_usuario
    ADD CONSTRAINT blog_usuario_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.blog_usuario DROP CONSTRAINT blog_usuario_pkey;
       public         isaac    false    217            0           2606    49292 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         isaac    false    213            
           2606    49176 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         isaac    false    199    199                       2606    49174 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         isaac    false    199                       2606    49166 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         isaac    false    197            B           2606    49396 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         isaac    false    222                       1259    49313    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         isaac    false    203                       1259    49250 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         isaac    false    205                       1259    49251 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         isaac    false    205                       1259    49236 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         isaac    false    201            "           1259    49266 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         isaac    false    209            %           1259    49265 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         isaac    false    209            (           1259    49280 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         isaac    false    211            +           1259    49279 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         isaac    false    211                       1259    49307     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         isaac    false    207            ;           1259    49386 #   blog_comentarios_author_id_c7891fc7    INDEX     e   CREATE INDEX blog_comentarios_author_id_c7891fc7 ON public.blog_comentarios USING btree (author_id);
 7   DROP INDEX public.blog_comentarios_author_id_c7891fc7;
       public         isaac    false    221            >           1259    49387 !   blog_comentarios_post_id_f73310cd    INDEX     a   CREATE INDEX blog_comentarios_post_id_f73310cd ON public.blog_comentarios USING btree (post_id);
 5   DROP INDEX public.blog_comentarios_post_id_f73310cd;
       public         isaac    false    221            ?           1259    49388 0   blog_comentarios_siguienteComentario_id_b876be29    INDEX        CREATE INDEX "blog_comentarios_siguienteComentario_id_b876be29" ON public.blog_comentarios USING btree ("comentarioPadre_id");
 F   DROP INDEX public."blog_comentarios_siguienteComentario_id_b876be29";
       public         isaac    false    221            7           1259    49369    blog_post_author_id_dd7a8485    INDEX     W   CREATE INDEX blog_post_author_id_dd7a8485 ON public.blog_post USING btree (author_id);
 0   DROP INDEX public.blog_post_author_id_dd7a8485;
       public         isaac    false    219            8           1259    49370    blog_post_perfilVer_id_244e93de    INDEX     a   CREATE INDEX "blog_post_perfilVer_id_244e93de" ON public.blog_post USING btree ("perfilVer_id");
 5   DROP INDEX public."blog_post_perfilVer_id_244e93de";
       public         isaac    false    219            4           1259    49358    blog_usuario_perfil_id_8ee480f3    INDEX     ]   CREATE INDEX blog_usuario_perfil_id_8ee480f3 ON public.blog_usuario USING btree (perfil_id);
 3   DROP INDEX public.blog_usuario_perfil_id_8ee480f3;
       public         isaac    false    217            .           1259    49303 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         isaac    false    213            1           1259    49304 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         isaac    false    213            @           1259    49398 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         isaac    false    222            C           1259    49397 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         isaac    false    222            F           2606    49243 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       isaac    false    205    2833    201            E           2606    49238 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       isaac    false    205    2838    203            D           2606    49229 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       isaac    false    199    201    2828            H           2606    49258 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       isaac    false    2838    209    203            G           2606    49253 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       isaac    false    2846    209    207            J           2606    49272 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       isaac    false    211    2833    201            I           2606    49267 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       isaac    false    211    207    2846            Q           2606    49371 G   blog_comentarios blog_comentarios_author_id_c7891fc7_fk_blog_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.blog_comentarios
    ADD CONSTRAINT blog_comentarios_author_id_c7891fc7_fk_blog_usuario_id FOREIGN KEY (author_id) REFERENCES public.blog_usuario(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.blog_comentarios DROP CONSTRAINT blog_comentarios_author_id_c7891fc7_fk_blog_usuario_id;
       public       isaac    false    2870    217    221            P           2606    65539 J   blog_comentarios blog_comentarios_comentarioPadre_id_17d9e3f1_fk_blog_come    FK CONSTRAINT     �   ALTER TABLE ONLY public.blog_comentarios
    ADD CONSTRAINT "blog_comentarios_comentarioPadre_id_17d9e3f1_fk_blog_come" FOREIGN KEY ("comentarioPadre_id") REFERENCES public.blog_comentarios(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.blog_comentarios DROP CONSTRAINT "blog_comentarios_comentarioPadre_id_17d9e3f1_fk_blog_come";
       public       isaac    false    2877    221    221            R           2606    49376 B   blog_comentarios blog_comentarios_post_id_f73310cd_fk_blog_post_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.blog_comentarios
    ADD CONSTRAINT blog_comentarios_post_id_f73310cd_fk_blog_post_id FOREIGN KEY (post_id) REFERENCES public.blog_post(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.blog_comentarios DROP CONSTRAINT blog_comentarios_post_id_f73310cd_fk_blog_post_id;
       public       isaac    false    2874    221    219            N           2606    49359 9   blog_post blog_post_author_id_dd7a8485_fk_blog_usuario_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT blog_post_author_id_dd7a8485_fk_blog_usuario_id FOREIGN KEY (author_id) REFERENCES public.blog_usuario(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.blog_post DROP CONSTRAINT blog_post_author_id_dd7a8485_fk_blog_usuario_id;
       public       isaac    false    219    2870    217            O           2606    49364 ;   blog_post blog_post_perfilVer_id_244e93de_fk_blog_perfil_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.blog_post
    ADD CONSTRAINT "blog_post_perfilVer_id_244e93de_fk_blog_perfil_id" FOREIGN KEY ("perfilVer_id") REFERENCES public.blog_perfil(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.blog_post DROP CONSTRAINT "blog_post_perfilVer_id_244e93de_fk_blog_perfil_id";
       public       isaac    false    219    2867    215            M           2606    49353 >   blog_usuario blog_usuario_perfil_id_8ee480f3_fk_blog_perfil_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.blog_usuario
    ADD CONSTRAINT blog_usuario_perfil_id_8ee480f3_fk_blog_perfil_id FOREIGN KEY (perfil_id) REFERENCES public.blog_perfil(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.blog_usuario DROP CONSTRAINT blog_usuario_perfil_id_8ee480f3_fk_blog_perfil_id;
       public       isaac    false    2867    217    215            K           2606    49293 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       isaac    false    2828    199    213            L           2606    49298 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       isaac    false    213    2846    207            �      x������ � �      �      x������ � �      �   �  x�]�Kn�0@��)8A�|׽F�
%n�� ��*���=3��̓x�1���~/�ӣ�㶼�Q���p���O?>���@��?�&�8"��w�;U��L��,X����RZ�N$��DKiq���~y�:L�r�@m.\D�h�aÝ�b��'Pp�˦��U���M��p�^�����,p��&��6�[��b{�^U`��c�M�EN0
	��^'�8o/�y�AW�&[�>��5�I[�;1�1Q;a��1�:A`�����=<U�:m�Sc��� jNmE���ME$�@�Z��e�T�9�I��,*19*Č�*a9-�,�+A"�5�
wxLW�aby�])�l.��,��90��<0c_��b��M�������:�$��D�k<���������Ck�Q�      �   �   x��O�0����)<x���׹�A�1����"��Z*sQ}���s}�4��r�C{?b,}�����n�,&�d~ކ�D|�Ζ�\M�}݄�W���jW�J�����3�ŀ � H� 7���qA�u�H�u�_�������c$@v/��� k(6      �      x������ � �      �      x������ � �      �   c   x�34��ίT��/N�420��54�54�4�4�?N.C#KN���D�b�:����d\
�8+����K�K��1�3�4�)�M,�L�aZ� =�"�      �      x�3�tt����2�v����� +��      �   �  x��T�n�H<�|E�-#3q�����&� �BI��A���û���c��?�bk,;�S��n��E�����)���o5��s.�'�K$w�?�g�H����d�+�g�����u���,��V�WX�$�p����2K4��D	au���v5�����)2,��p�k,�9���J�.�:�@��B"h�,��_5�U��-��;N��SsV�j���2 ���)qdg\�<�죜KO�a�2p_j�;>�d���0�E#T�_��t��ÿU�f���l'�G`�2h�����%���]v�u�O���U<��(�q�i�t�jA��?h������Š�Sk��鵥����S-K����3V�+TnD͋$�k��rɱ7孢A3�ǛO�2��!=z,H�Z�5J��������I��;�����F�Z���Ҽ#d���!�ɨ#�� �{���Z$G���xlr�н#��O����U��^������'/�۬66k;�W��O�ͺ��a�&�a�~g�^��{��B�e�~�4@��<H���a�L�T���>q�O܂;KҎ���ַx-I�d�v;�����A~��u�s㍣<�9lwo���H�B�K] ߘ|g}��҅�8���~�v9g�=X���+�7����ƽZ������W���Ha���c�-%�hj��}�7�s�A�.�6O[����?�?ԇt�:�Ȗ�l��N܋F��x�Z};�      �   /   x�3��,.�,K,҉��ƖƜ�\F��y�ř�0$l����� x��      �   k  x����n%�Fc�S\l���GVu��,�pd;�=�;�B���P~������ڀxn7밪�Hw\(>�X���m)~��D�X��~�=��������u��������������O�O�-��~��ow~��=���Em%��g$9�b)v�-<���/��??<��j����E|)zU)�2Pz�������|�������x��|���r����P�t�%6�',릵��5ƻv�O�Ͽ>~z��u�,ڃQ�f�e��Ϸ������������ya��%Զ��?���?�~z��|�x'w�.�&�mS�,�,B�к�O֭�-�k	o�=h��������-�\B�뺤�_�p	���K���t��Dh�r-����_��ӗ���U��W���+!V�B ��A�%�0�����
����i��t���Uu8 @��	�m@�N�C��Zc3��"(�]�����"�9��!@ДL�<�ڈ��� ��z5��-�c!V�h��;�d(� a-����P����;B���`
�bq�r'XPl	�q0x�����J�J���)G+�� ���8Cp�9Z�#Di%�9�3I���ы���iB�f��Ev���yB��^z��
���`7{�)<"���S��n>XNN9��.a#�`;)�lg�:r&���N�v��^��Ii�`;cU�jR��X��QF��դTS��v-Ž���jR��o�\����_����"��a����pX�C#,t���a5�pU��4�"R!Bz�q�OLi� �e������)p����*{@p���V �7V2�Mù�2WaD�B{w�s�e�0,�Z����gXNM9˩�<�t�rj�iXN+�� (�SSN�rZߋ�_)�SSN�rZߋ2^۩i�a;�������i�a;kߋQO۩i�a;{wB���Ԕ�b9��d�H��Ԕ�b9�r�XNM9+�s�Nh��))g�r��ɶ��ݔt�b7��d��`7%ݬ�����޳b7%ݬ�M�y�Y���nV�f�x%]���jV��[�������uRS.��A�bq��m޶�l�͖n���:mg�a7[��#TJ݊H�n�t�1FT/�T�fM7�@DO�R��XΚr6�^�D6�����0�b�z2#H7[�W�1��n�t�5����bH�r֔�9F�i4�YSΆ�ԵG1�r֔ӱ���#U,gM9�ً�9+�����V�X�.�6��Fj8"-#�����F�m8"-#�Fc��p@Z�'7ۚpJYH�T����Ro���u���n鷷�.�~LI�S���c�F)��zˣ�qD�"|�2uLS��)g���"�S�rz���4:x�rz��A��h��U�"�8"�	��:&�����;"����E�ߞ~�a�xͅc�=�z@0/Z�Q��FĄha�؋��p��Vc<�"&/#"�@,��ZP)QYiv���cbfh�(�~2��q�sg��������qTt=&����$v<��{9�3��G`��1M��QѝѪ�����4�/GG{�G�7��o�1�>��i�^���7o��S�!z9�:(���A|9�Ϧe�)b����A�$e���h���ht�ug�-ѭ�-&��(����uԷ_	��1Y�T���;�]W�0e����J/qEvQN�eeҍ����W�ɕO��|�(�����3��`�壴;�9x��dZ�8�/�c���(�̑~+-/��Xm�1�<�@�n���j+�Z���n˸u�ӛ����H�eȵ���*mߖ�[��Zn�L�)A�w�I^�o���o��Rk��ˉtӈ��K�������E�mwO=M�i�X�)����5�I���7�wK3�6���&��������mp}6�����~���Dߩ�      �   x   x�M�K�0Dמ� ʟ��I�)��8��Eo�! �����
�3-2s��bG��'�*�`ߡ��h%��7�Xq�Iru����p"�`�g���-h\:z�#.�v�$y�;7��X�m���9�      �   �  x���ݎ� F�����b��<K%Dc�E��������KR�+���1�a|���ō�r���B���/���g"Ϡ \�0�J�J���6v]ގ�� $���n��A��V	r�=#h�pKuƻ�n�Τ탱]�À8�����d����Ň�����\߂�&�,%%/��/����_�h��B�%Q%�>4�_\4�����\RΛ�~�ލ��j%�,�TE���ir����I��])앒�RN��}=�J*hF ������d�>����5=Q�Q� T�Hv��>V�Ż���!ZqY���)�R�m�;��8��C4��g{�O�*�8Zqj�΁f�QʢX%�/����8>P�dC�bX��a���*Q1`�))rf����r"��I8t^6�R���6��D��~�jf��c�����u'|<y=Q L��jK�3��FuA�J��,o����i�)MiM��iJ�h��Z���P�,��!H}�M���	ㅤA[�9�[?������{�      �   V  x��ˎ�0���S�$�D�
J4v�lu�%	�B�d�O_�EZ��JUW�wG���|�?.�ݱ�����ۭ������
)�኏#����T����fc(���#>��/5�Z�aG�xiKL��,T^U��1�[���>K6������S��eP�˔�ByG��c(�5�-*6=����H3��3���P+5�=S��<X�T3H��W/��"Cۖ/B'�љ%v���ȑ
��7��?�O��Ɖ'y�-XB/<�e؀O#�7�x/��cwn��`�f`�;U5���S��;4�}�. ��P#f
@fL������d�Q?R���J�i~�x)Y�����_��p��gv�@8���v�3o�,���\���9e��,�<S���|;��~r�����@�ȝe�-w�0���`w>���Z���4�%���8��f�^��bDE�^I&����b�*Ⳏ
ّ������xU#OX��vx��l�d30����uy���7Q�%a��-��SW�6�Q���U��M�zS�-��<tKhۧ��
txx�E�r�{xE��P=�x}U븬�!�'�M��C�`~��h��#w�-8�Ad��w��t<OX��     