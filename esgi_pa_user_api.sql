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

SET default_table_access_method = heap;

--
-- Name: character; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."character" (
    character_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    silvervalue integer NOT NULL,
    value integer NOT NULL,
    date_added date DEFAULT CURRENT_DATE
);


ALTER TABLE public."character" OWNER TO postgres;

--
-- Name: character_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.character_id_seq OWNER TO postgres;

--
-- Name: character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.character_id_seq OWNED BY public."character".character_id;


--
-- Name: skin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skin (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    value integer NOT NULL,
    data_added date DEFAULT CURRENT_DATE,
    "character" integer NOT NULL
);


ALTER TABLE public.skin OWNER TO postgres;

--
-- Name: skin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.skin_id_seq OWNER TO postgres;

--
-- Name: skin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skin_id_seq OWNED BY public.skin.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: banari
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(30),
    email character varying(30),
    password character varying(255)
);


ALTER TABLE public.users OWNER TO banari;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: banari
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO banari;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: banari
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: character character_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."character" ALTER COLUMN character_id SET DEFAULT nextval('public.character_id_seq'::regclass);


--
-- Name: skin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin ALTER COLUMN id SET DEFAULT nextval('public.skin_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: banari
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: character; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."character" (character_id, name, description, silvervalue, value, date_added) FROM stdin;
1	Crow	A mecanical elf mercenary engaged to obliterate his ennemies	1350	420	2023-05-24
2	Rider	The coolest racer in the entire world, faster the sound	1350	420	2023-05-24
3	Dummy	This dummy is hot	450	225	2023-05-24
4	Harpagon	The richest goblin in the city of Revel	1668	500	2023-05-24
\.


--
-- Data for Name: skin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skin (id, name, value, data_added, "character") FROM stdin;
1	Warrior of light Crow	1350	2023-05-24	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: banari
--

COPY public.users (id, username, email, password) FROM stdin;
1	notalk	notalk@gmail.com	idontTALK
2	aesilff	grosrat@gmail.com	ratatouille
\.


--
-- Name: character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.character_id_seq', 4, true);


--
-- Name: skin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skin_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: banari
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: character character_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."character"
    ADD CONSTRAINT character_pkey PRIMARY KEY (character_id);


--
-- Name: skin skin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin
    ADD CONSTRAINT skin_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: banari
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: skin fk_character_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skin
    ADD CONSTRAINT fk_character_id FOREIGN KEY ("character") REFERENCES public."character"(character_id);


--
-- PostgreSQL database dump complete
--
