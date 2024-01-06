
cockroach sql --insecure --host=10.0.2.15:26257 --user=cedric

CREATE DATABASE dummy_db;
USE dummy_db;

CREATE TABLE dummy_table (
   id INT PRIMARY KEY,
   name VARCHAR(255),
   occupation VARCHAR(255),
   language VARCHAR(50),
   favorite_subject VARCHAR(100),
   semester INT
);

INSERT INTO dummy_table (id, name, occupation, language, favorite_subject, semester VALUES
   (1, 'John Doe', 'Software Engineer', 'English', 'Computer Science', 1),
   (2, 'Jane Smith', 'Data Analyst', 'Spanish', 'Statistics', 3),
   (3, 'Bob Johnson', 'Student', 'French', 'Mathematics', 2),
   (4, 'Cedric Lux', 'Student', 'German', 'Fehlertolerante Systeme', 5),
   (5, 'Hristomir Dimov', 'Student', 'German', 'Fehlertolerante Systeme', 5),
   (6, 'Nodirjon Tadjiev', 'Student', 'German', 'Fehlertolerante Systeme', 5);

SELECT * FROM dummy_table;