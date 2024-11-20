--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(99) NOT NULL,
    planet_id integer,
    star_id integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(99) NOT NULL,
    absolute_magnitude numeric(50,2),
    description text,
    naked_eye_obs boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(99) NOT NULL,
    discovery_year integer,
    absolute_magnitude numeric(50,2),
    description text,
    naked_eye_obs boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(99) NOT NULL,
    discovery_year integer,
    absolute_magnitude numeric(50,2),
    description text,
    naked_eye_obs boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(99) NOT NULL,
    absolute_magnitude numeric(50,2),
    description text,
    naked_eye_obs boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1, 1);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2, 1);
INSERT INTO public.comet VALUES (3, 'Swift-Tuttle', 3, 1);
INSERT INTO public.comet VALUES (4, 'Encke', 4, 1);
INSERT INTO public.comet VALUES (5, 'Neowise', 5, 1);
INSERT INTO public.comet VALUES (6, 'Lovejoy', 6, 1);
INSERT INTO public.comet VALUES (7, 'McNaught', 7, 1);
INSERT INTO public.comet VALUES (8, 'ISON', 1, 1);
INSERT INTO public.comet VALUES (9, 'Lulin', 4, 1);
INSERT INTO public.comet VALUES (10, 'Biela', 2, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -20.90, 'A nossa galáxia, composta por centenas de bilhões de estrelas, incluindo o Sol.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', -21.00, 'A galáxia mais próxima da Via Láctea, também conhecida como M31, com uma grande população de estrelas.', true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', -19.70, 'Uma das galáxias mais próximas à Via Láctea e à Andromeda, também conhecida como M33.', false);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', -22.20, 'Uma galáxia elíptica massiva localizada no centro do aglomerado de Virgem, conhecida por abrigar um buraco negro supermassivo.', false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', -22.40, 'Uma galáxia espiral com um brilho intenso, conhecida por sua forma de "chapéu".', false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', -21.50, 'Uma galáxia espiral interagindo com uma galáxia menor, conhecida por seu formato em espiral e uma grande quantidade de estrelas jovens.', true);
INSERT INTO public.galaxy VALUES (7, 'Cigar', -22.60, 'Uma galáxia espiral com um núcleo ativo brilhante, conhecida por sua forma característica em “cigarro” devido a sua aparência.', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Io', 1610, -0.02, 'A lua mais massiva de Júpiter, conhecida por sua atividade vulcânica extrema.', true, 1);
INSERT INTO public.moon VALUES (2, 'Europa', 1610, -0.05, 'Lua de Júpiter coberta por uma crosta de gelo, com um oceano subterrâneo que pode abrigar vida.', true, 1);
INSERT INTO public.moon VALUES (3, 'Ganimedes', 1610, -0.04, 'A maior lua do sistema solar, maior que o planeta Mercúrio.', true, 1);
INSERT INTO public.moon VALUES (4, 'Calisto', 1610, -0.03, 'Lua de Júpiter coberta por crateras, com uma superfície bastante antiga e geologicamente estável.', true, 1);
INSERT INTO public.moon VALUES (5, 'Titan', 1655, -0.01, 'Lua de Saturno com uma atmosfera densa composta principalmente por nitrogênio e metano.', true, 2);
INSERT INTO public.moon VALUES (6, 'Rhea', 1672, -0.05, 'Lua de Saturno com anéis finos e uma superfície composta por gelo e rochas.', true, 2);
INSERT INTO public.moon VALUES (7, 'Iapetus', 1671, -0.04, 'Lua de Saturno conhecida por sua aparência bicolor e uma grande crista que a percorre.', false, 2);
INSERT INTO public.moon VALUES (8, 'Enceladus', 1789, -0.06, 'Lua de Saturno que tem plumas de água e partículas orgânicas em sua superfície.', true, 2);
INSERT INTO public.moon VALUES (9, 'Mimas', 1789, -0.07, 'Lua de Saturno conhecida por seu grande impacto que criou a cratera Herschel, com aparência de "Death Star".', true, 2);
INSERT INTO public.moon VALUES (10, 'Ariel', 1851, -0.04, 'Lua de Urano com uma superfície geologicamente ativa e muitas falhas e crateras.', true, 3);
INSERT INTO public.moon VALUES (11, 'Umbriel', 1851, -0.06, 'Lua de Urano com uma superfície escura e crateras antigas.', false, 3);
INSERT INTO public.moon VALUES (12, 'Titania', 1787, -0.02, 'Lua de Urano com uma superfície variada e presença de grandes falhas.', true, 3);
INSERT INTO public.moon VALUES (13, 'Oberon', 1787, -0.03, 'Lua de Urano com uma superfície marcada por crateras e grandes falhas.', true, 3);
INSERT INTO public.moon VALUES (14, 'Miranda', 1948, -0.05, 'Lua de Urano com uma superfície altamente fragmentada e uma aparência única de falhas.', true, 3);
INSERT INTO public.moon VALUES (15, 'Phobos', 1877, -0.01, 'Lua de Marte, conhecida por sua forma irregular e seu movimento em direção ao planeta.', true, 4);
INSERT INTO public.moon VALUES (16, 'Deimos', 1877, -0.03, 'Lua menor de Marte, com uma órbita mais distante e irregular.', true, 4);
INSERT INTO public.moon VALUES (17, 'Ganymede', 1610, -0.02, 'A maior lua do sistema solar, possuindo seu próprio campo magnético.', true, 5);
INSERT INTO public.moon VALUES (18, 'Tritão', 1846, -0.01, 'Lua de Netuno que possui uma órbita retrógrada e é um dos poucos corpos no sistema solar com atividades geológicas.', true, 6);
INSERT INTO public.moon VALUES (19, 'Nereida', 1989, -0.04, 'Lua de Netuno com uma órbita altamente excêntrica e distante.', false, 6);
INSERT INTO public.moon VALUES (20, 'Charon', 1978, -0.02, 'Lua de Plutão, conhecida por sua grande relação de tamanho com o planeta e um conjunto de crateras e vales.', true, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercúrio', -1000, 0.20, 'O planeta mais próximo do Sol, conhecido por sua superfície rochosa e temperaturas extremas.', true, 1);
INSERT INTO public.planet VALUES (2, 'Vênus', -1000, -4.40, 'O segundo planeta do sistema solar, com uma atmosfera densa composta principalmente de dióxido de carbono, conhecido por seu brilho intenso.', true, 1);
INSERT INTO public.planet VALUES (3, 'Terra', -1000, -3.99, 'Nosso planeta, o único conhecido a abrigar vida. Possui uma atmosfera rica em oxigênio e água líquida.', true, 1);
INSERT INTO public.planet VALUES (4, 'Marte', -1000, -1.52, 'Conhecido como o planeta vermelho, Marte tem uma superfície coberta por ferrugem, com uma atmosfera fina e clima frio.', true, 1);
INSERT INTO public.planet VALUES (5, 'Júpiter', -1000, -9.40, 'O maior planeta do sistema solar, um gigante gasoso com uma enorme atmosfera de hidrogênio e hélio, conhecido por sua Grande Mancha Vermelha.', true, 1);
INSERT INTO public.planet VALUES (6, 'Saturno', -1000, -8.88, 'Famoso por seus impressionantes anéis, Saturno é um gigante gasoso composto principalmente de hidrogênio e hélio.', true, 1);
INSERT INTO public.planet VALUES (7, 'Urano', -1000, -7.19, 'Urano é um gigante gasoso que gira de lado em relação ao plano orbital dos outros planetas, com anéis e uma atmosfera de hidrogênio e metano.', false, 1);
INSERT INTO public.planet VALUES (8, 'Netuno', -1000, -7.78, 'Netuno é um planeta gasoso com ventos extremamente rápidos e uma atmosfera composta principalmente de hidrogênio, hélio e metano.', false, 1);
INSERT INTO public.planet VALUES (9, 'Plutão', 1930, 13.65, 'Plutão, classificado como planeta anão, foi descoberto em 1930. Ele possui uma órbita excêntrica e é composto principalmente por rochas e gelo.', false, 1);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 2011, -1.50, 'Exoplaneta localizado na zona habitável de sua estrela, com um clima semelhante ao da Terra, descoberta pelo telescópio Kepler.', true, 2);
INSERT INTO public.planet VALUES (11, 'Proxima b', 2016, -0.80, 'Exoplaneta orbitando Proxima Centauri, a estrela mais próxima do sistema solar, localizado na zona habitável.', true, 7);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 1999, -0.30, 'Exoplaneta conhecido por seu trânsito à frente da sua estrela, sendo um dos primeiros planetas para os quais foram detectados efeitos atmosféricos.', true, 3);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1d', 2017, -1.10, 'Exoplaneta no sistema TRAPPIST-1, com um possível oceano subterrâneo e condições para abrigar vida.', true, 1);
INSERT INTO public.planet VALUES (14, 'LHS 1140 b', 2017, -0.40, 'Exoplaneta localizado em torno de uma estrela anã vermelha, considerado um dos melhores candidatos para estudar atmosferas de exoplanetas.', true, 7);
INSERT INTO public.planet VALUES (15, 'K2-18 b', 2015, -0.90, 'Exoplaneta encontrado na zona habitável de sua estrela, possuindo grandes chances de ter água em estado líquido em sua superfície.', true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 4.83, 'A estrela central do sistema solar, responsável pela fonte primária de luz e energia para a Terra e outros planetas.', true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', -1.46, 'A estrela mais brilhante no céu noturno, localizada na constelação de Cão Maior. É uma estrela binária composta por Sirius A e Sirius B.', true, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', -0.27, 'O sistema estelar mais próximo da Terra, composto por três estrelas: Alpha Centauri A, Alpha Centauri B, e Proxima Centauri.', true, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', -5.14, 'Uma supergigante vermelha na constelação de Orion, uma das maiores e mais luminosas estrelas conhecidas.', true, 1);
INSERT INTO public.star VALUES (5, 'Rigel', -6.87, 'Uma supergigante azul na constelação de Orion, uma das estrelas mais brilhantes do céu.', true, 1);
INSERT INTO public.star VALUES (6, 'Polaris', -3.64, 'A estrela do norte, que indica a direção do Polo Norte celeste, é uma supergigante amarela na constelação de Ursa Menor.', true, 1);
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 15.50, 'A estrela mais próxima do sistema solar, uma anã vermelha que faz parte do sistema Alpha Centauri, mas é muito fraca para ser vista a olho nu.', false, 1);
INSERT INTO public.star VALUES (8, 'Antares', -5.53, 'Uma supergigante vermelha na constelação de Escorpião, uma das maiores estrelas visíveis a olho nu.', true, 1);
INSERT INTO public.star VALUES (9, 'Arcturus', -0.30, 'Uma das estrelas mais brilhantes do céu noturno, localizada na constelação de Boötes. É uma gigante vermelha.', true, 1);
INSERT INTO public.star VALUES (10, 'Aldebaran', -0.50, 'Uma gigante vermelha localizada na constelação de Touro, uma das estrelas mais brilhantes do céu noturno.', true, 1);
INSERT INTO public.star VALUES (11, 'Canopus', -5.53, 'A segunda estrela mais brilhante no céu noturno, uma supergigante branca na constelação de Carina.', true, 2);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 10, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 15, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 11, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet unique_comet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT unique_comet_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: comet fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: comet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

