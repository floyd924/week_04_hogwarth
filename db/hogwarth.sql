DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS students;



CREATE TABLE houses(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);
CREATE TABLE students(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house_id INT REFERENCES houses(id) ON DELETE CASCADE,
  age INT
);
