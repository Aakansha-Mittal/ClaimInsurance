--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-25 11:39:33

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
-- TOC entry 222 (class 1259 OID 16694)
-- Name: claims; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.claims (
    claimid integer NOT NULL,
    policyid integer,
    claimdate date,
    claimamount numeric(10,2),
    claimdescription text,
    claimstatus character varying(50)
);


ALTER TABLE public.claims OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16693)
-- Name: claims_claimid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.claims_claimid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.claims_claimid_seq OWNER TO postgres;

--
-- TOC entry 4876 (class 0 OID 0)
-- Dependencies: 221
-- Name: claims_claimid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.claims_claimid_seq OWNED BY public.claims.claimid;


--
-- TOC entry 216 (class 1259 OID 16661)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customerid integer NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    dateofbirth date,
    gender character(1),
    address character varying(100),
    city character varying(50),
    state character varying(50),
    zipcode character varying(10)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16660)
-- Name: customers_customerid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customerid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customerid_seq OWNER TO postgres;

--
-- TOC entry 4877 (class 0 OID 0)
-- Dependencies: 215
-- Name: customers_customerid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customerid_seq OWNED BY public.customers.customerid;


--
-- TOC entry 220 (class 1259 OID 16677)
-- Name: policies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.policies (
    policyid integer NOT NULL,
    customerid integer,
    policytypeid integer,
    policystartdate date,
    policyenddate date,
    premium numeric(10,2)
);


ALTER TABLE public.policies OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16676)
-- Name: policies_policyid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.policies_policyid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.policies_policyid_seq OWNER TO postgres;

--
-- TOC entry 4879 (class 0 OID 0)
-- Dependencies: 219
-- Name: policies_policyid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.policies_policyid_seq OWNED BY public.policies.policyid;


--
-- TOC entry 218 (class 1259 OID 16668)
-- Name: policytypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.policytypes (
    policytypeid integer NOT NULL,
    policytypename character varying(50),
    description text
);


ALTER TABLE public.policytypes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16667)
-- Name: policytypes_policytypeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.policytypes_policytypeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.policytypes_policytypeid_seq OWNER TO postgres;

--
-- TOC entry 4881 (class 0 OID 0)
-- Dependencies: 217
-- Name: policytypes_policytypeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.policytypes_policytypeid_seq OWNED BY public.policytypes.policytypeid;


--
-- TOC entry 4706 (class 2604 OID 16697)
-- Name: claims claimid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claims ALTER COLUMN claimid SET DEFAULT nextval('public.claims_claimid_seq'::regclass);


--
-- TOC entry 4703 (class 2604 OID 16664)
-- Name: customers customerid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customerid SET DEFAULT nextval('public.customers_customerid_seq'::regclass);


--
-- TOC entry 4705 (class 2604 OID 16680)
-- Name: policies policyid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policies ALTER COLUMN policyid SET DEFAULT nextval('public.policies_policyid_seq'::regclass);


--
-- TOC entry 4704 (class 2604 OID 16671)
-- Name: policytypes policytypeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policytypes ALTER COLUMN policytypeid SET DEFAULT nextval('public.policytypes_policytypeid_seq'::regclass);


--
-- TOC entry 4869 (class 0 OID 16694)
-- Dependencies: 222
-- Data for Name: claims; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.claims (claimid, policyid, claimdate, claimamount, claimdescription, claimstatus) FROM stdin;
1	1	2021-06-15	500.00	Car accident	Approved
2	2	2021-07-20	1000.00	House fire	Pending
3	3	2021-08-05	20000.00	Life insurance claim	Approved
4	4	2021-09-10	150.00	Doctor visit	Denied
5	5	2021-10-22	300.00	Car theft	Approved
\.


