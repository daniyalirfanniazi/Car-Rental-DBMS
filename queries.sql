SELECT *
FROM Car
WHERE status = 'Available';

SELECT c.name AS customer_name, r.rental_id, r.start_date, r.end_date
FROM Customer c
JOIN Rental r ON c.customer_id = r.customer_id;

SELECT c.name AS customer_name, car.brand, car.model
FROM Rental r
JOIN Customer c ON r.customer_id = c.customer_id
JOIN Car car ON r.car_id = car.car_id;

SELECT rental_id, SUM(amount) AS total_revenue
FROM Payment
GROUP BY rental_id;

SELECT AVG(daily_rate) AS average_daily_rate
FROM Car;

SELECT b.branch_name, COUNT(c.car_id) AS total_cars
FROM Branch b
JOIN Car c ON b.branch_id = c.branch_id
GROUP BY b.branch_name;

SELECT e.name, COUNT(r.rental_id) AS rentals_handled
FROM Employee e
LEFT JOIN Rental r ON e.employee_id = r.employee_id
GROUP BY e.name;

SELECT c.customer_id, c.name AS customer_name, COUNT(r.rental_id) AS rental_count
FROM Customer c
JOIN Rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(r.rental_id) > 1;

SELECT r.rental_id, c.name AS customer_name, r.total_amount
FROM Rental r
JOIN Customer c ON r.customer_id = c.customer_id
ORDER BY r.total_amount DESC
LIMIT 1;

SELECT r.rental_id, c.name AS customer_name, r.start_date
FROM Rental r
JOIN Customer c ON r.customer_id = c.customer_id
WHERE r.start_date LIKE '2025-01%';

SELECT rental_id, COUNT(payment_id) AS payments_made, SUM(amount) AS total_paid
FROM Payment
GROUP BY rental_id;

SELECT car.brand, car.model, SUM(m.cost) AS total_maintenance_cost
FROM Maintenance m
JOIN Car car ON m.car_id = car.car_id
GROUP BY car.brand, car.model;

SELECT c.name AS customer_name, COUNT(r.rental_id) AS total_rentals, SUM(r.total_amount) AS total_spent
FROM Customer c
JOIN Rental r ON c.customer_id = r.customer_id
GROUP BY c.name;

SELECT UPPER(car.model) AS model_name, car.brand, b.branch_name
FROM Car car
JOIN Branch b ON car.branch_id = b.branch_id;

SELECT SUBSTR(start_date, 1, 7) AS month, COUNT(rental_id) AS total_rentals
FROM Rental
GROUP BY month;
