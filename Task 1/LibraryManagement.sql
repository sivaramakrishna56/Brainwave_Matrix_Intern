create database LibraryDB;
use LibraryDB;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    address TEXT,
    membership_type ENUM('Student', 'Faculty', 'Guest') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(100) NOT NULL,
    publisher VARCHAR(100),
    published_year INT,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    category VARCHAR(100),
    copies_available INT DEFAULT 1
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    book_id INT,
    loan_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    due_date DATE NOT NULL,
    return_date DATE NULL,
    status ENUM('Borrowed', 'Returned', 'Overdue') DEFAULT 'Borrowed',
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);

CREATE TABLE Reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    reservation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Completed', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


CREATE TABLE Fines (
    fine_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    loan_id INT,
    amount DECIMAL(5,2) NOT NULL,
    paid BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (loan_id) REFERENCES Loans(loan_id) ON DELETE CASCADE
);

-- Adding Users
INSERT INTO Users (name, email, phone, address, membership_type) 
VALUES 
('Siva', 'siva@example.com', '1234567890', '123 Main St', 'Student'),
('Ram', 'ram@example.com', '9876543210', '456 Elm St', 'Faculty'),
('John', 'john@example.com', '1122334455', '789 Oak St', 'Guest'),
('Priya', 'priya@example.com', '9988776655', '101 Maple St', 'Student'),
('Karan', 'karan@example.com', '7766554433', '202 Birch St', 'Faculty'),
('Meena', 'meena@example.com', '6655443322', '303 Cedar St', 'Guest'),
('Arjun', 'arjun@example.com', '5544332211', '404 Walnut St', 'Student'),
('Ravi', 'ravi@example.com', '4433221100', '505 Spruce St', 'Faculty'),
('Divya', 'divya@example.com', '3322110099', '606 Pine St', 'Guest'),
('Anil', 'anil@example.com', '2211009988', '707 Oakwood St', 'Student'),
('Neha', 'neha@example.com', '1100998877', '808 Redwood St', 'Faculty'),
('Vikram', 'vikram@example.com', '9988776654', '909 Cherry St', 'Guest'),
('Sonia', 'sonia@example.com', '8877665543', '1010 Ash St', 'Student'),
('Raj', 'raj@example.com', '7766554432', '1111 Hickory St', 'Faculty'),
('Pooja', 'pooja@example.com', '6655443321', '1212 Sycamore St', 'Guest'),
('Gopal', 'gopal@example.com', '5544332210', '1313 Magnolia St', 'Student'),
('Aditi', 'aditi@example.com', '4433221109', '1414 Willow St', 'Faculty'),
('Harish', 'harish@example.com', '3322110098', '1515 Chestnut St', 'Guest'),
('Manoj', 'manoj@example.com', '2211009977', '1616 Dogwood St', 'Student'),
('Sneha', 'sneha@example.com', '1100998866', '1717 Juniper St', 'Faculty'),
('Kishore', 'kishore@example.com', '9988776644', '1818 Poplar St', 'Guest'),
('Swathi', 'swathi@example.com', '8877665533', '1919 Beech St', 'Student'),
('Nitin', 'nitin@example.com', '7766554422', '2020 Aspen St', 'Faculty'),
('Bhavya', 'bhavya@example.com', '6655443311', '2121 Alder St', 'Guest'),
('Ajay', 'ajay@example.com', '5544332200', '2222 Elmwood St', 'Student'),
('Renu', 'renu@example.com', '4433221199', '2323 Fir St', 'Faculty'),
('Vishal', 'vishal@example.com', '3322110088', '2424 Maplewood St', 'Guest'),
('Lavanya', 'lavanya@example.com', '2211009966', '2525 Birchwood St', 'Student'),
('Sameer', 'sameer@example.com', '1100998855', '2626 Cedarwood St', 'Faculty'),
('Monica', 'monica@example.com', '9988776633', '2727 Oakwood St', 'Guest'),
('Suraj', 'suraj@example.com', '8877665522', '2828 Redwoodwood St', 'Student'),
('Anusha', 'anusha@example.com', '7766554411', '2929 Cherrywood St', 'Faculty'),
('Rajesh', 'rajesh@example.com', '6655443300', '3030 Hickorywood St', 'Guest'),
('Pallavi', 'pallavi@example.com', '5544332299', '3131 Sycamorewood St', 'Student'),
('Tarun', 'tarun@example.com', '4433221188', '3232 Magnoliawood St', 'Faculty');



