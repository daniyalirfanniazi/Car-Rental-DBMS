PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Maintenance;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Rental;
DROP TABLE IF EXISTS Car;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Branch;

CREATE TABLE Branch (
    branch_id INTEGER PRIMARY KEY,
    branch_name TEXT NOT NULL,
    city TEXT,
    phone TEXT
);

CREATE TABLE Employee (
    employee_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    role TEXT,
    salary REAL,
    branch_id INTEGER NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

CREATE TABLE Customer (
    customer_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    phone TEXT,
    license_number TEXT UNIQUE
);

CREATE TABLE Car (
    car_id INTEGER PRIMARY KEY,
    model TEXT,
    brand TEXT,
    year INTEGER,
    daily_rate REAL,
    status TEXT DEFAULT 'Available',
    branch_id INTEGER NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

CREATE TABLE Rental (
    rental_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    car_id INTEGER NOT NULL,
    employee_id INTEGER NOT NULL,
    start_date TEXT NOT NULL,
    end_date TEXT NOT NULL,
    total_amount REAL NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (car_id) REFERENCES Car(car_id),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    CHECK (date(end_date) >= date(start_date))
);

CREATE TABLE Payment (
    payment_id INTEGER PRIMARY KEY,
    rental_id INTEGER NOT NULL,
    payment_date TEXT NOT NULL,
    amount REAL NOT NULL,
    method TEXT,
    FOREIGN KEY (rental_id) REFERENCES Rental(rental_id)
);

CREATE TABLE Maintenance (
    maintenance_id INTEGER PRIMARY KEY,
    car_id INTEGER NOT NULL,
    service_date TEXT NOT NULL,
    description TEXT,
    cost REAL NOT NULL,
    FOREIGN KEY (car_id) REFERENCES Car(car_id)
);
