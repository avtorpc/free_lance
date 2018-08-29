--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

-- Started on 2018-08-29 19:39:40 MSK

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 66890)
-- Name: lancers; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA lancers;


--
-- TOC entry 2454 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA lancers; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA lancers IS 'Список фрилансеров';


SET search_path = lancers, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 66903)
-- Name: http; Type: TABLE; Schema: lancers; Owner: -
--

CREATE TABLE http (
    id integer NOT NULL,
    url character varying(512),
    link_user character varying(32)
);


--
-- TOC entry 2455 (class 0 OID 0)
-- Dependencies: 183
-- Name: TABLE http; Type: COMMENT; Schema: lancers; Owner: -
--

COMMENT ON TABLE http IS 'URL user';


--
-- TOC entry 182 (class 1259 OID 66901)
-- Name: http_id_seq; Type: SEQUENCE; Schema: lancers; Owner: -
--

CREATE SEQUENCE http_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2456 (class 0 OID 0)
-- Dependencies: 182
-- Name: http_id_seq; Type: SEQUENCE OWNED BY; Schema: lancers; Owner: -
--

ALTER SEQUENCE http_id_seq OWNED BY http.id;


--
-- TOC entry 197 (class 1259 OID 67655)
-- Name: link_user_tags; Type: TABLE; Schema: lancers; Owner: -
--

CREATE TABLE link_user_tags (
    id integer NOT NULL,
    user_hash character varying(32),
    tags_hash character varying(32)
);


--
-- TOC entry 196 (class 1259 OID 67653)
-- Name: link_user_tags_id_seq; Type: SEQUENCE; Schema: lancers; Owner: -
--

CREATE SEQUENCE link_user_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2457 (class 0 OID 0)
-- Dependencies: 196
-- Name: link_user_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: lancers; Owner: -
--

ALTER SEQUENCE link_user_tags_id_seq OWNED BY link_user_tags.id;


--
-- TOC entry 195 (class 1259 OID 67018)
-- Name: mail; Type: TABLE; Schema: lancers; Owner: -
--

CREATE TABLE mail (
    id integer NOT NULL,
    user_mail character varying(128),
    link_user character varying(32)
);


--
-- TOC entry 194 (class 1259 OID 67016)
-- Name: mail_id_seq; Type: SEQUENCE; Schema: lancers; Owner: -
--

CREATE SEQUENCE mail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2458 (class 0 OID 0)
-- Dependencies: 194
-- Name: mail_id_seq; Type: SEQUENCE OWNED BY; Schema: lancers; Owner: -
--

ALTER SEQUENCE mail_id_seq OWNED BY mail.id;


--
-- TOC entry 187 (class 1259 OID 66919)
-- Name: phone; Type: TABLE; Schema: lancers; Owner: -
--

CREATE TABLE phone (
    id integer NOT NULL,
    num_phone character varying(128),
    link_user character varying(32)
);


--
-- TOC entry 186 (class 1259 OID 66917)
-- Name: phone_id_seq; Type: SEQUENCE; Schema: lancers; Owner: -
--

CREATE SEQUENCE phone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2459 (class 0 OID 0)
-- Dependencies: 186
-- Name: phone_id_seq; Type: SEQUENCE OWNED BY; Schema: lancers; Owner: -
--

ALTER SEQUENCE phone_id_seq OWNED BY phone.id;


--
-- TOC entry 191 (class 1259 OID 66962)
-- Name: skype; Type: TABLE; Schema: lancers; Owner: -
--

CREATE TABLE skype (
    id integer NOT NULL,
    login character varying(256),
    link_user character varying(32)
);


--
-- TOC entry 190 (class 1259 OID 66960)
-- Name: skype_id_seq; Type: SEQUENCE; Schema: lancers; Owner: -
--

CREATE SEQUENCE skype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2460 (class 0 OID 0)
-- Dependencies: 190
-- Name: skype_id_seq; Type: SEQUENCE OWNED BY; Schema: lancers; Owner: -
--

ALTER SEQUENCE skype_id_seq OWNED BY skype.id;


