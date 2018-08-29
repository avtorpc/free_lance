--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.1
-- Dumped by pg_dump version 9.5.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: lancers; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA lancers;


--
-- Name: SCHEMA lancers; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA lancers IS 'Список фрилансеров';


SET search_path = lancers, pg_catalog;

SET default_with_oids = false;

--
-- Name: http; Type: TABLE; Schema: lancers; Owner: -
--

CREATE TABLE http (
    id integer NOT NULL,
    url character varying(512),
    link_user character varying(32)
);


--
-- Name: TABLE http; Type: COMMENT; Schema: lancers; Owner: -
--

COMMENT ON TABLE http IS 'URL user';


--
-- Name: http_id_seq; Type: SEQUENCE; Schema: lancers; Owner: -
--

CREATE SEQUENCE http_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: http_id_seq; Type: SEQUENCE OWNED BY; Schema: lancers; Owner: -
--

ALTER SEQUENCE http_id_seq OWNED BY http.id;


--
-- Name: mail; Type: TABLE; Schema: lancers; Owner: -
--

CREATE TABLE mail (
    id integer NOT NULL,
    user_mail character varying(128),
    link_user character varying(32)
);


--
-- Name: mail_id_seq; Type: SEQUENCE; Schema: lancers; Owner: -
--

CREATE SEQUENCE mail_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mail_id_seq; Type: SEQUENCE OWNED BY; Schema: lancers; Owner: -
--

ALTER SEQUENCE mail_id_seq OWNED BY mail.id;


--
-- Name: phone; Type: TABLE; Schema: lancers; Owner: -
--

CREATE TABLE phone (
    id integer NOT NULL,
    num_phone character varying(128),
    link_user character varying(32)
);


--
-- Name: phone_id_seq; Type: SEQUENCE; Schema: lancers; Owner: -
--

CREATE SEQUENCE phone_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: phone_id_seq; Type: SEQUENCE OWNED BY; Schema: lancers; Owner: -
--

ALTER SEQUENCE phone_id_seq OWNED BY phone.id;


--
-- Name: skype; Type: TABLE; Schema: lancers; Owner: -
--

CREATE TABLE skype (
    id integer NOT NULL,
    login character varying(256),
    link_user character varying(32)
);


--
-- Name: skype_id_seq; Type: SEQUENCE; Schema: lancers; Owner: -
--

CREATE SEQUENCE skype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: skype_id_seq; Type: SEQUENCE OWNED BY; Schema: lancers; Owner: -
--

ALTER SEQUENCE skype_id_seq OWNED BY skype.id;


--
-- Name: tags; Type: TABLE; Schema: lancers; Owner: -
--

CREATE TABLE tags (
    id integer NOT NULL,
    tag character varying(512),
    link_user character varying(32)
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: lancers; Owner: -
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: lancers; Owner: -
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: telegramm; Type: TABLE; Schema: lancers; Owner: -
--

CREATE TABLE telegramm (
    id integer NOT NULL,
    login character varying(256),
    link_user character varying(32)
);


--
-- Name: telegramm_id_seq; Type: SEQUENCE; Schema: lancers; Owner: -
--

CREATE SEQUENCE telegramm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: telegramm_id_seq; Type: SEQUENCE OWNED BY; Schema: lancers; Owner: -
--

ALTER SEQUENCE telegramm_id_seq OWNED BY telegramm.id;


--
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
-- Name: users_id_seq; Type: SEQUENCE; Schema: lancers; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: lancers; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY http ALTER COLUMN id SET DEFAULT nextval('http_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY mail ALTER COLUMN id SET DEFAULT nextval('mail_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY phone ALTER COLUMN id SET DEFAULT nextval('phone_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY skype ALTER COLUMN id SET DEFAULT nextval('skype_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY telegramm ALTER COLUMN id SET DEFAULT nextval('telegramm_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: UNIQ_hash_user; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT "UNIQ_hash_user" UNIQUE (hash);


--
-- Name: http_pkey; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY http
    ADD CONSTRAINT http_pkey PRIMARY KEY (id);


--
-- Name: mail_pkey; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY mail
    ADD CONSTRAINT mail_pkey PRIMARY KEY (id);


--
-- Name: phone_pkey; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY phone
    ADD CONSTRAINT phone_pkey PRIMARY KEY (id);


--
-- Name: skype_pkey; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY skype
    ADD CONSTRAINT skype_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: telegramm_pkey; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY telegramm
    ADD CONSTRAINT telegramm_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: FKI_user_http; Type: INDEX; Schema: lancers; Owner: -
--

CREATE INDEX "FKI_user_http" ON http USING btree (link_user);


--
-- Name: FKI_user_mail; Type: INDEX; Schema: lancers; Owner: -
--

CREATE INDEX "FKI_user_mail" ON mail USING btree (link_user);


--
-- Name: FKI_user_phone; Type: INDEX; Schema: lancers; Owner: -
--

CREATE INDEX "FKI_user_phone" ON phone USING btree (link_user);


--
-- Name: FKI_user_skype; Type: INDEX; Schema: lancers; Owner: -
--

CREATE INDEX "FKI_user_skype" ON skype USING btree (link_user);


--
-- Name: FKI_user_tag; Type: INDEX; Schema: lancers; Owner: -
--

CREATE INDEX "FKI_user_tag" ON tags USING btree (link_user);


--
-- Name: FKI_user_telegramm; Type: INDEX; Schema: lancers; Owner: -
--

CREATE INDEX "FKI_user_telegramm" ON telegramm USING btree (link_user);


--
-- Name: FK_user_http; Type: FK CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY http
    ADD CONSTRAINT "FK_user_http" FOREIGN KEY (link_user) REFERENCES users(hash) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_user_mail; Type: FK CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY mail
    ADD CONSTRAINT "FK_user_mail" FOREIGN KEY (link_user) REFERENCES users(hash) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_user_phone; Type: FK CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY phone
    ADD CONSTRAINT "FK_user_phone" FOREIGN KEY (link_user) REFERENCES users(hash) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_user_skype; Type: FK CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY skype
    ADD CONSTRAINT "FK_user_skype" FOREIGN KEY (link_user) REFERENCES users(hash) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_user_tag; Type: FK CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT "FK_user_tag" FOREIGN KEY (link_user) REFERENCES users(hash) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: FK_user_telegramm; Type: FK CONSTRAINT; Schema: lancers; Owner: -
--

ALTER TABLE ONLY telegramm
    ADD CONSTRAINT "FK_user_telegramm" FOREIGN KEY (link_user) REFERENCES users(hash) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