-- Adding Books
INSERT INTO Books (title, author, publisher, published_year, isbn, category, copies_available) 
VALUES 
('The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 1925, '9780743273565', 'Fiction', 5),
('To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', 1960, '9780061120084', 'Fiction', 4),
('1984', 'George Orwell', 'Secker & Warburg', 1949, '9780451524935', 'Dystopian', 6),
('Moby-Dick', 'Herman Melville', 'Harper & Brothers', 1851, '9780142437247', 'Adventure', 3),
('Pride and Prejudice', 'Jane Austen', 'T. Egerton', 1813, '9780679783268', 'Romance', 7),
('The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 1951, '9780316769488', 'Fiction', 8),
('The Hobbit', 'J.R.R. Tolkien', 'Allen & Unwin', 1937, '9780345339683', 'Fantasy', 10),
('War and Peace', 'Leo Tolstoy', 'The Russian Messenger', 1869, '9780199232765', 'Historical', 2),
('Crime and Punishment', 'Fyodor Dostoevsky', 'The Russian Messenger', 1866, '9780486415871', 'Philosophical', 5),
('Brave New World', 'Aldous Huxley', 'Chatto & Windus', 1932, '9780060850524', 'Dystopian', 6),
('Les Misérables', 'Victor Hugo', 'A. Lacroix, Verboeckhoven & Cie', 1862, '9780451419439', 'Historical', 5),
('The Brothers Karamazov', 'Fyodor Dostoevsky', 'The Russian Messenger', 1880, '9780374528379', 'Philosophical', 4),
('Wuthering Heights', 'Emily Brontë', 'Thomas Cautley Newby', 1847, '9780486292564', 'Gothic', 6),
('Anna Karenina', 'Leo Tolstoy', 'The Russian Messenger', 1878, '9780143035008', 'Romance', 3),
('Dracula', 'Bram Stoker', 'Archibald Constable', 1897, '9780486454016', 'Horror', 7),
('Frankenstein', 'Mary Shelley', 'Lackington, Hughes, Harding, Mavor & Jones', 1818, '9780486282114', 'Science Fiction', 5),
('One Hundred Years of Solitude', 'Gabriel García Márquez', 'Harper & Row', 1967, '9780060883287', 'Magical Realism', 6),
('Fahrenheit 451', 'Ray Bradbury', 'Ballantine Books', 1953, '9781451673319', 'Dystopian', 5),
('Don Quixote', 'Miguel de Cervantes', 'Francisco de Robles', 1615, '9780060934347', 'Adventure', 3),
('The Count of Monte Cristo', 'Alexandre Dumas', 'Penguin Classics', 1844, '9780140449266', 'Adventure', 7),
('The Picture of Dorian Gray', 'Oscar Wilde', 'Ward, Lock & Co.', 1890, '9780141439570', 'Gothic', 5),
('The Grapes of Wrath', 'John Steinbeck', 'The Viking Press', 1939, '9780143039433', 'Historical', 4),
('A Tale of Two Cities', 'Charles Dickens', 'Chapman & Hall', 1859, '9780141439600', 'Historical', 6),
('The Old Man and the Sea', 'Ernest Hemingway', 'Charles Scribner’s Sons', 1952, '9780684801223', 'Fiction', 5),
('Of Mice and Men', 'John Steinbeck', 'Covici Friede', 1937, '9780140177398', 'Fiction', 8),
('Lolita', 'Vladimir Nabokov', 'Olympia Press', 1955, '9780679723165', 'Fiction', 3),
('Jane Eyre', 'Charlotte Brontë', 'Smith, Elder & Co.', 1847, '9780142437209', 'Romance', 7),
('The Road', 'Cormac McCarthy', 'Alfred A. Knopf', 2006, '9780307387899', 'Post-Apocalyptic', 6),
('The Sun Also Rises', 'Ernest Hemingway', 'Scribner', 1926, '9780743297332', 'Fiction', 4),
('The Alchemist', 'Paulo Coelho', 'HarperOne', 1988, '9780061122415', 'Philosophical', 7),
('Beloved', 'Toni Morrison', 'Alfred A. Knopf', 1987, '9781400033416', 'Historical', 5),
('Slaughterhouse-Five', 'Kurt Vonnegut', 'Delacorte Press', 1969, '9780385333849', 'Science Fiction', 4);


-- borrowing a book
INSERT INTO Loans (user_id, book_id, due_date) 
VALUES 
(1, 136, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(2, 137, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(3, 138, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(4, 139, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(5, 140, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(6, 141, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(7, 142, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(8, 143, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(9, 144, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(10, 145, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(11, 146, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(12, 147, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(13, 148, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(14, 149, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(15, 150, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(16, 151, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(17, 152, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(18, 153, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(19, 154, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(20, 155, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(21, 156, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(22, 157, DATE_ADD(CURDATE(), INTERVAL 14 DAY)), 
(23, 158, DATE_ADD(CURDATE(), INTERVAL 14 DAY));


-- returning a book with paying fine
-- returning a book
UPDATE Loans 
SET return_date = CURDATE(), status = 'Returned' 
WHERE loan_id = 10;

-- Update the Fines table to mark the fine as Paid
UPDATE Fines 
SET paid = TRUE
WHERE loan_id = 10;



-- checking for overdue books
SELECT * FROM Loans 
WHERE due_date < CURDATE() AND status = 'Borrowed';

-- checking fines
SELECT Users.name, Fines.amount, Fines.paid 
FROM Fines 
JOIN Users ON Users.user_id = Fines.user_id 
WHERE Fines.paid = TRUE;

-- Automatically apply fines for overdue books
DELIMITER //
CREATE TRIGGER after_loan_update
AFTER UPDATE ON Loans
FOR EACH ROW
BEGIN
    -- If loan is overdue and still borrowed, insert a fine
    IF NEW.due_date < CURDATE() AND NEW.status = 'Borrowed' THEN
        INSERT INTO Fines (user_id, loan_id, amount, paid) 
        VALUES (NEW.user_id, NEW.loan_id, 5.00, FALSE);
    END IF;

    -- If loan is returned, update fine as paid
    IF NEW.status = 'Returned' THEN
        UPDATE Fines 
        SET paid = TRUE, amount = 5.00 
        WHERE loan_id = NEW.loan_id;
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER after_book_return
AFTER UPDATE ON Loans
FOR EACH ROW
BEGIN
    IF NEW.status = 'Returned' THEN
        -- Find the first pending reservation for this book
        UPDATE Reservations 
        SET status = 'Completed' 
        WHERE book_id = NEW.book_id 
        AND status = 'Pending' 
        ORDER BY reservation_date ASC 
        LIMIT 1;
    END IF;
END;
//
DELIMITER ;


select * from books;
select * from fines;
select * from loans;
select * from reservations;
select * from users;


UPDATE Loans SET status='Borrowed' WHERE loan_id=7;

INSERT INTO Reservations (user_id, book_id) 
VALUES (3, 136);

SELECT Users.name, Reservations.reservation_date, Reservations.status 
FROM Reservations 
JOIN Users ON Reservations.user_id = Users.user_id
WHERE Reservations.book_id = 136
ORDER BY Reservations.reservation_date ASC;

INSERT INTO Loans (user_id, book_id, due_date)
SELECT user_id, book_id, DATE_ADD(CURDATE(), INTERVAL 14 DAY)
FROM Reservations
WHERE book_id = 136 AND status = 'Completed'
ORDER BY reservation_date ASC
LIMIT 1;

UPDATE Reservations 
SET status = 'Cancelled' 
WHERE reservation_id = 5;