--
-- TOC entry 4863 (class 0 OID 16661)
-- Dependencies: 216
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customerid, firstname, lastname, dateofbirth, gender, address, city, state, zipcode) FROM stdin;
1	John	Doe	1980-04-12	M	123 Elm St	Springfield	IL	62704
2	Jane	Smith	1975-09-23	F	456 Maple Ave	Greenville	TX	75402
3	Emily	Johnson	1990-01-17	F	789 Oak Dr	Phoenix	AZ	85001
4	Michael	Brown	1985-07-30	M	321 Pine St	Riverside	CA	92501
\.


--
-- TOC entry 4867 (class 0 OID 16677)
-- Dependencies: 220
-- Data for Name: policies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.policies (policyid, customerid, policytypeid, policystartdate, policyenddate, premium) FROM stdin;
1	1	1	2021-01-01	2022-01-01	120.00
2	2	2	2021-02-01	2022-02-01	150.00
3	1	3	2021-03-01	2024-03-01	300.00
4	3	4	2021-04-01	2022-04-01	200.00
5	4	1	2021-05-01	2022-05-01	100.00
\.


--
-- TOC entry 4865 (class 0 OID 16668)
-- Dependencies: 218
-- Data for Name: policytypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.policytypes (policytypeid, policytypename, description) FROM stdin;
1	Auto	Insurance coverage for automobiles
2	Home	Insurance coverage for residential homes
3	Life	Long-term insurance coverage upon the policyholder's death
4	Health	Insurance coverage for medical and surgical expenses
\.


--
-- TOC entry 4882 (class 0 OID 0)
-- Dependencies: 221
-- Name: claims_claimid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.claims_claimid_seq', 5, true);


--
-- TOC entry 4883 (class 0 OID 0)
-- Dependencies: 215
-- Name: customers_customerid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customerid_seq', 4, true);


--
-- TOC entry 4884 (class 0 OID 0)
-- Dependencies: 219
-- Name: policies_policyid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.policies_policyid_seq', 5, true);


--
-- TOC entry 4885 (class 0 OID 0)
-- Dependencies: 217
-- Name: policytypes_policytypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.policytypes_policytypeid_seq', 4, true);


--
-- TOC entry 4714 (class 2606 OID 16701)
-- Name: claims claims_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claims
    ADD CONSTRAINT claims_pkey PRIMARY KEY (claimid);


--
-- TOC entry 4708 (class 2606 OID 16666)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);


--
-- TOC entry 4712 (class 2606 OID 16682)
-- Name: policies policies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policies
    ADD CONSTRAINT policies_pkey PRIMARY KEY (policyid);


--
-- TOC entry 4710 (class 2606 OID 16675)
-- Name: policytypes policytypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policytypes
    ADD CONSTRAINT policytypes_pkey PRIMARY KEY (policytypeid);


--
-- TOC entry 4715 (class 1259 OID 16707)
-- Name: idx_claims_claimdate; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_claims_claimdate ON public.claims USING btree (claimdate);


--
-- TOC entry 4718 (class 2606 OID 16702)
-- Name: claims claims_policyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.claims
    ADD CONSTRAINT claims_policyid_fkey FOREIGN KEY (policyid) REFERENCES public.policies(policyid);


--
-- TOC entry 4716 (class 2606 OID 16683)
-- Name: policies policies_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policies
    ADD CONSTRAINT policies_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(customerid);


--
-- TOC entry 4717 (class 2606 OID 16688)
-- Name: policies policies_policytypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policies
    ADD CONSTRAINT policies_policytypeid_fkey FOREIGN KEY (policytypeid) REFERENCES public.policytypes(policytypeid);


--
-- TOC entry 4875 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE claims; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.claims TO claimsanalyst;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.claims TO claimsmanager;


--
-- TOC entry 4878 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE policies; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.policies TO claimsanalyst;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.policies TO claimsmanager;


--
-- TOC entry 4880 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE policytypes; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.policytypes TO claimsanalyst;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.policytypes TO claimsmanager;


-- Completed on 2024-06-25 11:39:34

--
-- PostgreSQL database dump complete
--

