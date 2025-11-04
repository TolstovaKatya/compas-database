--
-- PostgreSQL database dump
--

\restrict nid8gYeraNDtup8BG6S4LSsaw7MCrhuCQvfBvbDOBjpejR0bOp1LqazEn1dE3U6

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

-- Started on 2025-11-04 17:33:50

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

DROP DATABASE IF EXISTS compas;
--
-- TOC entry 4957 (class 1262 OID 16384)
-- Name: compas; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE compas WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE compas OWNER TO postgres;

\unrestrict nid8gYeraNDtup8BG6S4LSsaw7MCrhuCQvfBvbDOBjpejR0bOp1LqazEn1dE3U6
\connect compas
\restrict nid8gYeraNDtup8BG6S4LSsaw7MCrhuCQvfBvbDOBjpejR0bOp1LqazEn1dE3U6

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
-- TOC entry 867 (class 1247 OID 16421)
-- Name: complexity_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.complexity_type AS ENUM (
    'main',
    'hard'
);


ALTER TYPE public.complexity_type OWNER TO postgres;

--
-- TOC entry 861 (class 1247 OID 16406)
-- Name: role_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.role_type AS ENUM (
    'teacher',
    'student'
);


ALTER TYPE public.role_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16425)
-- Name: lessons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lessons (
    id bigint NOT NULL,
    task_complexity public.complexity_type,
    task_indexs integer,
    title text,
    description text,
    video_url text
);


ALTER TABLE public.lessons OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16483)
-- Name: question_answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_answers (
    id bigint NOT NULL,
    id_quiz_questions bigint,
    answer_text text
);


ALTER TABLE public.question_answers OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16470)
-- Name: quizz_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quizz_questions (
    id bigint NOT NULL,
    id_quiz bigint,
    question_text text
);


ALTER TABLE public.quizz_questions OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16457)
-- Name: quizzes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quizzes (
    id bigint NOT NULL,
    id_lesson bigint,
    title text
);


ALTER TABLE public.quizzes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16433)
-- Name: user_lesson_progress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_lesson_progress (
    id bigint NOT NULL,
    id_user bigint,
    id_lesson bigint
);


ALTER TABLE public.user_lesson_progress OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16397)
-- Name: user_quiz_progress; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_quiz_progress (
    id bigint NOT NULL,
    max_score integer NOT NULL,
    score integer NOT NULL,
    id_user bigint,
    id_quiz bigint
);


ALTER TABLE public.user_quiz_progress OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16411)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(320) NOT NULL,
    first_name character varying(35) NOT NULL,
    second_name character varying(35) NOT NULL,
    role public.role_type
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 4789 (class 2606 OID 16432)
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- TOC entry 4797 (class 2606 OID 16490)
-- Name: question_answers question_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_answers
    ADD CONSTRAINT question_answers_pkey PRIMARY KEY (id);


--
-- TOC entry 4795 (class 2606 OID 16477)
-- Name: quizz_questions quizz_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizz_questions
    ADD CONSTRAINT quizz_questions_pkey PRIMARY KEY (id);


--
-- TOC entry 4793 (class 2606 OID 16464)
-- Name: quizzes quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_pkey PRIMARY KEY (id);


--
-- TOC entry 4791 (class 2606 OID 16438)
-- Name: user_lesson_progress user_lesson_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_lesson_progress
    ADD CONSTRAINT user_lesson_progress_pkey PRIMARY KEY (id);


--
-- TOC entry 4785 (class 2606 OID 16404)
-- Name: user_quiz_progress user_quiz_progress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_quiz_progress
    ADD CONSTRAINT user_quiz_progress_pkey PRIMARY KEY (id);


--
-- TOC entry 4787 (class 2606 OID 16419)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4804 (class 2606 OID 16491)
-- Name: question_answers question_answers_id_quiz_questions_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_answers
    ADD CONSTRAINT question_answers_id_quiz_questions_fkey FOREIGN KEY (id_quiz_questions) REFERENCES public.quizz_questions(id);


--
-- TOC entry 4803 (class 2606 OID 16478)
-- Name: quizz_questions quizz_questions_id_quiz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizz_questions
    ADD CONSTRAINT quizz_questions_id_quiz_fkey FOREIGN KEY (id_quiz) REFERENCES public.quizzes(id);


--
-- TOC entry 4802 (class 2606 OID 16465)
-- Name: quizzes quizzes_id_lesson_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_id_lesson_fkey FOREIGN KEY (id_lesson) REFERENCES public.lessons(id);


--
-- TOC entry 4800 (class 2606 OID 16444)
-- Name: user_lesson_progress user_lesson_progress_id_lesson_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_lesson_progress
    ADD CONSTRAINT user_lesson_progress_id_lesson_fkey FOREIGN KEY (id_lesson) REFERENCES public.lessons(id);


--
-- TOC entry 4801 (class 2606 OID 16439)
-- Name: user_lesson_progress user_lesson_progress_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_lesson_progress
    ADD CONSTRAINT user_lesson_progress_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);


--
-- TOC entry 4798 (class 2606 OID 16506)
-- Name: user_quiz_progress user_quiz_progress_id_quiz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_quiz_progress
    ADD CONSTRAINT user_quiz_progress_id_quiz_fkey FOREIGN KEY (id_quiz) REFERENCES public.quizzes(id);


--
-- TOC entry 4799 (class 2606 OID 16501)
-- Name: user_quiz_progress user_quiz_progress_id_user_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_quiz_progress
    ADD CONSTRAINT user_quiz_progress_id_user_fkey FOREIGN KEY (id_user) REFERENCES public.users(id);


-- Completed on 2025-11-04 17:33:50

--
-- PostgreSQL database dump complete
--

\unrestrict nid8gYeraNDtup8BG6S4LSsaw7MCrhuCQvfBvbDOBjpejR0bOp1LqazEn1dE3U6

