CREATE DATABASE VEHICLE_MANAGEMENT;

USE VEHICLE_MANAGEMENT;

CREATE TABLE ParkingLots (
    lot_id INT PRIMARY KEY,
    lot_name VARCHAR(50) NOT NULL,
    capacity INT NOT NULL
);

INSERT INTO ParkingLots (lot_id, lot_name, capacity) VALUES
(1, 'Lot A', 50),
(2, 'Lot B', 30),
(3, 'Lot C', 40);

SELECT * FROM ParkingLots;

CREATE TABLE Vehicles (
    vehicle_id INT PRIMARY KEY,
    plate_number VARCHAR(20) NOT NULL,
    vehicle_type VARCHAR(30) NOT NULL
);

INSERT INTO Vehicles (vehicle_id, plate_number, vehicle_type) VALUES
(101, 'ABC123', 'Car'),
(102, 'XYZ789', 'Motorcycle'),
(103, 'DEF456', 'Truck');

SELECT * FROM Vehicles;

CREATE TABLE ParkingLogs (
    log_id INT PRIMARY KEY,
    vehicle_id INT,
    lot_id INT,
    entry_time TIMESTAMP NOT NULL,
    exit_time TIMESTAMP,
    FOREIGN KEY (vehicle_id) REFERENCES Vehicles(vehicle_id),
    FOREIGN KEY (lot_id) REFERENCES ParkingLots(lot_id)
);

INSERT INTO ParkingLogs (log_id, vehicle_id, lot_id, entry_time, exit_time) VALUES
(201, 101, 1, '2024-01-09 10:00:00', '2024-01-09 15:30:00'),
(202, 102, 2, '2024-01-09 12:45:00', NULL),
(203, 103, 3, '2024-01-09 08:30:00', '2024-01-09 17:15:00');

SELECT * FROM ParkingLogs;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

INSERT INTO Users (user_id, username, password) VALUES
(1, 'admin', 'adminpass'),
(2, 'user1', 'userpass1'),
(3, 'user2', 'userpass2');

CREATE TABLE ParkingRates (
    rate_id INT PRIMARY KEY,
    lot_id INT,
    vehicle_type VARCHAR(30) NOT NULL,
    hourly_rate DECIMAL(8, 2) NOT NULL,
    FOREIGN KEY (lot_id) REFERENCES ParkingLots(lot_id)
);

INSERT INTO ParkingRates (rate_id, lot_id, vehicle_type, hourly_rate) VALUES
(301, 1, 'Car', 5.00),
(302, 2, 'Motorcycle', 2.50),
(303, 3, 'Truck', 8.00);

SELECT * FROM ParkingRates;

SELECT * FROM ParkingLots
INNER JOIN ParkingLogs
ON ParkingLots.lot_id=ParkingLogs.lot_id;

SELECT * FROM ParkingLogs
LEFT JOIN Users
ON ParkingLogs.lot_id= Users.user_id
UNION
SELECT * FROM ParkingLogs
RIGHT JOIN Users
ON ParkingLogs.lot_id= Users.user_id;








