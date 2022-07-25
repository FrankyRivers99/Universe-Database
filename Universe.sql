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
    name character varying(50) NOT NULL,
    distance_in_light_years integer NOT NULL,
    age_in_millions_of_years integer,
    description text,
    is_a_active_galaxy boolean,
    diameter_in_parsec numeric(10,3),
    has_a_spiral_form boolean
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
    name character varying(50) NOT NULL,
    distance numeric(10,3) NOT NULL,
    age_in_millions_of_years integer,
    description text,
    has_water boolean,
    mass integer,
    has_minerals boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_water boolean,
    description text,
    age_in_millions_of_years integer,
    has_moons boolean,
    star_id integer NOT NULL,
    distance bigint
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
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    type_star character varying(25) NOT NULL,
    age_in_millions_of_years integer,
    light_color character varying(20),
    is_collapsing boolean,
    is_in_a_binary_system boolean,
    galaxy_id integer NOT NULL,
    distance_in_light_years numeric(10,3),
    effective_temperature_in_degrees_celsius integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


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
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Large magellanic clud', 50000, 1101, 'This is a dwarf galaxy that works like a satellite of the Milky Way and also is a member of the local group', false, 4292.400, true);
INSERT INTO public.galaxy VALUES (3, 'BARNARD|NGC 6822', 500000, NULL, 'This is an irregular barred galaxy in the constellation of Safittarius. It is part of the Local Group and is one og the closest to the Mily Way', false, 2146.000, false);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, 13610, 'The Milky Way is the galaxy that includes our solar sytem', false, 585000.100, true);
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 778000, 10010, 'This is the most big galaxy in the Local Group with at least 19 satellite galaxies', false, 67452.306, true);
INSERT INTO public.galaxy VALUES (6, 'Ursa minor dwarf', 68985, NULL, 'This galaxy is a dwarf spiral galaxy and was discovered for A.G Wilson also is a satellte of the Milky Way', false, NULL, true);
INSERT INTO public.galaxy VALUES (7, 'Sagittarius Dwarf Sphr', 78000, NULL, 'This is another satellite galaxy of Milky Way', false, 32615.640, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Mars', true, 'Mars is the fourth planet in the solar system and the second smallest planet', 4603, true, 1, 102000000);
INSERT INTO public.planet VALUES (4, 'Mercury', true, 'Mercury is the smallest planet in the solar system and the closest to the Sun', 4503, false, 1, 222000000);
INSERT INTO public.planet VALUES (5, 'Uranus', true, 'Uranus is the seven planet in the solar system this is a giant planet', 4503, true, 1, 430000000);
INSERT INTO public.planet VALUES (2, 'Earth', true, 'This is our beautifull planet', 4543, true, 1, 0);
INSERT INTO public.planet VALUES (7, 'Venus', false, 'This is the second planet in the solar system also is the second brightest natural object in the solar system after the moon', 4503, false, 1, 40000000);
INSERT INTO public.planet VALUES (8, 'Jupiter', true, 'Jupiter is the fifth planet from the Sun and the largest in the Solar System', 4603, true, 1, 588000000);
INSERT INTO public.planet VALUES (9, 'Saturn', true, 'Is the sixth planet form the Sun and the second largest of the solar system, it is a gas giant', 4503, true, 1, 1400000000000);
INSERT INTO public.planet VALUES (10, 'Neptune', true, 'This is the eighth planet from the Sun and the farthest know solar planet', 4503, true, 1, 4500000000000);
INSERT INTO public.planet VALUES (12, 'Kepler-1520b', false, 'This is an exoplanet whor orbits the star type K and that is doomed to disappear', 4703, false, 9, 2020);
INSERT INTO public.planet VALUES (13, 'HD 209458 b', false, 'This planet is constantly being devoured by his own star acquiring an appirence similar to a comet', NULL, false, 12, NULL);
INSERT INTO public.planet VALUES (14, 'TrES-2b', true, 'This isthe darkest planet int the cosmos that because only reflects less than 1% of the light it receives from it is star', NULL, false, 10, NULL);
INSERT INTO public.planet VALUES (15, 'Gliese 581 c', true, 'This planet is the perfect example of take things to the extreme, having a side where the temperatures are over the 3458 and in the other side temperatures below zero ', NULL, false, 11, NULL);
INSERT INTO public.planet VALUES (16, 'PSR B1620-26 b', true, 'This is the more older planet in our Galaxy with more of 12425 millions of years', NULL, true, 13, NULL);
INSERT INTO public.planet VALUES (17, '55 Cancri e', true, 'This planet is very eccentric due to the fact that a third part of it is made up of diamond that gives you a cost of 27 quintillion dollars ', NULL, false, 13, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Soon', 'This is the star that give light to the earth and aport the most cuantite of radiation for the earth', 'G2V', 4603, 'Yellow', false, false, 1, 0.001, 5505);
INSERT INTO public.star VALUES (3, 'Rigil Kentaurus', 'This is the principal member of the binary system, it is a solar like main sequence star with a similar yellow color', 'G2V', 4700, 'Yellow', false, true, 1, 4.344, 5800);
INSERT INTO public.star VALUES (4, 'Barnard Star', 'Is a red dwarf with a large age in the constellation of Ophiuchus', 'M4.0Ve', 9000, 'Red', false, false, 1, 5.962, 3134);
INSERT INTO public.star VALUES (5, 'CN Leonis', 'This star is a red dwarf located in the constellation Leo, near the ecliptic', 'M6.0V', 225, 'Red', false, false, 1, 7.855, 3500);
INSERT INTO public.star VALUES (6, 'Sirius A', 'This star was formed during the collapsing of a molecular cloud', 'A1V', 230, NULL, false, true, 1, 8.582, 9900);
INSERT INTO public.star VALUES (8, 'Epsilon Eridani', 'This is a star in the southern constellation of Eridanius', 'K2V', 100, NULL, false, false, 1, 10.522, 5100);
INSERT INTO public.star VALUES (9, 'Kepler 1520', 'This is a orange star og spectral class', 'K4V', 4470, 'Orange-Yellow', false, false, 1, 2074.400, 4677);
INSERT INTO public.star VALUES (10, 'TrES-2 A', 'This star is simillar to our Sun but is in the constellation of Draco', 'G0V', NULL, 'Orange-Yellow', false, true, 2, 704.000, 5850);
INSERT INTO public.star VALUES (11, 'Gliese 581', 'This is a read dwarf who also is in the list of the one hundred stars more close to the earth', ' M3V', NULL, 'Red-Orange', false, false, 2, 20.500, 3480);
INSERT INTO public.star VALUES (12, 'HD 209458', 'This is an 8th magnitude star in the constellation of Pegasus', 'G0V', NULL, 'Yellow-Orange', false, false, 2, 159.500, 6071);
INSERT INTO public.star VALUES (13, 'PSR B1620-26', 'This is star in a binary system in the constellation of Scorpius', 'Unknown', NULL, NULL, false, true, 2, 44500.000, NULL);
INSERT INTO public.star VALUES (14, 'rho01 Cnc c', 'This is a unknown star in the constellation of Cancer', 'Unknown', NULL, NULL, false, false, 2, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 17, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 1, false);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 14, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


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

