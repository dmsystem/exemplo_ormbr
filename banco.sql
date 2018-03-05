--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

-- Started on 2018-03-02 17:25:33

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2143 (class 0 OID 0)
-- Dependencies: 2142
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- TOC entry 2 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 1 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 2146 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 187 (class 1259 OID 16526)
-- Name: atendimentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atendimentos (
    posto integer NOT NULL,
    atendimento integer NOT NULL
);


ALTER TABLE public.atendimentos OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16531)
-- Name: exames; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exames (
    posto integer NOT NULL,
    atendimento integer NOT NULL,
    correl integer NOT NULL,
    mnemonico character varying(7) NOT NULL
);


ALTER TABLE public.exames OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16520)
-- Name: procedimentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.procedimentos (
    procedimento numeric(8,0) DEFAULT 0 NOT NULL,
    nome character varying(60) NOT NULL,
    mnemonico character varying(7) NOT NULL
);


ALTER TABLE public.procedimentos OWNER TO postgres;

--
-- TOC entry 2135 (class 0 OID 16526)
-- Dependencies: 187
-- Data for Name: atendimentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.atendimentos (posto, atendimento) FROM stdin;
0	1
0	2
0	3
\.


--
-- TOC entry 2136 (class 0 OID 16531)
-- Dependencies: 188
-- Data for Name: exames; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exames (posto, atendimento, correl, mnemonico) FROM stdin;
0	1	1	GLI
0	1	2	HC
0	2	1	HC
0	2	2	COL
0	2	3	URE
0	2	4	GLI
\.


--
-- TOC entry 2134 (class 0 OID 16520)
-- Dependencies: 186
-- Data for Name: procedimentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.procedimentos (procedimento, nome, mnemonico) FROM stdin;
1	GLICEMIA	GLI
2	HEMOGRAMA	HC
3	COLESTEROL	COL
4	UREIA	URE
\.


--
-- TOC entry 2012 (class 2606 OID 16530)
-- Name: atendimentos pk_atendimentos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atendimentos
    ADD CONSTRAINT pk_atendimentos PRIMARY KEY (posto, atendimento);


--
-- TOC entry 2014 (class 2606 OID 16535)
-- Name: exames pk_exames; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exames
    ADD CONSTRAINT pk_exames PRIMARY KEY (posto, atendimento, correl);


--
-- TOC entry 2010 (class 2606 OID 16525)
-- Name: procedimentos pk_procedimentos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.procedimentos
    ADD CONSTRAINT pk_procedimentos PRIMARY KEY (mnemonico);


--
-- TOC entry 2016 (class 2606 OID 16541)
-- Name: exames exames_atendimentos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exames
    ADD CONSTRAINT exames_atendimentos_fk FOREIGN KEY (posto, atendimento) REFERENCES public.atendimentos(posto, atendimento) ON UPDATE SET NULL ON DELETE CASCADE;


--
-- TOC entry 2015 (class 2606 OID 16536)
-- Name: exames exames_procedimentos_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exames
    ADD CONSTRAINT exames_procedimentos_fk FOREIGN KEY (mnemonico) REFERENCES public.procedimentos(mnemonico) ON UPDATE SET NULL ON DELETE SET NULL;


-- Completed on 2018-03-02 17:25:34

--
-- PostgreSQL database dump complete
--

