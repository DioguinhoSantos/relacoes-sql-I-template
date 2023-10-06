

-- Práticas

CREATE TABLE phones (
    id TEXT UNIQUE NOT NULL PRIMARY KEY,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE users (
    id TEXT UNIQUE NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

SELECT * FROM users;

SELECT * FROM phones;

DROP TABLE users;

DROP TABLE phones;

INSERT INTO
    users 
    (id, name, email, password) 
VALUES 
    ('u002', 'Diego', 'diego@email.com', '12345');

INSERT INTO
    phones
    (id, phone_number, user_id)
VALUES
    ('p002', '987654321', 'u001');

SELECT * FROM users
INNER JOIN phones
ON phones.user_id = users.id;


----------------------------------------------------------------


CREATE TABLE drivers (
    id TEXT UNIQUE NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id TEXT UNIQUE NOT NULL,
    FOREIGN KEY (license_id) REFERENCES licenses(id)
);

CREATE TABLE licenses (
    id TEXT UNIQUE NOT NULL PRIMARY KEY,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);

SELECT * FROM drivers;

SELECT * FROM licenses;

DROP TABLE licenses;

DROP TABLE drivers;

INSERT INTO
    drivers 
    (id, name, email, password, license_id) 
VALUES 
    ('d001', 'Diego', 'diego@email.com', '12345', 'l001');

INSERT INTO
    licenses 
    (id, register_number, category) 
VALUES 
    ('l001', '0001', 'AB');

SELECT * FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;

SELECT drivers.id, name, email, register_number, category, license FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id;


----------------------------------------------------------------

CREATE TABLE champions (
    id TEXT UNIQUE NOT NULL PRIMARY KEY,
    name TEXT NOT NULL,
    role TEXT NOT NULL,
    gender TEXT NOT NULL,
    region TEXT NOT NULL,
    FOREIGN KEY (region) REFERENCES regions(region_name)
);

SELECT * FROM champions;

DROP TABLE champions;

INSERT INTO
    champions
    (id, name, role, gender, region)
VALUES
    ('C001', 'Irelia', 'mid', 'F', 'Ionia'),
    ('C002', 'Yasuo', 'mid', 'M', 'Ionia'),
    ('C003', 'Draven', 'ADC', 'M', 'Noxus'),
    ('C004', 'Gangplank', 'mid', 'M', 'Sentina'),
    ('C005', 'Lux', 'mid', 'F', 'Demacia'),
    ('C006', 'Galio', 'mid', 'M', 'Demacia');


CREATE TABLE regions (
    id TEXT UNIQUE NOT NULL PRIMARY KEY,
    region_name TEXT UNIQUE NOT NULL
);

SELECT * FROM regions;

DROP TABLE regions;

INSERT INTO
    regions
    (id, region_name)
VALUES
    ('R001', 'Ionia'),
    ('R002', 'Noxus'),
    ('R003', 'Sentina'),
    ('R004', 'Demacia');


SELECT * FROM champions
INNER JOIN regions
ON champions.region = regions.region_name;

SELECT 
    name AS NomeDoChamp,
    role AS Lane,
    region_name AS Região
FROM champions
INNER JOIN regions
ON champions.region = regions.region_name;