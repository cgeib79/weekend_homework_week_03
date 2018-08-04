DROP TABLE tickets;
DROP TABLE films;
DROP TABLE customers;

CREATE TABLE customers(
  id SERIAL PRIMARY KEY,
  customer_name VARCHAR(255),
  customer_funds INT
);

CREATE TABLE films(
  id SERIAL PRIMARY KEY,
  film_title VARCHAR(255),
  film_price INT
);

CREATE TABLE tickets(
  id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT REFERENCES films(id) ON DELETE CASCADE
);
