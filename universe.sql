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
    name character varying(30) NOT NULL,
    galaxy_types character varying(20),
    distance_from_earth integer,
    constellation character varying(20)
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
    name character varying(30),
    planet_id integer NOT NULL,
    radius_in_km numeric(5,1),
    orbital_period numeric(7,3)
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
-- Name: observatory; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observatory (
    observatory_id integer NOT NULL,
    name character varying(30) NOT NULL,
    on_earth boolean,
    country character varying(20)
);


ALTER TABLE public.observatory OWNER TO freecodecamp;

--
-- Name: observatory_observatory_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observatory_observatory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observatory_observatory_id_seq OWNER TO freecodecamp;

--
-- Name: observatory_observatory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observatory_observatory_id_seq OWNED BY public.observatory.observatory_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    star_id integer NOT NULL,
    discovered text,
    has_life boolean
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
    galaxy_id integer NOT NULL,
    name character varying(30),
    mass_in_solar_mass numeric(8,3),
    temperature_in_celsius integer
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
-- Name: observatory observatory_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatory ALTER COLUMN observatory_id SET DEFAULT nextval('public.observatory_observatory_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'barred spiral', 2500000, 'Andromeda');
INSERT INTO public.galaxy VALUES (2, 'Antennae', 'tow spiral', 45000000, 'Corvus');
INSERT INTO public.galaxy VALUES (3, 'Blackward', 'spiral', 200000000, 'Centaurus');
INSERT INTO public.galaxy VALUES (4, 'Black Eye', 'spiral', 17300000, 'Coma Berenices');
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 'spiral', 12000000, 'Ursa Major');
INSERT INTO public.galaxy VALUES (6, 'Milky Way', 'spiral', 25881, 'Sagittarius');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 11, 1738.1, 27.300);
INSERT INTO public.moon VALUES (2, 'Phobos', 12, 11.2, 0.318);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 6.2, 1.263);
INSERT INTO public.moon VALUES (4, 'Ganymede', 13, 2634.1, 7.154);
INSERT INTO public.moon VALUES (5, 'Callisto', 13, 4820.3, 16.689);
INSERT INTO public.moon VALUES (6, 'Europe', 13, 3121.6, 3.551);
INSERT INTO public.moon VALUES (7, 'Io', 13, 3643.2, 1.769);
INSERT INTO public.moon VALUES (8, 'Amalthee', 13, 167.0, 0.498);
INSERT INTO public.moon VALUES (9, 'Himalia', 13, 170.0, 0.324);
INSERT INTO public.moon VALUES (10, 'Thebe', 13, 116.0, 0.674);
INSERT INTO public.moon VALUES (11, 'Sinope', 13, 38.0, 729.800);
INSERT INTO public.moon VALUES (12, 'Pasiphae', 13, 60.0, 755.420);
INSERT INTO public.moon VALUES (13, 'Carme', 13, 46.0, 764.190);
INSERT INTO public.moon VALUES (14, 'Ananke', 13, 28.0, 596.960);
INSERT INTO public.moon VALUES (15, 'Elara', 13, 86.0, 257.770);
INSERT INTO public.moon VALUES (16, 'Lysithee', 13, 36.0, 257.400);
INSERT INTO public.moon VALUES (17, 'Leda', 13, 20.0, 238.860);
INSERT INTO public.moon VALUES (18, 'Andrastee', 13, 20.0, 0.298);
INSERT INTO public.moon VALUES (19, 'Metis', 13, 60.0, 0.294);
INSERT INTO public.moon VALUES (20, 'Titan', 14, 5151.0, 15.950);


--
-- Data for Name: observatory; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observatory VALUES (1, 'Nautilus', false, 'USA');
INSERT INTO public.observatory VALUES (2, 'Granat', false, 'France');
INSERT INTO public.observatory VALUES (3, 'IAO', true, 'Indian');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, '55 Cancri b', 3, '1996 Gas Giant', false);
INSERT INTO public.planet VALUES (2, '55 Cancri c', 3, '2004 Gas Giant', false);
INSERT INTO public.planet VALUES (3, '55 Cancri d', 3, '2002 Gas Giant', false);
INSERT INTO public.planet VALUES (4, '55 Cancri e', 3, '2004 Super Earth', false);
INSERT INTO public.planet VALUES (5, '55 Cancri f', 3, '2007 Gas Giant', false);
INSERT INTO public.planet VALUES (6, 'Kepler 90 c', 6, '2013 Super Earth', false);
INSERT INTO public.planet VALUES (7, 'Kepler 90 d', 6, '2013 Neptune=like', false);
INSERT INTO public.planet VALUES (8, 'Kepler 90 e', 6, '2013 Neptune=like', false);
INSERT INTO public.planet VALUES (9, 'Kepler 90 f', 6, '2013 Neptune=like', false);
INSERT INTO public.planet VALUES (10, 'Kepler 90 g', 6, '2013 Gas Giant', false);
INSERT INTO public.planet VALUES (11, 'Earth', 5, 'Our blue planet', true);
INSERT INTO public.planet VALUES (12, 'Mars', 5, '1610 Galilee', false);
INSERT INTO public.planet VALUES (13, 'Jupiter', 5, '1610 Galilee', false);
INSERT INTO public.planet VALUES (14, 'Sature', 5, '1610 Galilee', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Mirach', 6.000, 3027);
INSERT INTO public.star VALUES (2, 1, 'Nembus', 0.800, 4000);
INSERT INTO public.star VALUES (3, 6, '55 Cancri', 0.958, 5018);
INSERT INTO public.star VALUES (4, 6, '47 Ursae Majoris', 1.070, 5600);
INSERT INTO public.star VALUES (5, 6, 'SUN', 1.000, 5500);
INSERT INTO public.star VALUES (6, 6, 'Kepler 90', 1.200, 5800);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: observatory_observatory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observatory_observatory_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: observatory observatory_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatory
    ADD CONSTRAINT observatory_name_key UNIQUE (name);


--
-- Name: observatory observatory_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatory
    ADD CONSTRAINT observatory_pkey PRIMARY KEY (observatory_id);


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
