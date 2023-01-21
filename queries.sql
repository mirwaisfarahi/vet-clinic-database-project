/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth < '2019-12-31';
SELECT name FROM animals WHERE neutered = 't' AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Pikachu' OR name = 'Agumon';
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
