-- Create the database
CREATE DATABASE hotel_db;
USE hotel_db;

-- Table: guests
CREATE TABLE guests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    gender ENUM('Male', 'Female', 'Others'),
    id_number VARCHAR(255),
    id_type VARCHAR(255),
    phone VARCHAR(15),
    email VARCHAR(255),
    nationality VARCHAR(255)
);

-- Table: reservations
CREATE TABLE reservations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    reserv_date DATETIME,
    check_in DATETIME,
    check_out DATETIME,
    adults INT,
    children INT,
    amount_total INT,
    payment_status ENUM('Completed', 'Pending', 'Partial', 'Cancelled')
);

-- Table: rooms
CREATE TABLE rooms (
    id INT AUTO_INCREMENT PRIMARY KEY,
    branch_id INT,
    room_number INT,
    room_type_id INT,
    room_status ENUM('Available', 'Booked', 'Inactive')
);

-- Table: room_type
CREATE TABLE room_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(255),
    description TEXT,
    bed_type VARCHAR(255),
    size INT,
    max_occupancy INT,
    base_rate INT
);

-- Table: payments
CREATE TABLE payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT,
    amount INT,
    payment_method ENUM('Cash', 'Transfer', 'Card', 'Others')
);

-- Table: branches
CREATE TABLE branches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255), 
    manager_id INT,
    city VARCHAR(255),
    state VARCHAR(255),
    country VARCHAR(255),
    date_established DATE
);

--Table: employees
CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    branch_id INT,
    role_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    date_of_birth DATE,
    gender ENUM('Male', 'Female', 'Others'),
    hire_date DATE,
    to_date DATE
);

--Table: expenses
CREATE TABLE expenses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    branch_id INT,
    type VARCHAR(255),
    description VARCHAR(255),
    amount INT,
    payment_date DATETIME
);

--Table: roles
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    role VARCHAR(255),
    salary INT
);

--Table: salaries
CREATE TABLE salaries(
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    salary INT,
    from_date DATE,
    to_date DATE
);

--Constraints: reservations
ALTER TABLE reservations ADD CONSTRAINT 
Foreign Key (guest_id) REFERENCES guests(id)
ON UPDATE CASCADE ON DELETE CASCADE
;
ALTER TABLE reservations ADD CONSTRAINT
Foreign Key (room_id) REFERENCES rooms(id)
ON UPDATE CASCADE ON DELETE CASCADE
;


--Constraints: rooms
ALTER TABLE rooms ADD CONSTRAINT
Foreign Key (branch_id) REFERENCES branches(id)
ON UPDATE CASCADE ON DELETE CASCADE
;


--Constraints: payments
ALTER TABLE payments ADD CONSTRAINT
Foreign Key (reservation_id) REFERENCES reservations(id)
ON UPDATE CASCADE ON DELETE CASCADE
;


--Constraint: branches
ALTER TABLE branches ADD CONSTRAINT
Foreign Key (manager_id) REFERENCES employees(id)
ON UPDATE CASCADE ON DELETE CASCADE
;


--Constraint: employees
ALTER TABLE employees ADD CONSTRAINT
Foreign Key (branch_id) REFERENCES branches(id)
ON UPDATE CASCADE ON DELETE CASCADE
;
ALTER TABLE employees ADD CONSTRAINT
Foreign Key (role_id) REFERENCES roles(id)
ON UPDATE CASCADE ON DELETE CASCADE
;

--Constraint: expenses
ALTER TABLE expenses ADD CONSTRAINT
Foreign Key (branch_id) REFERENCES branches(id)
ON UPDATE CASCADE ON DELETE CASCADE
;

--Constraint: salaries
ALTER TABLE salaries ADD CONSTRAINT
Foreign Key (employee_id) REFERENCES employees(id)
ON UPDATE CASCADE ON DELETE CASCADE
;
