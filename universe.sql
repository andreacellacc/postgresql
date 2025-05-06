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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_million_years integer,
    distance_from_earth numeric(4,1)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_million_years integer,
    distance_from_earth numeric(4,1),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    object_id integer NOT NULL,
    planet_type character varying(30),
    name character varying(20)
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_million_years integer,
    distance_from_earth numeric(4,1),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_million_years integer,
    distance_from_earth numeric(4,1),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy1', 'lorem ipsum', true, true, 450, 54.3);
INSERT INTO public.galaxy VALUES (2, 'galaxy2', 'lorem ipsum', true, true, 450, 54.3);
INSERT INTO public.galaxy VALUES (3, 'galaxy3', 'lorem ipsum', true, true, 450, 54.3);
INSERT INTO public.galaxy VALUES (4, 'galaxy4', 'lorem ipsum', true, true, 450, 54.3);
INSERT INTO public.galaxy VALUES (5, 'galaxy5', 'lorem ipsum', true, true, 450, 54.3);
INSERT INTO public.galaxy VALUES (6, 'galaxy6', 'lorem ipsum', true, true, 450, 54.3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (22, 'moon1', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (23, 'moon2', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (24, 'moon3', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (25, 'moon4', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (26, 'moon5', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (27, 'moon6', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (28, 'moon7', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (29, 'moon8', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (30, 'moon9', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (31, 'moon10', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (32, 'moon11', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (33, 'moon12', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (34, 'moon13', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (35, 'moon14', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (36, 'moon15', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (37, 'moon16', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (38, 'moon17', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (39, 'moon18', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (40, 'moon19', 'lorem ipsum', true, true, 450, 54.3, 9);
INSERT INTO public.moon VALUES (41, 'moon20', 'lorem ipsum', true, true, 450, 54.3, 9);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 1, 'Fals', 'hexs');
INSERT INTO public.more_info VALUES (2, 2, 'Hals', 'xec');
INSERT INTO public.more_info VALUES (3, 3, 'bubu', 'amore');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'planet1', 'lorem ipsum', true, true, 450, 54.3, 1);
INSERT INTO public.planet VALUES (10, 'planet2', 'lorem ipsum', true, true, 450, 54.3, 1);
INSERT INTO public.planet VALUES (11, 'planet3', 'lorem ipsum', true, true, 450, 54.3, 1);
INSERT INTO public.planet VALUES (12, 'planet4', 'lorem ipsum', true, true, 450, 54.3, 1);
INSERT INTO public.planet VALUES (13, 'planet5', 'lorem ipsum', true, true, 450, 54.3, 1);
INSERT INTO public.planet VALUES (14, 'planet6', 'lorem ipsum', true, true, 450, 54.3, 1);
INSERT INTO public.planet VALUES (15, 'planet7', 'lorem ipsum', true, true, 450, 54.3, 1);
INSERT INTO public.planet VALUES (16, 'planet8', 'lorem ipsum', true, true, 450, 54.3, 3);
INSERT INTO public.planet VALUES (17, 'planet9', 'lorem ipsum', true, true, 450, 54.3, 5);
INSERT INTO public.planet VALUES (18, 'planet10', 'lorem ipsum', true, true, 450, 54.3, 3);
INSERT INTO public.planet VALUES (19, 'planet11', 'lorem ipsum', true, true, 450, 54.3, 4);
INSERT INTO public.planet VALUES (20, 'planet12', 'lorem ipsum', true, true, 450, 54.3, 5);
INSERT INTO public.planet VALUES (21, 'planet13', 'lorem ipsum', true, true, 450, 54.3, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star1', 'lorem ipsum', true, true, 450, 54.3, 1);
INSERT INTO public.star VALUES (2, 'star2', 'lorem ipsum', true, true, 450, 54.3, 1);
INSERT INTO public.star VALUES (3, 'star3', 'lorem ipsum', true, true, 450, 54.3, 2);
INSERT INTO public.star VALUES (4, 'star4', 'lorem ipsum', true, true, 450, 54.3, 3);
INSERT INTO public.star VALUES (5, 'star5', 'lorem ipsum', true, true, 450, 54.3, 5);
INSERT INTO public.star VALUES (6, 'star6', 'lorem ipsum', true, true, 450, 54.3, 2);
INSERT INTO public.star VALUES (7, 'star7', 'lorem ipsum', true, true, 450, 54.3, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 41, true);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

