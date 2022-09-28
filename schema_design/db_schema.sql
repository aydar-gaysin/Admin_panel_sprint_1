-- Cоздание базы онлайн-кинотеатра:
CREATE DATABASE movies_database;

-- Создание отдельной схемы для контента:
CREATE SCHEMA IF NOT EXISTS content;

-- Информация о фильмах:
CREATE TABLE IF NOT EXISTS content.film_work (
    id uuid PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    creation_date DATE,
    file_path TEXT,
    rating FLOAT,
    type TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
);

-- Жанры кинопроизведений:
CREATE TABLE IF NOT EXISTS content.genre (
    id uuid PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
);

-- Жанры фильмов:
CREATE TABLE IF NOT EXISTS content.genre_film_work (
    id uuid PRIMARY KEY,
    film_work_id uuid NOT NULL,
    genre_id TEXT,
    created_at TIMESTAMP WITH TIME ZONE
);

-- Актеры и участники съемок
CREATE TABLE IF NOT EXISTS content.person (
    id uuid PRIMARY KEY,
    full_name TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMP WITH TIME ZONE
);

-- Актеры, сыгравшие в фильме
CREATE TABLE IF NOT EXISTS content.person_film_work (
    id uuid PRIMARY KEY,
    film_work_id uuid NOT NULL,
    person_id uuid NOT NULL,
    role TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE
);

-- Уникальный индекс для фильмов по жанру:
CREATE UNIQUE INDEX film_work_genre
    ON content.genre_film_work (film_work_id, genre_id);

-- Уникальный индекс актеров, сыгравших роль в фильме:
CREATE UNIQUE INDEX film_work_person_role
    ON content.person_film_work (film_work_id, person_id, role);