--
-- TOC entry 189 (class 1259 OID 66945)
-- Name: tags; Type: TABLE; Schema: lancers; Owner: -
--

CREATE TABLE tags (
    id integer NOT NULL,
    tag character varying(512),
    hash character varying(32)
);


--
-- TOC entry 188 (class 1259 OID 66943)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: lancers; Owner: -
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2461 (class 0 OID 0)
-- Dependencies: 188
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: lancers; Owner: -
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- TOC entry 193 (class 1259 OID 66976)
-- Name: telegramm; Type: TABLE; Schema: lancers; Owner: -
--

CREATE TABLE telegramm (
    id integer NOT NULL,
    login character varying(256),
    link_user character varying(32)
);


--
-- TOC entry 192 (class 1259 OID 66974)
-- Name: telegramm_id_seq; Type: SEQUENCE; Schema: lancers; Owner: -
--

CREATE SEQUENCE telegramm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2462 (class 0 OID 0)
-- Dependencies: 192
-- Name: telegramm_id_seq; Type: SEQUENCE OWNED BY; Schema: lancers; Owner: -
--

ALTER SEQUENCE telegramm_id_seq OWNED BY telegramm.id;


--
-- TOC entry 185 (class 1259 OID 66911)
-- Name: users; Type: TABLE; Schema: lancers; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    hash character varying(32),
    name_user character varying(128),
    tag_rank smallint,
    page_number smallint,
    link character varying(128),
    price character varying(128),
    experience character varying(128),
    ownership character varying(128),
    payment character varying(128),
    about text,
    date_insert timestamp with time zone DEFAULT now()
);


--
-- TOC entry 184 (class 1259 OID 66909)
-- Name: users_id_seq; Type: SEQUENCE; Schema: lancers; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2463 (class 0 OID 0)
-- Dependencies: 184
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: lancers; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2293 (class 2604 OID 66906)
-- Name: id; Type: DEFAULT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY http ALTER COLUMN id SET DEFAULT nextval('http_id_seq'::regclass);


--
-- TOC entry 2301 (class 2604 OID 67658)
-- Name: id; Type: DEFAULT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY link_user_tags ALTER COLUMN id SET DEFAULT nextval('link_user_tags_id_seq'::regclass);


--
-- TOC entry 2300 (class 2604 OID 67021)
-- Name: id; Type: DEFAULT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY mail ALTER COLUMN id SET DEFAULT nextval('mail_id_seq'::regclass);


--
-- TOC entry 2296 (class 2604 OID 66922)
-- Name: id; Type: DEFAULT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY phone ALTER COLUMN id SET DEFAULT nextval('phone_id_seq'::regclass);


--
-- TOC entry 2298 (class 2604 OID 66965)
-- Name: id; Type: DEFAULT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY skype ALTER COLUMN id SET DEFAULT nextval('skype_id_seq'::regclass);


--
-- TOC entry 2297 (class 2604 OID 66948)
-- Name: id; Type: DEFAULT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- TOC entry 2299 (class 2604 OID 66979)
-- Name: id; Type: DEFAULT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY telegramm ALTER COLUMN id SET DEFAULT nextval('telegramm_id_seq'::regclass);


--
-- TOC entry 2294 (class 2604 OID 66914)
-- Name: id; Type: DEFAULT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2306 (class 2606 OID 67009)
-- Name: UNIQ_hash_user; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT "UNIQ_hash_user" UNIQUE (hash);


--
-- TOC entry 2314 (class 2606 OID 67691)
-- Name: UNIQ_tag_hash; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT "UNIQ_tag_hash" UNIQUE (hash);


--
-- TOC entry 2304 (class 2606 OID 66908)
-- Name: http_pkey; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY http
    ADD CONSTRAINT http_pkey PRIMARY KEY (id);


--
-- TOC entry 2329 (class 2606 OID 67660)
-- Name: link_user_tags_pkey; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY link_user_tags
    ADD CONSTRAINT link_user_tags_pkey PRIMARY KEY (id);


--
-- TOC entry 2325 (class 2606 OID 67023)
-- Name: mail_pkey; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY mail
    ADD CONSTRAINT mail_pkey PRIMARY KEY (id);


