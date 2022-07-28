DROP DATABASE craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR,
    encrypted_password VARCHAR,
    preferred_region_id TEXT
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR,
    post_text TEXT,
    location TEXT,
    user_id INTEGER REFERENCES users (id),
    region_id INTEGER REFERENCES regions (id),
    category_id INTEGER REFERENCES categories (id)
);

INSERT INTO regions
(name)
VALUES
('San Francisco'), 
('Atlanta'), 
('Seattle');

INSERT INTO users 
(username, encrypted_password, preferred_region_id)
VALUES
('Catdog', 'adaddaa', 'San Francisco'),
('Hey Arnold', 'akdahf', 'Atlanta'),
('Doug Funny','adhah', 'Seattle');

INSERT INTO categories 
(name)
VALUES
('Photography'),
('Cooking'),
('Running');

