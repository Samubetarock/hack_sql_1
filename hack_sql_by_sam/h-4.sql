INSERT INTO countries(name)
VALUES
('VENEZUELA'),('COLOMBIA'),('GUATEMALA'),('YUGOSLAVIA'),('JAPON');
---SELECT * FROM countries name;

INSERT INTO priorities(type_name)
VALUES
('PEQUEÑA'),('BAJA'),('REGULAR'),('ALTA'),('SUPREMA');
---SELECT * FROM priorities type_name;

INSERT INTO contact_request(id_country, id_priority, name, detail, physical_address)
VALUES
(9,1, 'ADRIANA', 'CIUDADANO COMUN', 'LA LIMPIA'),
(10,2, 'ENMANUEL', 'CIUDADANO COMUN', 'LA TRINIDAD'),
(11,3, 'SAMUEL', 'CIUDADANO COMUN', 'EL SOLER');

--- SELECT * FROM contact_request;

DELETE FROM contact_request WHERE id_email = 17

UPDATE contact_request SET NAME = 'ADRIANITA INTELECTUAL',  physical_address = 'TOBAGO' WHERE id_email = 16;

---SELECT * FROM contact_request;