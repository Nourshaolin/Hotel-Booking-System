CREATE DATABASE hotel_mgt_system;
USE hotel_mgt_system;

CREATE TABLE Guests(
	g_id INT,
    g_fname VARCHAR(30),
    g_lname VARCHAR(30),
    g_phone INT,
    g_email VARCHAR(50),
    PRIMARY KEY (g_id)
);

CREATE TABLE Rooms(
	r_num INT AUTO_INCREMENT,
    r_type ENUM('economic', 'luxurious', 'suite'),
    r_price_per_night  DECIMAL(6,2) CHECK (r_price_per_night IN (100.0, 200.0, 300.0)),
    r_status ENUM('Booked','Free'),
    PRIMARY KEY (r_num)
);

CREATE TABLE Bookings(
	b_id INT AUTO_INCREMENT,
	r_num INT,
    g_id INT,
    check_in DATE,
    check_out DATE,
    PRIMARY KEY (b_id),
    FOREIGN KEY (r_num) REFERENCES Rooms(r_num),
    FOREIGN KEY (g_id) REFERENCES Guests(g_id)
);

SHOW CREATE TABLE Bookings;
ALTER TABLE Bookings DROP FOREIGN KEY bookings_ibfk_2;
ALTER TABLE Guests MODIFY g_id INT AUTO_INCREMENT;

ALTER TABLE Bookings 
ADD CONSTRAINT fk_bookings_guests 
FOREIGN KEY (g_id) REFERENCES Guests(g_id);

SHOW CREATE TABLE Guests;

INSERT INTO Guests(g_fname, g_lname, g_phone, g_email) VALUES
	("Ahmed", "Moutassim", 0612343214, "user1@gmail.com"),
    ("Soumia", "Mansour", 0654385267, "user2@gmail.com"),
    ("Amina", "Yara", 0698684683, "user3@gmail.com"),
    ("Touria", "Bennani", 0698078098, "user4@gmail.com"),
    ("Khadija", "Yamal", 0612343212, "user5@gmail.com"),
    ("Tarek", "Tagnaout", 0645676545, "user6@gmail.com"),
    ("Youssef", "El Kaabi", 0656787656, "user7@gmail.com"),
    ("Tamer", "Benamar", 0609120912, "user8@gmail.com"),
    ("Loubna", "El Hakimi", 0629485673, "user9@gmail.com"),
    ("Chouaib", "Ait Mansour", 0611224534, "user10@gmail.com"),
    ("Mouhamed", "Noumani", 0676889943, "user11@gmail.com"),
    ("Ali", "El Achab", 0674829012, "user12@gmail.com");


INSERT INTO Rooms (r_type, r_price_per_night, r_status) VALUES
	('economic', 100.00, 'Free'),
	('economic', 100.00, 'Booked'),
	('economic', 100.00, 'Free'),
	('luxurious', 200.00, 'Free'),
	('luxurious', 200.00, 'Booked'),
	('luxurious', 200.00, 'Free'),
	('suite', 300.00, 'Free'),
	('suite', 300.00, 'Booked'),
	('suite', 300.00, 'Free'),
	('economic', 100.00, 'Free');

INSERT INTO Bookings (r_num, g_id, check_in, check_out) VALUES
	(2, 1, '2025-11-01', '2025-11-03'),
	(5, 2, '2025-11-02', '2025-11-05'),
	(8, 3, '2025-11-01', '2025-11-04'),
	(1, 4, '2025-11-10', '2025-11-12'),
	(4, 5, '2025-11-15', '2025-11-18'),
	(7, 6, '2025-11-20', '2025-11-25');

SELECT * FROM Bookings;
SELECT * FROM Guests;
SELECT * FROM Rooms;

