/* Populate database with sample data. */

INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('02/03/2020', 0, true, 10.23, 'Agumon');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('15/11/2018', 2, true, 8, 'Gabumon');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('07/01/2021', 1, false, 15.04, 'Pikachu');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('12/05/2017', 5, true, 11, 'Devimon');

INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('08/02/2020', 0, false,-11, 'Charmander');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('15/11/2020', 2, true,-5.7, 'Plantmon');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('04/02/1993', 3, false,-12.13, 'Squirtle');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('12/06/2005', 1, true,-45, 'Angemon');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('07/06/2005', 7, true,20.4, 'Boarmon');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('13/10/1998', 3, true,17, 'Blossom');
INSERT INTO animals(date_of_birth, escape_attempts, neutered, weight_kg, name) VALUES ('14/05/2022', 4, true, 22, 'Ditto');

-- insert data to owners, species tables. Update animals table
INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 43),('Jennifer Orwell', 19),('Bob', 45),('Melody Pond', 77),('Dean Winchester', 14),('Jodie Whittaker',38);
INSERT INTO species (name) VALUES ('Pokemon'),('Digimon');
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle',  'Blossom');
UPDATE animals SET owners_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon',  'Boarmon');

-- Insert into vets, specialization and visits tables
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Vet William Tatcher', 45, ' 23/04/2000'),('Vet Maisy Smith', 26, '17/01/2019'),('Stephanie Mendez', 64, '14/05/1981'),('Vet Jack Harkness', 38, '08/06/2008');
INSERT INTO specializations (vet_id, species_id) VALUES (1, 1) , (3, 2), (3, 1), (4,2);
INSERT INTO visits (animal_id, vetS_id, date_of_visit) VALUES (1, 1, '24/05/2020'), (1, 3, '22/07/2020'),
(2, 4, '02/02/2021'), (3, 2, '05/01/2020'), (3, 2,'08/03/2020'), (3, 2, '14/05/2020'),
(4, 3, '04/05/2021'), (5, 4, '24/02/2021'), (6, 2, '21/12/2019'), (6, 1, '10/08/2020'),
(6, 2, '07/04/2021'), (7, 3, '29/09/2019'), (8, 4, '03/10/2020'), (8, 4, '04/11/2020'),
(9, 2, '24/01/2019'), (9, 2, '15/05/2019'), (9, 2, '27/02/2020'), (9, 2, '03/08/2020'),
(10, 3, '24/05/2020'), (10, 1, '11/01/2021');
