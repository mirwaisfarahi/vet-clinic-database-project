/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth < '2019-12-31';
SELECT name FROM animals WHERE neutered = 't' AND escape_attempts < 3;
SELECT date_of_birth FROM animals where name LIKE '%Agumon' OR name LIKE '%Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = 't';
SELECT * FROM animals WHERE name NOT LIKE '%Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '01/01/2022';
SAVEPOINT delete_operation;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT delete_operation;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

--How many animals are there?
SELECT COUNT(*) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts > 0;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE (date_of_birth >= '01/01/1990' AND date_of_birth <= '01/01/2000') GROUP BY species;

-- Queries for owner, species and animals tables as join
SELECT a.name AS "Animal Name", o.full_name AS "Belong To"  FROM animals AS a JOIN owners AS o ON a.owners_id = o.id WHERE o.full_name = 'Melody Pond';
 SELECT a.name AS "Animal Name", s.name AS "Animal Type" FROM animals AS a JOIN species AS s ON a.species_id = s.id WHERE s.name = 'Pokemon';
 SELECT o.full_name AS "Owner Name", a.name AS "Animal Name" FROM owners AS o LEFT JOIN animals AS a ON o.id = a.owners_id;
 SELECT s.name AS "Species", COUNT(a.species_id) "Number of Animals Per Species" FROM animals AS a  JOIN species AS s  ON a.species_id = s.id  GROUP BY s.id;
 SELECT o.full_name AS "OWNER NAME", a.name AS "ANIMAL NAME" FROM owners AS o  JOIN animals AS a  ON o.id = a.owners_id  WHERE o.full_name = 'Jennifer Orwell' AND a.species_id = 2;
 SELECT o.full_name AS "OWNER NAME", a.name AS "ANIMAL NAME", a.escape_attempts AS "ESCAPE ATTEMPTS" FROM owners AS o  JOIN animals AS a  ON o.id = a.owners_id  WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;
 SELECT o.full_name AS "OWNER NAME", COUNT(a.name) as "NUMBER OF ANIMALS" FROM owners AS o  LEFT JOIN animals AS a  ON a.owners_id = o.id  GROUP BY o.full_name  ORDER BY COUNT(a.name) DESC  LIMIT 1;
 