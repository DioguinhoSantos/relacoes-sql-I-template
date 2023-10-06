

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