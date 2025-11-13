--
-- PostgreSQL database dump
--

\restrict DzkvPD3vvK3qPJRj1VfygkSiRXL6dpLrmxUkRCRRibBiP8KaouFQt8ARwnReX7S

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: complexity_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE complexity_type AS ENUM (
    'main',
    'hard'
);


--
-- Name: role_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE role_type AS ENUM (
    'teacher',
    'student'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: answer_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE answer_type (
    id integer NOT NULL,
    type character varying
);


--
-- Name: answer_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE answer_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: answer_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE answer_type_id_seq OWNED BY answer_type.id;


--
-- Name: complexity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE complexity (
    id integer NOT NULL,
    complexity character varying
);


--
-- Name: complexity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE complexity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: complexity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE complexity_id_seq OWNED BY complexity.id;


--
-- Name: lessons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE lessons (
    task_indexs integer,
    title text,
    description text,
    video_url text,
    id integer NOT NULL,
    task_complexity bigint
);


--
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lessons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lessons_id_seq OWNED BY lessons.id;


--
-- Name: question_answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE question_answers (
    id_quiz_questions bigint,
    answer_text text,
    id integer NOT NULL,
    is_correct bigint
);


--
-- Name: question_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE question_answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: question_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE question_answers_id_seq OWNED BY question_answers.id;


--
-- Name: quizz_questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE quizz_questions (
    id_quiz bigint,
    question_text text,
    id integer NOT NULL
);


--
-- Name: quizz_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE quizz_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quizz_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE quizz_questions_id_seq OWNED BY quizz_questions.id;


--
-- Name: quizzes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE quizzes (
    id_lesson bigint,
    title text,
    id integer NOT NULL
);


--
-- Name: quizzes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE quizzes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quizzes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE quizzes_id_seq OWNED BY quizzes.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE roles (
    id integer NOT NULL,
    role_name character varying
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE status (
    id integer NOT NULL,
    status character varying
);


--
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE status_id_seq OWNED BY status.id;


--
-- Name: user_lesson_progress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_lesson_progress (
    id_user bigint,
    id_lesson bigint,
    id integer NOT NULL,
    status bigint
);


--
-- Name: user_lesson_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_lesson_progress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_lesson_progress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_lesson_progress_id_seq OWNED BY user_lesson_progress.id;


--
-- Name: user_quiz_progress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_quiz_progress (
    max_score integer NOT NULL,
    score integer NOT NULL,
    id_user bigint,
    id_quiz bigint,
    id integer NOT NULL
);


--
-- Name: user_quiz_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_quiz_progress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_quiz_progress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_quiz_progress_id_seq OWNED BY user_quiz_progress.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    email character varying(320) NOT NULL,
    first_name character varying(35) NOT NULL,
    second_name character varying(35) NOT NULL,
    id integer NOT NULL,
    created_at timestamp without time zone,
    role bigint
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: answer_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY answer_type ALTER COLUMN id SET DEFAULT nextval('answer_type_id_seq'::regclass);


--
-- Name: complexity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY complexity ALTER COLUMN id SET DEFAULT nextval('complexity_id_seq'::regclass);


--
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lessons ALTER COLUMN id SET DEFAULT nextval('lessons_id_seq'::regclass);


--
-- Name: question_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY question_answers ALTER COLUMN id SET DEFAULT nextval('question_answers_id_seq'::regclass);


--
-- Name: quizz_questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY quizz_questions ALTER COLUMN id SET DEFAULT nextval('quizz_questions_id_seq'::regclass);


--
-- Name: quizzes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY quizzes ALTER COLUMN id SET DEFAULT nextval('quizzes_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY status ALTER COLUMN id SET DEFAULT nextval('status_id_seq'::regclass);


--
-- Name: user_lesson_progress id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_lesson_progress ALTER COLUMN id SET DEFAULT nextval('user_lesson_progress_id_seq'::regclass);


--
-- Name: user_quiz_progress id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_quiz_progress ALTER COLUMN id SET DEFAULT nextval('user_quiz_progress_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: answer_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY answer_type (id, type) FROM stdin;
\.


--
-- Data for Name: complexity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY complexity (id, complexity) FROM stdin;
\.


--
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY lessons (task_indexs, title, description, video_url, id, task_complexity) FROM stdin;
\.


--
-- Data for Name: question_answers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY question_answers (id_quiz_questions, answer_text, id, is_correct) FROM stdin;
\.


--
-- Data for Name: quizz_questions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY quizz_questions (id_quiz, question_text, id) FROM stdin;
\.


--
-- Data for Name: quizzes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY quizzes (id_lesson, title, id) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY roles (id, role_name) FROM stdin;
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: -
--

COPY status (id, status) FROM stdin;
\.


--
-- Data for Name: user_lesson_progress; Type: TABLE DATA; Schema: public; Owner: -
--

COPY user_lesson_progress (id_user, id_lesson, id, status) FROM stdin;
\.


--
-- Data for Name: user_quiz_progress; Type: TABLE DATA; Schema: public; Owner: -
--

COPY user_quiz_progress (max_score, score, id_user, id_quiz, id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY users (email, first_name, second_name, id, created_at, role) FROM stdin;
\.


--
-- Name: answer_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('answer_type_id_seq', 1, false);


--
-- Name: complexity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('complexity_id_seq', 1, false);


--
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('lessons_id_seq', 1, false);


--
-- Name: question_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('question_answers_id_seq', 1, false);


--
-- Name: quizz_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('quizz_questions_id_seq', 1, false);


--
-- Name: quizzes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('quizzes_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('roles_id_seq', 1, false);


--
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('status_id_seq', 1, false);


--
-- Name: user_lesson_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_lesson_progress_id_seq', 1, false);


--
-- Name: user_quiz_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_quiz_progress_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: answer_type answer_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY answer_type
    ADD CONSTRAINT answer_type_pkey PRIMARY KEY (id);


--
-- Name: complexity complexity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY complexity
    ADD CONSTRAINT complexity_pkey PRIMARY KEY (id);


--
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- Name: question_answers question_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY question_answers
    ADD CONSTRAINT question_answers_pkey PRIMARY KEY (id);


--
-- Name: quizz_questions quizz_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quizz_questions
    ADD CONSTRAINT quizz_questions_pkey PRIMARY KEY (id);


--
-- Name: quizzes quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quizzes
    ADD CONSTRAINT quizzes_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- Name: user_lesson_progress user_lesson_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_lesson_progress
    ADD CONSTRAINT user_lesson_progress_pkey PRIMARY KEY (id);


--
-- Name: user_quiz_progress user_quiz_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_quiz_progress
    ADD CONSTRAINT user_quiz_progress_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: question_answers answer_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY question_answers
    ADD CONSTRAINT answer_type_id_fkey FOREIGN KEY (is_correct) REFERENCES answer_type(id);


--
-- Name: lessons complexity_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lessons
    ADD CONSTRAINT complexity_type_id_fkey FOREIGN KEY (task_complexity) REFERENCES complexity(id);


--
-- Name: quizz_questions id_quiz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quizz_questions
    ADD CONSTRAINT id_quiz_fkey FOREIGN KEY (id_quiz) REFERENCES quizzes(id);


--
-- Name: user_quiz_progress id_quiz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_quiz_progress
    ADD CONSTRAINT id_quiz_fkey FOREIGN KEY (id_quiz) REFERENCES quizzes(id);


--
-- Name: question_answers id_quiz_questions_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY question_answers
    ADD CONSTRAINT id_quiz_questions_fkey FOREIGN KEY (id_quiz_questions) REFERENCES quizz_questions(id);


--
-- Name: users id_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT id_role_fkey FOREIGN KEY (role) REFERENCES roles(id);


--
-- Name: user_lesson_progress id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_lesson_progress
    ADD CONSTRAINT id_user_fkey FOREIGN KEY (id_user) REFERENCES users(id);


--
-- Name: user_quiz_progress id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_quiz_progress
    ADD CONSTRAINT id_user_fkey FOREIGN KEY (id_user) REFERENCES users(id);


--
-- Name: quizzes quizzes_id_lesson_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY quizzes
    ADD CONSTRAINT quizzes_id_lesson_fkey FOREIGN KEY (id_lesson) REFERENCES lessons(id);


--
-- Name: user_lesson_progress statys_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_lesson_progress
    ADD CONSTRAINT statys_type_id_fkey FOREIGN KEY (status) REFERENCES status(id);


--
-- Name: user_lesson_progress user_lesson_progress_id_lesson_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_lesson_progress
    ADD CONSTRAINT user_lesson_progress_id_lesson_fkey FOREIGN KEY (id_lesson) REFERENCES lessons(id);


--
-- PostgreSQL database dump complete
--

\unrestrict DzkvPD3vvK3qPJRj1VfygkSiRXL6dpLrmxUkRCRRibBiP8KaouFQt8ARwnReX7S

