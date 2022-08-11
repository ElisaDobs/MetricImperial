--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_nodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_nodes (
    node_id integer NOT NULL,
    node_name character varying(50) NOT NULL
);


ALTER TABLE public.audit_nodes OWNER TO postgres;

--
-- Name: audit_nodes_node_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audit_nodes_node_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audit_nodes_node_id_seq OWNER TO postgres;

--
-- Name: audit_nodes_node_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audit_nodes_node_id_seq OWNED BY public.audit_nodes.node_id;


--
-- Name: conversion_audits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conversion_audits (
    audit_id integer NOT NULL,
    user_id uuid NOT NULL,
    audit_node_id integer NOT NULL,
    unit_from character varying(20) NOT NULL,
    unit_to character varying(20) NOT NULL,
    date_time_stamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.conversion_audits OWNER TO postgres;

--
-- Name: conversion_audits_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conversion_audits_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conversion_audits_audit_id_seq OWNER TO postgres;

--
-- Name: conversion_audits_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conversion_audits_audit_id_seq OWNED BY public.conversion_audits.audit_id;


--
-- Name: conversion_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conversion_types (
    conversion_id integer NOT NULL,
    conversion_desc character varying(50) NOT NULL
);


ALTER TABLE public.conversion_types OWNER TO postgres;

--
-- Name: unit_conversion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unit_conversion (
    unit_id integer NOT NULL,
    conversion_id integer,
    unit_name character varying(10) NOT NULL,
    unit_desc character varying(100) NOT NULL,
    unit_value numeric(10,2)
);


ALTER TABLE public.unit_conversion OWNER TO postgres;

--
-- Name: unit_conversion_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unit_conversion_unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unit_conversion_unit_id_seq OWNER TO postgres;

--
-- Name: unit_conversion_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unit_conversion_unit_id_seq OWNED BY public.unit_conversion.unit_id;


--
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.units (
    unit_id integer NOT NULL,
    unit_name character varying(10) NOT NULL,
    unit_desc character varying(100) NOT NULL,
    conversion_id integer,
    unit_value numeric(10,2) NOT NULL,
    unit_name_to character varying(10),
    unit_desc_to character varying(100)
);


ALTER TABLE public.units OWNER TO postgres;

--
-- Name: units_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.units_unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.units_unit_id_seq OWNER TO postgres;

--
-- Name: units_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.units_unit_id_seq OWNED BY public.units.unit_id;


--
-- Name: user_audits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_audits (
    audit_id integer NOT NULL,
    user_id uuid NOT NULL,
    audit_node_id integer NOT NULL,
    user_from character varying(255) NOT NULL,
    user_to character varying(255) NOT NULL,
    date_time_stamp timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.user_audits OWNER TO postgres;

--
-- Name: user_audits_audit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_audits_audit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_audits_audit_id_seq OWNER TO postgres;

--
-- Name: user_audits_audit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_audits_audit_id_seq OWNED BY public.user_audits.audit_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_name character varying(50) NOT NULL,
    user_last_name character varying(50),
    user_password character varying(50),
    date_time_stamp timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: audit_nodes node_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_nodes ALTER COLUMN node_id SET DEFAULT nextval('public.audit_nodes_node_id_seq'::regclass);


--
-- Name: conversion_audits audit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversion_audits ALTER COLUMN audit_id SET DEFAULT nextval('public.conversion_audits_audit_id_seq'::regclass);


--
-- Name: unit_conversion unit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit_conversion ALTER COLUMN unit_id SET DEFAULT nextval('public.unit_conversion_unit_id_seq'::regclass);


--
-- Name: units unit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units ALTER COLUMN unit_id SET DEFAULT nextval('public.units_unit_id_seq'::regclass);


--
-- Name: user_audits audit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_audits ALTER COLUMN audit_id SET DEFAULT nextval('public.user_audits_audit_id_seq'::regclass);


--
-- Data for Name: audit_nodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_nodes (node_id, node_name) FROM stdin;
1	create user
2	user login
3	user convert metric units to imperial units
4	user convert imperial units to metric units
\.


--
-- Data for Name: conversion_audits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conversion_audits (audit_id, user_id, audit_node_id, unit_from, unit_to, date_time_stamp) FROM stdin;
1	7a9ae46e-2f98-4556-8341-f7334691fe4c	3	5cm	2inch	-infinity
2	7a9ae46e-2f98-4556-8341-f7334691fe4c	4	55inch	137,50cm	2022-07-26 16:16:49.473693
3	3665251b-a367-4454-88a0-abfbf5bfa2e9	4	55inch	137,50cm	2022-07-26 18:52:32.465199
4	3665251b-a367-4454-88a0-abfbf5bfa2e9	3	10cm	4inch	2022-07-26 21:21:10.978998
5	47f2b709-0dae-43b5-9476-f5d05b82a0d3	3	20cm	8inch	2022-08-01 12:22:48.115182
6	757a07f0-3b8a-405b-b662-e54b466d6e4e	3	20cm	8inch	2022-08-01 12:39:16.07654
\.


--
-- Data for Name: conversion_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conversion_types (conversion_id, conversion_desc) FROM stdin;
1	Metric to Imperial Units
2	Imperial to Metric Units
\.


--
-- Data for Name: unit_conversion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unit_conversion (unit_id, conversion_id, unit_name, unit_desc, unit_value) FROM stdin;
1	1	cm	centimetre	2.50
2	1	km	kilometre	1.60
3	1	kg	kilogram	6.30
4	1	l	litres	4.50
5	1	°C	Fahrenheit(°F)	-17.22
\.


--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.units (unit_id, unit_name, unit_desc, conversion_id, unit_value, unit_name_to, unit_desc_to) FROM stdin;
2	km	kilometre	1	1.60	miles	miles
3	kg	kilogram	1	6.30	stone	stone
4	l	litres	1	4.50	gallon	gallon
5	°C	Celsius(°C)	1	-17.22	°F	Fahrenheit(°F)
7	miles	mile	2	1.60	km	kilometre
8	stone	stone	2	6.30	stone	stone
9	gallon	gallon	2	4.50	gallon	gallon
10	°F	Fahrenheit(°F)	2	-17.22	°C	Celsius(°C)
1	cm	centimetre	1	2.50	inch	inch
6	inch	inch	2	2.50	cm	centimetre
\.


--
-- Data for Name: user_audits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_audits (audit_id, user_id, audit_node_id, user_from, user_to, date_time_stamp) FROM stdin;
1	146c3b58-85f3-4d56-a6a5-19ee621bcc3e	1	username:Sbongile,lastname:Mgidi,password:Test201	userid:146c3b58-85f3-4d56-a6a5-19ee621bcc3e	2022-07-26 17:19:06.324334
2	3665251b-a367-4454-88a0-abfbf5bfa2e9	1	username:Memory,lastname:Makamu,password:Test302	user:{"UserId":"3665251b-a367-4454-88a0-abfbf5bfa2e9","UserName":"Memory","UserLastName":"Makamu","UserPassword":"Test302","DateTimeStamp":"2022-07-26T15:36:42.6392871Z"}	2022-07-26 17:37:14.250808
3	3665251b-a367-4454-88a0-abfbf5bfa2e9	2	username:Memory,password:Test302	user:{"UserId":"3665251b-a367-4454-88a0-abfbf5bfa2e9","UserName":"Memory","UserLastName":"Makamu","UserPassword":"Test302","DateTimeStamp":"2022-07-26T17:36:42.639287"}	2022-07-26 17:39:01.165448
4	3665251b-a367-4454-88a0-abfbf5bfa2e9	2	username:Memory,password:Test302	user:{"UserId":"3665251b-a367-4454-88a0-abfbf5bfa2e9","UserName":"Memory","UserLastName":"Makamu","UserPassword":"Test302","DateTimeStamp":"2022-07-26T17:36:42.639287"}	2022-07-26 17:53:26.068668
5	3665251b-a367-4454-88a0-abfbf5bfa2e9	2	username:Memory,password:Test302	user:{"UserId":"3665251b-a367-4454-88a0-abfbf5bfa2e9","UserName":"Memory","UserLastName":"Makamu","UserPassword":"Test302","DateTimeStamp":"2022-07-26T17:36:42.639287"}	2022-07-26 17:57:07.427032
6	3665251b-a367-4454-88a0-abfbf5bfa2e9	2	username:Memory,password:Test302	user:{"UserId":"3665251b-a367-4454-88a0-abfbf5bfa2e9","UserName":"Memory","UserLastName":"Makamu","UserPassword":"Test302","DateTimeStamp":"2022-07-26T17:36:42.639287"}	2022-07-26 17:59:12.588996
7	3665251b-a367-4454-88a0-abfbf5bfa2e9	2	username:Memory,password:Test302	user:{"UserId":"3665251b-a367-4454-88a0-abfbf5bfa2e9","UserName":"Memory","UserLastName":"Makamu","UserPassword":"Test302","DateTimeStamp":"2022-07-26T17:36:42.639287"}	2022-07-26 18:50:33.947526
8	3665251b-a367-4454-88a0-abfbf5bfa2e9	2	username:Memory,password:Test302	user:{"UserId":"3665251b-a367-4454-88a0-abfbf5bfa2e9","UserName":"Memory","UserLastName":"Makamu","UserPassword":"Test302","DateTimeStamp":"2022-07-26T18:50:33.947526"}	2022-07-26 21:17:52.335966
9	3665251b-a367-4454-88a0-abfbf5bfa2e9	2	username:Memory,password:***********	user:{"UserId":"3665251b-a367-4454-88a0-abfbf5bfa2e9","UserName":"Memory","UserLastName":"***********","UserPassword":"***********","DateTimeStamp":"2022-07-29T14:13:05"}	2022-07-29 16:13:26.478135
10	9ca999d1-312d-45c8-9c69-a78f6d140ffa	1	username:andile,lastname:Maswanganye,password:Test401	user:{"UserId":"9ca999d1-312d-45c8-9c69-a78f6d140ffa","UserName":"andile","UserLastName":"Maswanganye","UserPassword":"Test401","DateTimeStamp":"2022-07-31T17:46:44.2272306Z"}	2022-07-31 19:47:04.811951
11	3a8a9486-c844-4c63-84d5-58c3d3fb6610	1	username:Tsakani,lastname:Mhlanga,password:Testing123	user:{"UserId":"3a8a9486-c844-4c63-84d5-58c3d3fb6610","UserName":"Tsakani","UserLastName":"Mhlanga","UserPassword":"Testing123","DateTimeStamp":"2022-08-01T10:10:43.8033464Z"}	2022-08-01 12:10:45.808176
12	359fbdd6-d27b-4242-b71f-c4ed5be1c40b	2	username:Tsakani,password:Testing123	user:{"UserId":"359fbdd6-d27b-4242-b71f-c4ed5be1c40b","UserName":"Tsakani","UserLastName":"Mhlanga","UserPassword":"Testing123","DateTimeStamp":"2022-07-31T21:18:48.365718"}	2022-08-01 12:10:49.037355
13	47f2b709-0dae-43b5-9476-f5d05b82a0d3	1	username:Dumisani,lastname:Khosa,password:Deck02	user:{"UserId":"47f2b709-0dae-43b5-9476-f5d05b82a0d3","UserName":"Dumisani","UserLastName":"Khosa","UserPassword":"Deck02","DateTimeStamp":"2022-08-01T10:16:45.7605597Z"}	2022-08-01 12:17:02.938363
14	47f2b709-0dae-43b5-9476-f5d05b82a0d3	2	username:Dumisani,password:Deck02	user:{"UserId":"47f2b709-0dae-43b5-9476-f5d05b82a0d3","UserName":"Dumisani","UserLastName":"Khosa","UserPassword":"Deck02","DateTimeStamp":"2022-08-01T12:16:45.760559"}	2022-08-01 12:17:15.118489
15	a635e759-ad3f-460f-a865-8ce7c8bfc635	1	username:Dumisani,lastname:Khosa,password:Deck02	user:{"UserId":"a635e759-ad3f-460f-a865-8ce7c8bfc635","UserName":"Dumisani","UserLastName":"Khosa","UserPassword":"Deck02","DateTimeStamp":"2022-08-01T10:22:44.7501234Z"}	2022-08-01 12:22:45.954622
16	47f2b709-0dae-43b5-9476-f5d05b82a0d3	2	username:Dumisani,password:Deck02	user:{"UserId":"47f2b709-0dae-43b5-9476-f5d05b82a0d3","UserName":"Dumisani","UserLastName":"Khosa","UserPassword":"Deck02","DateTimeStamp":"2022-08-01T12:16:45.760559"}	2022-08-01 12:22:47.459413
17	757a07f0-3b8a-405b-b662-e54b466d6e4e	1	username:David,lastname:Zama,password:Mdeva08	user:{"UserId":"757a07f0-3b8a-405b-b662-e54b466d6e4e","UserName":"David","UserLastName":"Zama","UserPassword":"Mdeva08","DateTimeStamp":"2022-08-01T10:39:05.3740973Z"}	2022-08-01 12:39:11.004068
18	757a07f0-3b8a-405b-b662-e54b466d6e4e	2	username:David,password:Mdeva08	user:{"UserId":"757a07f0-3b8a-405b-b662-e54b466d6e4e","UserName":"David","UserLastName":"Zama","UserPassword":"Mdeva08","DateTimeStamp":"2022-08-01T12:39:05.374097"}	2022-08-01 12:39:13.412249
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, user_name, user_last_name, user_password, date_time_stamp) FROM stdin;
7a9ae46e-2f98-4556-8341-f7334691fe4c	Tsaleni	Maswanganye	Test101	\N
146c3b58-85f3-4d56-a6a5-19ee621bcc3e	Sbongile	Mgidi	Test201	2022-07-26 17:18:49.118595
3665251b-a367-4454-88a0-abfbf5bfa2e9	Memory	Makamu	Test302	2022-07-26 17:36:42.639287
a6cc80c6-7045-4e82-b3a6-1c8f735b200b	Test1	Test2	Test101	2022-07-27 16:06:53.248482
fd922849-eaa3-4f36-954e-e4a5275a6dd2	Hlayisani	Holeni	123	2022-07-27 16:15:07.518014
4b5471f0-f98d-4279-b052-e8ed7a1c71f9	Andile	Maswanganye	321	2022-07-27 16:23:42.478146
92d6c639-18a9-4962-9bc2-6de2c6c7741f	andile	Maswanganye	Test401	2022-07-29 03:19:21.453452
71a57f52-293f-4d9e-9cc9-bad46cc7fe85	andile	Maswanganye	Test401	2022-07-29 03:49:57.890023
7b82fa88-b2b8-48a6-8266-5e5146da3f8f	andile	Maswanganye	Test401	2022-07-29 03:52:38.73641
aa5f6e04-01fc-4e84-99ef-f2ebc6f50b0f	andile	Maswanganye	Test401	2022-07-29 03:54:28.255253
c1aad1ab-48e4-4cb0-921c-2ba13708a0ee	andile	Maswanganye	Test401	2022-07-29 03:55:54.199128
ec33c8bc-98a1-42b9-8c73-b93060d151e0	andile	Maswanganye	Test401	2022-07-29 15:16:57.21923
1b7adfbe-d919-471f-b4df-2daf877b7b12	andile	Maswanganye	Test401	2022-07-29 15:20:03.620764
9cdf5a28-1c92-49e8-906b-d823d764e885	andile	Maswanganye	Test401	2022-07-29 15:30:33.276173
47136c6b-9577-4aa9-af55-88b6be2795a8	andile	Maswanganye	Test401	2022-07-29 15:32:35.542184
b08468af-1684-43b3-b01b-64830944b469	andile	Maswanganye	Test401	2022-07-29 15:37:35.508351
38d8848f-ae64-411a-b685-dfd4f978117e	andile	Maswanganye	Test401	2022-07-29 15:59:44.912653
f604924b-d137-437d-8f85-6ff59d0331c8	andile	Maswanganye	Test401	2022-07-29 16:02:57.342155
fe7c1507-8399-439c-905b-2e997b802888	andile	Maswanganye	Test401	2022-07-29 16:04:05.251772
b0975fe8-2627-480a-8431-acef61c39fb9	andile	Maswanganye	Test401	2022-07-29 16:51:03.254492
1cd66e6e-4c51-4730-8be3-1ae8bef6e837	andile	Maswanganye	Test401	2022-07-30 00:43:56.974146
4deac138-4e91-4234-b4f8-8508b943ee4a	andile	Maswanganye	Test401	2022-07-30 01:05:47.060992
9d2d95f5-0875-4c53-865b-23c68e9ef0d6	andile	Maswanganye	Test401	2022-07-30 01:05:56.498926
4ad666d6-35aa-4ecf-8f1b-f2740b9599bf	andile	Maswanganye	Test401	2022-07-31 19:46:34.675546
9ca999d1-312d-45c8-9c69-a78f6d140ffa	andile	Maswanganye	Test401	2022-07-31 19:46:44.22723
4366df10-c5a0-4e75-8f4f-c705d3b421ff	andile	Maswanganye	Test401	2022-07-31 21:18:38.058319
359fbdd6-d27b-4242-b71f-c4ed5be1c40b	Tsakani	Mhlanga	Testing123	2022-07-31 21:18:48.365718
dd08ad4a-ea6d-4a37-8a66-b0259de5f433	andile	Maswanganye	Test401	2022-08-01 12:10:40.798458
3a8a9486-c844-4c63-84d5-58c3d3fb6610	Tsakani	Mhlanga	Testing123	2022-08-01 12:10:43.803346
42bf15d8-420c-418f-a5b4-e64e81f93b28	andile	Maswanganye	Test401	2022-08-01 12:16:04.166787
47f2b709-0dae-43b5-9476-f5d05b82a0d3	Dumisani	Khosa	Deck02	2022-08-01 12:16:45.760559
1160b32b-df65-4368-8775-b94866f8d12e	andile	Maswanganye	Test401	2022-08-01 12:22:41.513526
a635e759-ad3f-460f-a865-8ce7c8bfc635	Dumisani	Khosa	Deck02	2022-08-01 12:22:44.750123
d15df9e0-323d-4e70-b6d7-a5433ce92b3f	andile	Maswanganye	Test401	2022-08-01 12:39:01.933993
757a07f0-3b8a-405b-b662-e54b466d6e4e	David	Zama	Mdeva08	2022-08-01 12:39:05.374097
\.


--
-- Name: audit_nodes_node_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audit_nodes_node_id_seq', 4, true);


--
-- Name: conversion_audits_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conversion_audits_audit_id_seq', 6, true);


--
-- Name: unit_conversion_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unit_conversion_unit_id_seq', 5, true);


--
-- Name: units_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.units_unit_id_seq', 10, true);


--
-- Name: user_audits_audit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_audits_audit_id_seq', 18, true);


--
-- Name: audit_nodes audit_nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_nodes
    ADD CONSTRAINT audit_nodes_pkey PRIMARY KEY (node_id);


--
-- Name: conversion_types conversion_types_conversion_desc_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversion_types
    ADD CONSTRAINT conversion_types_conversion_desc_key UNIQUE (conversion_desc);


--
-- Name: conversion_types conversion_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversion_types
    ADD CONSTRAINT conversion_types_pkey PRIMARY KEY (conversion_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: conversion_audits conversion_audits_audit_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversion_audits
    ADD CONSTRAINT conversion_audits_audit_node_id_fkey FOREIGN KEY (audit_node_id) REFERENCES public.audit_nodes(node_id);


--
-- Name: conversion_audits conversion_audits_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conversion_audits
    ADD CONSTRAINT conversion_audits_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: unit_conversion unit_conversion_conversion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unit_conversion
    ADD CONSTRAINT unit_conversion_conversion_id_fkey FOREIGN KEY (conversion_id) REFERENCES public.conversion_types(conversion_id);


--
-- Name: units units_conversion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_conversion_id_fkey FOREIGN KEY (conversion_id) REFERENCES public.conversion_types(conversion_id);


--
-- Name: user_audits user_audits_audit_node_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_audits
    ADD CONSTRAINT user_audits_audit_node_id_fkey FOREIGN KEY (audit_node_id) REFERENCES public.audit_nodes(node_id);


--
-- Name: user_audits user_audits_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_audits
    ADD CONSTRAINT user_audits_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

