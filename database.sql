-- Drop tables if they exist
DROP TABLE IF EXISTS payments CASCADE;
DROP TABLE IF EXISTS bookings CASCADE;
DROP TABLE IF EXISTS flights CASCADE;
DROP TABLE IF EXISTS passengers CASCADE;
DROP TABLE IF EXISTS airports CASCADE;
DROP TABLE IF EXISTS airlines CASCADE;

-- 1. Create airlines table
CREATE TABLE airlines (
    airline_id SERIAL PRIMARY KEY,
    airline_name VARCHAR(255) NOT NULL,
    airline_code VARCHAR(10) UNIQUE,
    country VARCHAR(100)
);

-- 2. Create airports table
CREATE TABLE airports (
    airport_id SERIAL PRIMARY KEY,
    airport_code VARCHAR(10) UNIQUE NOT NULL,
    airport_name VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL
);

-- 3. Create flights table
CREATE TABLE flights (
    flight_id SERIAL PRIMARY KEY,
    flight_number VARCHAR(20) NOT NULL,
    airline_id INTEGER NOT NULL,
    departure_airport_id INTEGER NOT NULL,
    arrival_airport_id INTEGER NOT NULL,
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    available_seats INTEGER NOT NULL,
    
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id),
    FOREIGN KEY (departure_airport_id) REFERENCES airports(airport_id),
    FOREIGN KEY (arrival_airport_id) REFERENCES airports(airport_id),
    
    CONSTRAINT check_price_positive CHECK (price > 0),
    CONSTRAINT check_seats_positive CHECK (available_seats >= 0)
);

-- 4. Create passengers table
CREATE TABLE passengers (
    passenger_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20),
    passport_number VARCHAR(50) UNIQUE NOT NULL,
    nationality VARCHAR(100)
);

-- 5. Create bookings table
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    flight_id INTEGER NOT NULL,
    passenger_id INTEGER NOT NULL,
    seat_number VARCHAR(10),
    status VARCHAR(20) DEFAULT 'pending',
    total_price DECIMAL(10,2) NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES passengers(passenger_id),
    
    CONSTRAINT check_total_price_positive CHECK (total_price > 0)
);

-- 6. Create payments table
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    booking_id INTEGER NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    payment_status VARCHAR(20),
    transaction_id VARCHAR(100),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    
    CONSTRAINT check_amount_positive CHECK (amount > 0)
);

-- Insert sample data
INSERT INTO airlines (airline_name, airline_code, country) VALUES
('Turkish Airlines', 'TK', 'Turkey'),
('Pegasus Airlines', 'PC', 'Turkey'),
('British Airways', 'BA', 'United Kingdom'),
('Lufthansa', 'LH', 'Germany'),
('AIR MAROC', 'RAM', 'MOROCCO'),
('QATAR Airways', 'QAA', 'QATAR'),
('Emirates', 'EK', 'UAE');

INSERT INTO airports (airport_code, airport_name, city, country) VALUES
('IST', 'Istanbul Airport', 'Istanbul', 'Turkey'),
('ESB', 'Ankara Esenboğa Airport', 'Ankara', 'Turkey'),
('CMN', 'Mohammed VI', 'Casablanca', 'Morocco'),
('LHR', 'Heathrow Airport', 'London', 'United Kingdom'),
('CDG', 'Charles de Gaulle Airport', 'Paris', 'France'),
('FRA', 'Frankfurt Airport', 'Frankfurt', 'Germany'),
('AGA', 'Agadir Airport', 'Agadir', 'Morocco'),
('BOD', 'Bordeaux Airport', 'Bordeaux', 'France'),
('SXF', 'Berlin Airport', 'Berlin', 'Germany');

INSERT INTO flights (flight_number, airline_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time, price, available_seats) VALUES
('TK1981', 1, 1, 4, '2025-01-15 08:00:00', '2025-01-15 09:30:00', 250.00, 120),
('PC862', 2, 2, 1, '2025-01-16 14:00:00', '2025-01-16 15:15:00', 85.00, 95),
('BA678', 3, 4, 1, '2025-01-17 11:00:00', '2025-01-17 15:30:00', 300.00, 80),
('TK1345', 1, 1, 6, '2025-01-18 09:30:00', '2025-01-18 14:00:00', 200.00, 150),
('LH1198', 4, 6, 1, '2025-01-19 16:00:00', '2025-01-19 21:45:00', 220.00, 110);

INSERT INTO passengers (first_name, last_name, email, phone, passport_number, nationality) VALUES
('Omar', 'Rodi', 'omarrodi@email.com', '+2125551234567', 'M22311992', 'Morocco'),
('AYA', 'Ouriad', 'ayaouriad@email.com', '+355556789012', 'B22312243', 'British'),
('Ali', 'Trifess', 'alitrifess@email.com', '+355553456789', 'B22311995', 'British'),
('chaimae', 'zghiri', 'chaimaezghiri@email.com', '+015553456789', 'U22311995', 'USA'),
('Maria', 'Schmidt', 'mariaschmidt@email.com', '+212567870100', 'M445566', 'Morocco'),
('SOFIA', 'NAAIM', 'sofianaiim@email.com', '+212143691643', 'M442346', 'Morocco'),
('MALIKA', 'SAMI', 'malikasami@email.com', '+212135870624', 'M32434', 'Morocco'),
('YOUSSEF', 'NOSSAK', 'youssefnossak@email.com', '+90378056734', 'T445566', 'Turkey'),
('SAMIA', 'SAMIH', 'samiaamith@email.com', '+44123456789', 'G2231677', 'Germany'),
('Maria', 'FATIN', 'mariafatin@email.com', '+013548952179', 'U445566', 'USA');

INSERT INTO bookings (flight_id, passenger_id, seat_number, total_price, status) VALUES
(1, 1, '15A', 2500.00, 'confirmed'),
(1, 2, '15B', 2500.00, 'confirmed'),
(2, 3, '22C', 850.00, 'NotConfirmed'),
(3, 4, '08F', 3000.00, 'confirmed'),
(3, 4, '04E', 1000.00, 'NotConfirmed'),
(3, 4, '08F', 2500.00, 'confirmed'),
(3, 4, '34F', 3400.00, 'confirmed'),
(3, 4, '11F', 3500.00, 'confirmed'),
(3, 4, '08F', 500.00, 'NotConfirmed'),
(4, 5, '12D', 2540.00, 'confirmed');

INSERT INTO payments (booking_id, amount, payment_method, payment_status, transaction_id) VALUES
(1, 2500.00, 'MASTERCARD', 'confirmed', 'DAHGDNASD'),
(2, 2500.00, 'VISA', 'confirmed', 'AJKGFAKFF'),
(3, 850.00, 'PAYPAL', 'NotConfirmed', NULL),
(4, 3000.00, 'CASH', 'confirmed', 'ASFASDFEA'),
(5, 1000.00, 'CASH', 'NotConfirmed', NULL),
(6, 2500.00, 'MASTERCARD', 'confirmed', 'ASFASDFEA'),
(7, 3400.00, 'PAYPAL', 'confirmed', 'AKHGAJAD'),
(8, 3500.00, 'PAYPAL', 'confirmed', 'JGHFJDFE'),
(9, 500.00, 'MASTERCARD', 'NotConfirmed', NULL),
(10, 2540.00, 'VISA', 'confirmed', 'SRTRSGSR');

