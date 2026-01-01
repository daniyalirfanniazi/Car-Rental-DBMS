INSERT INTO Branch (branch_id, branch_name, city, phone) VALUES
(1, 'Central Branch', 'Lahore', '042-1234567'),
(2, 'Airport Branch', 'Karachi', '021-7654321');

INSERT INTO Employee (employee_id, name, role, salary, branch_id) VALUES
(1, 'Daniyal Irfan', 'Manager', 80000, 1),
(2, 'Salar Butt', 'Agent', 50000, 1),
(3, 'Usman Ali', 'Agent', 52000, 2);

INSERT INTO Customer (customer_id, name, email, phone, license_number) VALUES
(1, 'Ali Khan', 'ali.khan@email.com', '0300-1234567', 'LIC-1001'),
(2, 'Ayesha Noor', 'ayesha.noor@email.com', '0311-2223344', 'LIC-1002'),
(3, 'Bilal Ahmed', 'bilal.ahmed@email.com', '0322-8887766', 'LIC-1003');

INSERT INTO Car (car_id, model, brand, year, daily_rate, status, branch_id) VALUES
(1, 'Civic', 'Honda', 2022, 8000, 'Available', 1),
(2, 'Corolla', 'Toyota', 2021, 7500, 'Available', 1),
(3, 'City', 'Honda', 2020, 6500, 'Available', 2),
(4, 'Elantra', 'Hyundai', 2023, 9000, 'Available', 2);

INSERT INTO Rental (rental_id, customer_id, car_id, employee_id, start_date, end_date, total_amount) VALUES
(1, 1, 1, 2, '2025-01-01', '2025-01-05', 40000),
(2, 2, 3, 3, '2025-01-03', '2025-01-06', 19500),
(3, 1, 2, 1, '2025-02-10', '2025-02-12', 15000);

INSERT INTO Payment (payment_id, rental_id, payment_date, amount, method) VALUES
(1, 1, '2025-01-01', 20000, 'Credit Card'),
(2, 1, '2025-01-05', 20000, 'Credit Card'),
(3, 2, '2025-01-03', 19500, 'Cash'),
(4, 3, '2025-02-10', 15000, 'Bank Transfer');

INSERT INTO Maintenance (maintenance_id, car_id, service_date, description, cost) VALUES
(1, 2, '2024-12-20', 'Oil change and filters', 3500),
(2, 4, '2024-11-15', 'Brake pads replacement', 12000);

UPDATE Car
SET status = 'Rented'
WHERE car_id IN (1, 2, 3);

UPDATE Car
SET daily_rate = daily_rate + 500
WHERE year >= 2022;

DELETE FROM Maintenance
WHERE maintenance_id = 2;
