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

CREATE TYPE public.complexity_type AS ENUM (
    'main',
    'hard'
);


--
-- Name: role_type; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.role_type AS ENUM (
    'teacher',
    'student'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: answer_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.answer_type (
    id integer NOT NULL,
    type character varying
);


--
-- Name: answer_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.answer_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: answer_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.answer_type_id_seq OWNED BY public.answer_type.id;


--
-- Name: complexity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.complexity (
    id integer NOT NULL,
    complexity character varying
);


--
-- Name: complexity_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.complexity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: complexity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.complexity_id_seq OWNED BY public.complexity.id;


--
-- Name: lessons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lessons (
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

CREATE SEQUENCE public.lessons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lessons_id_seq OWNED BY public.lessons.id;


--
-- Name: question_answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.question_answers (
    id_quiz_questions bigint,
    answer_text text,
    id integer NOT NULL,
    is_correct bigint
);


--
-- Name: question_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.question_answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: question_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.question_answers_id_seq OWNED BY public.question_answers.id;


--
-- Name: quizz_questions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.quizz_questions (
    id_quiz bigint,
    question_text text,
    id integer NOT NULL
);


--
-- Name: quizz_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.quizz_questions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quizz_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.quizz_questions_id_seq OWNED BY public.quizz_questions.id;


--
-- Name: quizzes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.quizzes (
    id_lesson bigint,
    title text,
    id integer NOT NULL
);


--
-- Name: quizzes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.quizzes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: quizzes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.quizzes_id_seq OWNED BY public.quizzes.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    role_name character varying
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.status (
    id integer NOT NULL,
    status character varying
);


--
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;


--
-- Name: user_lesson_progress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_lesson_progress (
    id_user bigint,
    id_lesson bigint,
    id integer NOT NULL,
    status bigint
);


--
-- Name: user_lesson_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_lesson_progress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_lesson_progress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_lesson_progress_id_seq OWNED BY public.user_lesson_progress.id;


--
-- Name: user_quiz_progress; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_quiz_progress (
    max_score integer NOT NULL,
    score integer NOT NULL,
    id_user bigint,
    id_quiz bigint,
    id integer NOT NULL
);


--
-- Name: user_quiz_progress_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_quiz_progress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_quiz_progress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_quiz_progress_id_seq OWNED BY public.user_quiz_progress.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
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

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: answer_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answer_type ALTER COLUMN id SET DEFAULT nextval('public.answer_type_id_seq'::regclass);


--
-- Name: complexity id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.complexity ALTER COLUMN id SET DEFAULT nextval('public.complexity_id_seq'::regclass);


--
-- Name: lessons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons ALTER COLUMN id SET DEFAULT nextval('public.lessons_id_seq'::regclass);


--
-- Name: question_answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.question_answers ALTER COLUMN id SET DEFAULT nextval('public.question_answers_id_seq'::regclass);


--
-- Name: quizz_questions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quizz_questions ALTER COLUMN id SET DEFAULT nextval('public.quizz_questions_id_seq'::regclass);


--
-- Name: quizzes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quizzes ALTER COLUMN id SET DEFAULT nextval('public.quizzes_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);


--
-- Name: user_lesson_progress id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_lesson_progress ALTER COLUMN id SET DEFAULT nextval('public.user_lesson_progress_id_seq'::regclass);


--
-- Name: user_quiz_progress id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_quiz_progress ALTER COLUMN id SET DEFAULT nextval('public.user_quiz_progress_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: answer_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.answer_type (id, type) FROM stdin;
\.


--
-- Data for Name: complexity; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.complexity (id, complexity) FROM stdin;
\.


--
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.lessons (task_indexs, title, description, video_url, id, task_complexity) FROM stdin;
\.


--
-- Data for Name: question_answers; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.question_answers (id_quiz_questions, answer_text, id, is_correct) FROM stdin;
\.


--
-- Data for Name: quizz_questions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.quizz_questions (id_quiz, question_text, id) FROM stdin;
\.


--
-- Data for Name: quizzes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.quizzes (id_lesson, title, id) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.roles (id, role_name) FROM stdin;
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.status (id, status) FROM stdin;
\.


--
-- Data for Name: user_lesson_progress; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_lesson_progress (id_user, id_lesson, id, status) FROM stdin;
\.


--
-- Data for Name: user_quiz_progress; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_quiz_progress (max_score, score, id_user, id_quiz, id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (email, first_name, second_name, id, created_at, role) FROM stdin;
\.


--
-- Name: answer_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.answer_type_id_seq', 1, false);


--
-- Name: complexity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.complexity_id_seq', 1, false);


--
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.lessons_id_seq', 1, false);


--
-- Name: question_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.question_answers_id_seq', 1, false);


--
-- Name: quizz_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.quizz_questions_id_seq', 1, false);


--
-- Name: quizzes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.quizzes_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.status_id_seq', 1, false);


--
-- Name: user_lesson_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_lesson_progress_id_seq', 1, false);


--
-- Name: user_quiz_progress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.user_quiz_progress_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: answer_type answer_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answer_type
    ADD CONSTRAINT answer_type_pkey PRIMARY KEY (id);


--
-- Name: complexity complexity_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.complexity
    ADD CONSTRAINT complexity_pkey PRIMARY KEY (id);


--
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- Name: question_answers question_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.question_answers
    ADD CONSTRAINT question_answers_pkey PRIMARY KEY (id);


--
-- Name: quizz_questions quizz_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quizz_questions
    ADD CONSTRAINT quizz_questions_pkey PRIMARY KEY (id);


--
-- Name: quizzes quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- Name: user_lesson_progress user_lesson_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_lesson_progress
    ADD CONSTRAINT user_lesson_progress_pkey PRIMARY KEY (id);


--
-- Name: user_quiz_progress user_quiz_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_quiz_progress
    ADD CONSTRAINT user_quiz_progress_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: question_answers answer_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.question_answers
    ADD CONSTRAINT answer_type_id_fkey FOREIGN KEY (is_correct) REFERENCES public.answer_type(id);


--
-- Name: lessons complexity_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT complexity_type_id_fkey FOREIGN KEY (task_complexity) REFERENCES public.complexity(id);


--
-- Name: quizz_questions id_quiz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quizz_questions
    ADD CONSTRAINT id_quiz_fkey FOREIGN KEY (id_quiz) REFERENCES public.quizzes(id);


--
-- Name: user_quiz_progress id_quiz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_quiz_progress
    ADD CONSTRAINT id_quiz_fkey FOREIGN KEY (id_quiz) REFERENCES public.quizzes(id);


--
-- Name: question_answers id_quiz_questions_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.question_answers
    ADD CONSTRAINT id_quiz_questions_fkey FOREIGN KEY (id_quiz_questions) REFERENCES public.quizz_questions(id);


--
-- Name: users id_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT id_role_fkey FOREIGN KEY (role) REFERENCES public.roles(id);


--
-- Name: user_lesson_progress id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_lesson_progress
    ADD CONSTRAINT id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- Name: user_quiz_progress id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_quiz_progress
    ADD CONSTRAINT id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- Name: quizzes quizzes_id_lesson_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_id_lesson_fkey FOREIGN KEY (id_lesson) REFERENCES public.lessons(id);


--
-- Name: user_lesson_progress statys_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_lesson_progress
    ADD CONSTRAINT statys_type_id_fkey FOREIGN KEY (status) REFERENCES public.status(id);


--
-- Name: user_lesson_progress user_lesson_progress_id_lesson_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_lesson_progress
    ADD CONSTRAINT user_lesson_progress_id_lesson_fkey FOREIGN KEY (id_lesson) REFERENCES public.lessons(id);


--
-- PostgreSQL database dump complete
--

\unrestrict DzkvPD3vvK3qPJRj1VfygkSiRXL6dpLrmxUkRCRRibBiP8KaouFQt8ARwnReX7S