--
-- TOC entry 2311 (class 2606 OID 66924)
-- Name: phone_pkey; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY phone
    ADD CONSTRAINT phone_pkey PRIMARY KEY (id);


--
-- TOC entry 2319 (class 2606 OID 66967)
-- Name: skype_pkey; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY skype
    ADD CONSTRAINT skype_pkey PRIMARY KEY (id);


--
-- TOC entry 2316 (class 2606 OID 66950)
-- Name: tags_pkey; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 2322 (class 2606 OID 66981)
-- Name: telegramm_pkey; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY telegramm
    ADD CONSTRAINT telegramm_pkey PRIMARY KEY (id);


--
-- TOC entry 2308 (class 2606 OID 66916)
-- Name: users_pkey; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2326 (class 1259 OID 67703)
-- Name: FKI_tags; Type: INDEX; Schema: lancers; Owner: -
--

CREATE INDEX "FKI_tags" ON link_user_tags USING btree (tags_hash);


--
-- TOC entry 2327 (class 1259 OID 67697)
-- Name: FKI_user; Type: INDEX; Schema: lancers; Owner: -
--

CREATE INDEX "FKI_user" ON link_user_tags USING btree (user_hash);


--
-- TOC entry 2302 (class 1259 OID 67037)
-- Name: FKI_user_http; Type: INDEX; Schema: lancers; Owner: -
--

CREATE INDEX "FKI_user_http" ON http USING btree (link_user);


--
-- TOC entry 2323 (class 1259 OID 67029)
-- Name: FKI_user_mail; Type: INDEX; Schema: lancers; Owner: -
--

CREATE INDEX "FKI_user_mail" ON mail USING btree (link_user);


--
-- TOC entry 2309 (class 1259 OID 67015)
-- Name: FKI_user_phone; Type: INDEX; Schema: lancers; Owner: -
--

CREATE INDEX "FKI_user_phone" ON phone USING btree (link_user);


--
-- TOC entry 2317 (class 1259 OID 67043)
-- Name: FKI_user_skype; Type: INDEX; Schema: lancers; Owner: -
--

CREATE INDEX "FKI_user_skype" ON skype USING btree (link_user);


--
-- TOC entry 2312 (class 1259 OID 67049)
-- Name: FKI_user_tag; Type: INDEX; Schema: lancers; Owner: -
--

CREATE INDEX "FKI_user_tag" ON tags USING btree (hash);


--
-- TOC entry 2320 (class 1259 OID 67055)
-- Name: FKI_user_telegramm; Type: INDEX; Schema: lancers; Owner: -
--

CREATE INDEX "FKI_user_telegramm" ON telegramm USING btree (link_user);


--
-- TOC entry 2335 (class 2606 OID 67692)
-- Name: FK_user; Type: FK CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY link_user_tags
    ADD CONSTRAINT "FK_user" FOREIGN KEY (user_hash) REFERENCES users(hash) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2330 (class 2606 OID 67032)
-- Name: FK_user_http; Type: FK CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY http
    ADD CONSTRAINT "FK_user_http" FOREIGN KEY (link_user) REFERENCES users(hash) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2334 (class 2606 OID 67024)
-- Name: FK_user_mail; Type: FK CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY mail
    ADD CONSTRAINT "FK_user_mail" FOREIGN KEY (link_user) REFERENCES users(hash) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2331 (class 2606 OID 67010)
-- Name: FK_user_phone; Type: FK CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY phone
    ADD CONSTRAINT "FK_user_phone" FOREIGN KEY (link_user) REFERENCES users(hash) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2332 (class 2606 OID 67038)
-- Name: FK_user_skype; Type: FK CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY skype
    ADD CONSTRAINT "FK_user_skype" FOREIGN KEY (link_user) REFERENCES users(hash) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2333 (class 2606 OID 67050)
-- Name: FK_user_telegramm; Type: FK CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY telegramm
    ADD CONSTRAINT "FK_user_telegramm" FOREIGN KEY (link_user) REFERENCES users(hash) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2018-08-29 19:39:40 MSK

--
-- PostgreSQL database dump complete
--

