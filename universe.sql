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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30),
    english_name text,
    area_sq_degrees numeric(5,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    origin_name text,
    naked_eye_galaxy boolean,
    constellation_id integer NOT NULL
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
    year_of_discovery integer,
    mean_radius_km numeric(10,3),
    planet_id integer NOT NULL
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    equatorial_diameter_in_km integer,
    is_habbitable boolean,
    star_id integer NOT NULL
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
    name character varying(30),
    designation text,
    constellation_id integer NOT NULL,
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Sagittarius', 'Archer', 867.43, 1);
INSERT INTO public.constellation VALUES (2, 'Andromeda', 'Andromeda (Princess)', 722.28, 2);
INSERT INTO public.constellation VALUES (3, 'Canes Venatici', 'Hunting Dogs', 465.19, 3);
INSERT INTO public.constellation VALUES (4, 'Dorado', 'Dolphinfish', 179.17, 4);
INSERT INTO public.constellation VALUES (5, 'Triangulum', 'Triangle', 131.85, 5);
INSERT INTO public.constellation VALUES (6, 'Lynx', 'Lynx', 545.39, 6);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The appearance from Earth of the galaxy—a band of light', true, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda', true, 2);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 'From the whirlpool appearance this gravitationally disturbed galaxy exhibits', false, 3);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Named after Ferdinand Magellan', true, 4);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'Named after its location within the Triangulum constellation', true, 5);
INSERT INTO public.galaxy VALUES (6, 'UFO Galaxy', 'Named after its resemblance to a UFO', true, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1609, 1738.000, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 1877, 11.270, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1877, 6.200, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1610, 1821.600, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1610, 1560.800, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1610, 2634.000, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1610, 2410.000, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 1892, 83.500, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 1904, 69.800, 5);
INSERT INTO public.moon VALUES (10, 'Mimas', 1789, 198.200, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 1789, 252.100, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 1684, 533.100, 6);
INSERT INTO public.moon VALUES (13, 'Dione', 1684, 561.400, 6);
INSERT INTO public.moon VALUES (14, 'Rhea', 1672, 763.800, 6);
INSERT INTO public.moon VALUES (15, 'Titan', 1655, 2574.730, 6);
INSERT INTO public.moon VALUES (16, 'Hyperion', 1848, 135.000, 6);
INSERT INTO public.moon VALUES (17, 'Iapetus', 1671, 735.600, 6);
INSERT INTO public.moon VALUES (18, 'Ariel', 1851, 578.900, 7);
INSERT INTO public.moon VALUES (19, 'Umbriel', 1851, 584.700, 7);
INSERT INTO public.moon VALUES (20, 'Titania', 1787, 788.900, 7);
INSERT INTO public.moon VALUES (21, 'Oberon', 1787, 761.400, 7);
INSERT INTO public.moon VALUES (22, 'Miranda', 1948, 235.800, 7);
INSERT INTO public.moon VALUES (23, 'Bianca', 1986, 25.700, 7);
INSERT INTO public.moon VALUES (24, 'Triton', 1846, 1353.400, 7);
INSERT INTO public.moon VALUES (25, 'Nereid', 1949, 178.500, 7);
INSERT INTO public.moon VALUES (26, 'Naiad', 1989, 30.200, 7);
INSERT INTO public.moon VALUES (27, 'Vanth', 2005, 221.000, 10);
INSERT INTO public.moon VALUES (28, 'Charon', 1978, 606.000, 9);
INSERT INTO public.moon VALUES (29, 'Hiʻiaka', 2005, 160.000, 11);
INSERT INTO public.moon VALUES (30, 'Weywot', 2006, 40.500, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4879, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12102, true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12756, true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6794, true, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 142984, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 120536, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 51118, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 49532, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 2360, false, 1);
INSERT INTO public.planet VALUES (10, 'Orcus', 958, false, 1);
INSERT INTO public.planet VALUES (11, 'Haumea', 1920, false, 1);
INSERT INTO public.planet VALUES (12, 'Quaoar', 1086, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Sun', 1, 1);
INSERT INTO public.star VALUES (2, 'Absolutno', 'XO-5', 6, 6);
INSERT INTO public.star VALUES (3, 'Horna', 'HAT-P-38', 5, 5);
INSERT INTO public.star VALUES (4, 'Naledi', 'WASP-62', 4, 4);
INSERT INTO public.star VALUES (5, 'Chara', 'β Canum', 3, 3);
INSERT INTO public.star VALUES (6, 'Mirach', 'β Andromedae', 2, 2);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: star constellation_reference; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT constellation_reference FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: galaxy constellation_reference; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT constellation_reference FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: galaxy galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star galaxy_reference; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_reference FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: constellation galaxy_reference; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT galaxy_reference FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_reference; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_reference FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_reference; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_reference FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

