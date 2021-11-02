CREATE TABLE patients (
    id INT PRIMARY KEY,
    name TEXT,
    date_of_birth
);

CREATE TABLE medical_hestories(
    id INT PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR,
    CONSTRAINT fk_patient
      FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE invoices(
    id INT PRIMARY KEY,
    total_amounts DECIMAL,
    generat_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_hestory_id INT,
    CONSTRAINT fk_medical_hestorie
    FOREIGN KEY (medical_hestory_id) REFERENCES medical_hestories(id)
);


