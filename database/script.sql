CREATE DATABASE agencevoyage;
\c agencevoyage

CREATE TABLE hotel (
	id SERIAL PRIMARY KEY,
	nom VARCHAR(255)
);


CREATE TABLE reservation (
	id SERIAL PRIMARY KEY,
	idClient VARCHAR(4),
	nbPassagers INT,
	dateHeureArrivee TIMESTAMP,
	idHotel INT,
	FOREIGN KEY (idHotel) REFERENCES hotel(id)
);
