--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: hole; Type: TYPE; Schema: public; Owner: jraspass
--

CREATE TYPE hole AS ENUM (
    '12-days-of-christmas',
    '99-bottles-of-beer',
    'arabic-to-roman',
    'brainfuck',
    'christmas-trees',
    'divisors',
    'emirp-numbers',
    'evil-numbers',
    'fibonacci',
    'fizz-buzz',
    'happy-numbers',
    'morse-decoder',
    'morse-encoder',
    'odious-numbers',
    'pangram-grep',
    'pascals-triangle',
    'pernicious-numbers',
    'prime-numbers',
    'quine',
    'roman-to-arabic',
    'seven-segment',
    'sierpiński-triangle',
    'spelling-numbers',
    'π',
    'τ',
    'φ',
    '𝑒'
);


ALTER TYPE hole OWNER TO jraspass;

--
-- Name: lang; Type: TYPE; Schema: public; Owner: jraspass
--

CREATE TYPE lang AS ENUM (
    'bash',
    'javascript',
    'lisp',
    'lua',
    'perl',
    'perl6',
    'php',
    'python',
    'ruby'
);


ALTER TYPE lang OWNER TO jraspass;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: solutions; Type: TABLE; Schema: public; Owner: jraspass
--

CREATE TABLE solutions (
    submitted timestamp without time zone NOT NULL,
    user_id integer NOT NULL,
    hole hole NOT NULL,
    lang lang NOT NULL,
    code text NOT NULL,
    failing boolean DEFAULT false NOT NULL
);


ALTER TABLE solutions OWNER TO jraspass;

--
-- Name: users; Type: TABLE; Schema: public; Owner: jraspass
--

CREATE TABLE users (
    id integer NOT NULL,
    login text NOT NULL
);


ALTER TABLE users OWNER TO jraspass;

--
-- Name: solutions solutions_pkey; Type: CONSTRAINT; Schema: public; Owner: jraspass
--

ALTER TABLE ONLY solutions
    ADD CONSTRAINT solutions_pkey PRIMARY KEY (user_id, hole, lang);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: jraspass
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: TABLE solutions; Type: ACL; Schema: public; Owner: jraspass
--

GRANT SELECT,INSERT,UPDATE ON TABLE solutions TO code_golf;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: jraspass
--

GRANT SELECT,INSERT,UPDATE ON TABLE users TO code_golf;


--
-- PostgreSQL database dump complete
--

