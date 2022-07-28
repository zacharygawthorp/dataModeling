DROP DATABASE soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    city TEXT
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    birthday DATE,
    height INTEGER,
    current_team INTEGER REFERENCES teams (id)
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    home_team_id INTEGER REFERENCES teams (id),
    away_team_id INTEGER REFERENCES teams (id),
    location TEXT,
    match_date DATE,
    start_time TEXT,
    season_id INTEGER REFERENCES season (id),
    head_referee_id INTEGER REFERENCES referees (id),
    assistant_referee_1_id INTEGER REFERENCES referees (id),
    assistant_referee_2_id INTEGER REFERENCES referees (id)
);

CREATE TABLE lineups (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players (id),
    match_lineup_id INTEGER REFERENCES matches (id),
    team_id INTEGER REFERENCES teams (id)
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players (id),
    match_goals_id INTEGER REFERENCES matches (id)
);

CREATE TABLE results (
    id SERIAL PRIMARY KEY,
    match_result_id INTEGER REFERENCES matches (id),
    team_id INTEGER REFERENCES teams (id),
    result TEXT
);


    

