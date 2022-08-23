--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(40) NOT NULL,
    galaxy_description text,
    galaxy_date_discovered date NOT NULL,
    galaxy_length_lightyear numeric(7,1) NOT NULL
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
    name character varying(40) NOT NULL,
    moon_volume text NOT NULL,
    planet_id integer,
    moon_date_discovered date
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_it_cool boolean NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_volume text,
    planet_has_moons boolean,
    planet_has_life boolean,
    star_id integer,
    planet_date_discovered date,
    number_of_moons integer
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
    name character varying(40) NOT NULL,
    galaxy_id integer,
    star_date_discovered date NOT NULL,
    star_color character varying(20),
    number_of_moons integer
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
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Home sweet home', '0680-01-01', 26000.0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Super close galaxy', '1750-01-01', 220000.0);
INSERT INTO public.galaxy VALUES (3, 'Cigar', 'Shaped like a cigar', '1912-01-01', 37000.0);
INSERT INTO public.galaxy VALUES (4, 'Pinwheel', 'Shaped like a toy', '1945-01-01', 107000.0);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Adorn this on your head', '1980-05-05', 50000.0);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Take a dip', '1999-09-09', 60000.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', '2.1958x10^10 km', 3, '0001-01-01');
INSERT INTO public.moon VALUES (2, 'Mars Moon 1', 'Unknown', 4, '1500-01-01');
INSERT INTO public.moon VALUES (3, 'Mars Moon 2', 'Unknown', 4, '1500-01-01');
INSERT INTO public.moon VALUES (4, 'Jupiter Moon 1', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (5, 'Jupiter Moon 2', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (6, 'Jupiter Moon 3', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (7, 'Jupiter Moon 4', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (8, 'Jupiter Moon 5', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (9, 'Jupiter Moon 6', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (10, 'Jupiter Moon 7', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (11, 'Jupiter Moon 8', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (12, 'Jupiter Moon 9', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (13, 'Jupiter Moon 10', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (14, 'Jupiter Moon 11', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (15, 'Jupiter Moon 12', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (16, 'Jupiter Moon 13', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (17, 'Jupiter Moon 14', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (18, 'Jupiter Moon 15', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (19, 'Io', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (20, 'Titan', 'Unknown', 5, '1800-01-01');
INSERT INTO public.moon VALUES (21, 'Europa', 'Unknown', 5, '1800-01-01');


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Orion Nebula', true, 1);
INSERT INTO public.nebula VALUES (2, 'Eagle Nebula', true, 1);
INSERT INTO public.nebula VALUES (3, 'Omega Nebula', true, 1);
INSERT INTO public.nebula VALUES (4, 'Pillars of Creation', true, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', '6.083x10^10 km', false, false, 3, '0400-01-01', NULL);
INSERT INTO public.planet VALUES (2, 'Venus', '9.2843x10^11 km', false, false, 4, '1200-01-01', NULL);
INSERT INTO public.planet VALUES (3, 'Earth', '1.083x10^12 km', true, true, 5, '0001-01-01', 1);
INSERT INTO public.planet VALUES (4, 'Mars', '1.631x10^11 km', true, true, 6, '0500-01-01', 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', '1.4313x10^15 km', true, false, 7, '0300-01-01', 80);
INSERT INTO public.planet VALUES (6, 'Saturn', '8.2713x10^14 km', true, false, 8, '0550-01-01', 83);
INSERT INTO public.planet VALUES (7, 'Uranus', '6.833x10^13 km', true, false, 9, '0900-01-01', 27);
INSERT INTO public.planet VALUES (8, 'Neptune', '6.253x10^13 km', true, false, 10, '1000-01-01', 14);
INSERT INTO public.planet VALUES (9, 'Centauri A', 'Unknown', true, false, 11, '2016-01-01', 0);
INSERT INTO public.planet VALUES (10, 'Centauri B', 'Unknown', true, false, 12, '2016-01-01', 0);
INSERT INTO public.planet VALUES (11, 'Centauri C', 'Unknown', true, false, 13, '2016-01-01', 0);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 'Unknown', true, false, 14, '2016-01-01', 0);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri c', 'Unknown', true, false, 15, '2016-01-01', 0);
INSERT INTO public.planet VALUES (14, 'Proxima Centauri d', 'Unknown', true, false, 16, '2016-01-01', 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, '0200-01-01', 'Orange', NULL);
INSERT INTO public.star VALUES (3, 'Mercury', 1, '0400-01-01', 'Grey', NULL);
INSERT INTO public.star VALUES (4, 'Venus', 1, '0700-02-02', 'White', NULL);
INSERT INTO public.star VALUES (5, 'Earth', 1, '0001-01-01', 'Blue', 1);
INSERT INTO public.star VALUES (6, 'Mars', 1, '0250-01-01', 'Red', 2);
INSERT INTO public.star VALUES (7, 'Jupiter', 1, '0400-01-01', 'Multi Colored', 80);
INSERT INTO public.star VALUES (8, 'Saturn', 1, '0800-01-01', 'Blue', 83);
INSERT INTO public.star VALUES (9, 'Uranus', 1, '1200-01-01', 'Icy Blue', 27);
INSERT INTO public.star VALUES (10, 'Neptune', 1, '1400-01-01', 'Bluest', 14);
INSERT INTO public.star VALUES (11, 'Centauri A', 1, '2016-01-01', 'Blue', 0);
INSERT INTO public.star VALUES (12, 'Centauri B', 1, '2016-01-01', 'Blue', 0);
INSERT INTO public.star VALUES (13, 'Centauri C', 1, '2016-01-01', 'Blue', 0);
INSERT INTO public.star VALUES (14, 'Proxima Centauri b', 1, '2016-01-01', 'Blue', 0);
INSERT INTO public.star VALUES (15, 'Proxima Centauri c', 1, '2016-01-01', 'Blue', 0);
INSERT INTO public.star VALUES (16, 'Proxima Centauri d', 1, '2016-01-01', 'Blue', 0);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 34, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 16, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nebula nebula_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_name_key UNIQUE (name);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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
