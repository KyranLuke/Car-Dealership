CREATE TABLE Dealership (
  dealership_id SERIAL PRIMARY KEY,
  address VARCHAR(150),
  city VARCHAR(100),
  zip_code  VARCHAR(50),
  phone_number  VARCHAR(100)
);

CREATE TABLE Customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  customer_number VARCHAR(100),
  address VARCHAR(100)
);

CREATE TABLE Sales_rep (
  sales_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  salary INTEGER
);

CREATE TABLE Mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  salary INTEGER
);

CREATE TABLE car (
  car_id SERIAL PRIMARY KEY,
  make_ VARCHAR(100),
  model_ VARCHAR(100),
  year_ INTEGER,
  available_ VARCHAR(50)
);

CREATE TABLE services (
  car_services_id SERIAL PRIMARY KEY,
  car_services VARCHAR(150),
  parts VARCHAR(150),
  car_id INTEGER,
  mechanic_id INTEGER,
  FOREIGN KEY (car_id) REFERENCES "car"(car_id),
  FOREIGN KEY (mechanic_id) REFERENCES "mechanic"(mechanic_id)
);	

CREATE TABLE Service_History (
  service_history SERIAL PRIMARY KEY,
  car_services_id INTEGER ,
  FOREIGN KEY (car_services_id) REFERENCES "services"(car_services_id)
);

CREATE TABLE services_invoice(
  services_invoice SERIAL PRIMARY KEY,
  service_price VARCHAR(100),
  car_id INTEGER,
  customer_id INTEGER,
  mechanic_id INTEGER,
  FOREIGN KEY (car_id) REFERENCES "car"(car_id),
  FOREIGN KEY (mechanic_id) REFERENCES "mechanic"(mechanic_id),
  FOREIGN KEY (customer_id) REFERENCES "customer"(customer_id)
);

CREATE TABLE car_invoice (
  car_invoice SERIAL PRIMARY KEY,
  car_price VARCHAR(100),
  car_id INTEGER,
  customer_id INTEGER,
  sales_id INTEGER,
  FOREIGN KEY (car_id) REFERENCES "car"(car_id),
  FOREIGN KEY (sales_id) REFERENCES "sales_rep"(sales_id),
  FOREIGN KEY (customer_id) REFERENCES "customer"(customer_id)
);

INSERT INTO "dealership"(dealership_id, address, city, zip_code, phone_number)
VALUES (1, '530 W. Ashley Drive', 'Grand Haven, MI', '49417', '8675309');

INSERT INTO "customer"(customer_id, first_name, last_name, customer_number, address)
VALUES (1, 'Hank', 'Salmon', '800-273-8255', '17 Walnut Dr.
Worcester, MA 01604'),(2, 'Sam', 'Tomato', '800-273-8255', '434 North Forest Dr.
Lake Villa, IL 60046'),(3, 'Tim', 'Man', '800-273-8255', '318 Vermont Ave.
West New York, NJ 07093');

INSERT INTO "sales_rep"(sales_id, first_name, last_name, salary)
VALUES(1, 'Emily', 'Help', 43000 ), (2, 'Dewwy', 'Cox' , 72000);

INSERT INTO "mechanic"(mechanic_id, first_name, last_name, salary)
VALUES (1, 'Buster', 'Cherry', 67000), (2, 'Ron', 'Chee', 30000);

INSERT INTO "car"(car_id, make_, model_, year_, available_)
VALUES (1, 'DODGE', 'ATOS', '2002', 'yes'), (2, 'M45', 'Infiniti', '2004', 'yes'), 
(3, 'Mazda', '5', '2013', 'yes'), (4, 'Mazda', '6', '2015', 'yes');

INSERT INTO "services"(car_services_id, car_services, parts, car_id, mechanic_id)
VALUES (1, 'replace brake pads','brake pad', 3, 2 ), (2, 'oil change', 'oil and filter', 2, 2);

INSERT INTO "service_history"(service_history, car_services_id)
VALUES (1, 1),(2, 2);

INSERT INTO "services_invoice"(services_invoice, service_price, car_id, customer_id, mechanic_id)
VALUES (1, 100, 3, 2, 1), (2, 250, 1, 1, 2);

INSERT INTO "car_invoice"(car_invoice, car_price, car_id, customer_id, sales_id)
VALUES (1, 75000, 2, 1, 2), (2, 40000, 3, 1, 2);
