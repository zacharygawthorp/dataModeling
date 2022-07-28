DROP DATABASE medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    speciality TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    insurance BOOLEAN DEFAULT FALSE,
    birthday INTEGER
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    visit_date DATE,
    doctor_id INTEGER REFERENCES doctors (id),
    patient_id INTEGER REFERENCES patients (id)
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    description TEXT
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    notes TEXT,
    visit_id INTEGER REFERENCES visits (id),
    disease_id INTEGER REFERENCES diseases (id)
);

INSERT INTO doctors
(name, speciality)
VALUES
('JOHN DOE', 'Internal Medicine'),
('SUZY MAE', 'Peds');

INSERT INTO patients
(name, insurance, birthday)
VALUES
('JOE', false, 1967),
('Jane', true, 1975);

INSERT INTO diseases
(name, description)
VALUES
('Fungus', 'I Do Not Know'),
('Cold', 'Runny nose');

INSERT INTO visits
(visit_date, doctor_id, patient_id)
VALUES
('2022-06-03', 2, 1),
('2022-05-21', 1, 1);

INSERT INTO diagnoses 
(notes, visit_id, disease_id)
VALUES
('Antibiotics', 2, 1),
('Cough Medicine', 1, 1);

