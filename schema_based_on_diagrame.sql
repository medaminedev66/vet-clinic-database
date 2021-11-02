CREATE TABLE patients (
    id INT PRIMARY KEY,
    name TEXT,
    date_of_birth DATE
);

CREATE TABLE medical_histories(
    id INT PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(35),
    CONSTRAINT fk_patient
      FOREIGN KEY(patient_id) REFERENCES patients(id)
);
CREATE INDEX patient_id_index ON medical_histories(patient_id);

CREATE TABLE invoices(
    id INT PRIMARY KEY,
    total_amounts DECIMAL,
    generat_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_hestory_id INT,
    CONSTRAINT fk_medical_history
    FOREIGN KEY (medical_hestory_id) REFERENCES medical_histories(id)
);
CREATE INDEX med_id_index ON invoices(medical_hestory_id);

CREATE TABLE invoice_items (
    id INT PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price INT,
    invoice_id INT,
    treatment_id INT,
    CONSTRAINT fk_invoice FOREIGN KEY (invoice_id) REFERENCES invoices(id),
    CONSTRAINT fk_treatment FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);
CREATE INDEX invoice_id_index ON invoice_items(invoice_id);
CREATE INDEX treat_id_index ON invoice_items(treatment_id);

CREATE TABLE treatments (
    id INT PRIMARY KEY,
    type VARCHAR(35),
    name VARCHAR(35)
);

CREATE TABLE treatments_join_histories (
  treatment_id INT,
  medical_history_id INT,
  CONSTRAINT fk_tr FOREIGN KEY(treatment_id) REFERENCES treatments(id) ON DELETE CASCADE,
  CONSTRAINT fk_mh FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id) ON DELETE CASCADE
);

CREATE INDEX treatment_id_index ON treatments_join_histories(treatment_id)
CREATE INDEX medical_history_index ON treatments_join_histories(medical_history_id)