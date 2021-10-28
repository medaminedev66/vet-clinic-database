/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals(
  id INT PRIMARY KEY NOT NULL,
  name TEXT NOT NULL,
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL
);

ALTER TABLE animals
  Add species TEXT;

CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  full_name TEXT,
  age INT
);  

CREATE TABLE species(
 id SERIAL PRIMARY KEY,
 name TEXT
);

ALTER TABLE animals DROP COLUMN id;
ALTER TABLE animals ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT,
  ADD CONSTRAINT fk_species
  FOREIGN KEY (species_id)
  REFERENCES species (id);

ALTER TABLE animals ADD COLUMN owner_id INT,
  ADD CONSTRAINT fk_owners
  FOREIGN KEY (owner_id)
  REFERENCES owners (id);

CREATE TABLE vets(
  id SERIAL PRIMARY KEY,
  name TEXT,
  age INT,
  date DATE
);

CREATE TABLE specializations (
  species_id INT,
  vets_id INT,
  PRIMARY KEY (species_id, vets_id),
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);

CREATE TABLE visits (
  animals_id INT,
  vets_id INT,
  date DATE,
  PRIMARY KEY (animals_id, vets_id),
  CONSTRAINT animals_id FOREIGN KEY(animals_id) REFERENCES animals(id),
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);