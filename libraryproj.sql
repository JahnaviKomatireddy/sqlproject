DROP DATABASE librarydb;
CREATE DATABASE librarydb;
USE librarydb;
CREATE TABLE Student (
studentId INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    joinDate DATE
    );
CREATE TABLE Books (
    bookId INT PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    category VARCHAR(100),
    price INT
);
CREATE TABLE IssuedBooks (
    issueId INT PRIMARY KEY,
    studentId INT,
    bookId INT,
    issueDate DATE,
    returnDate DATE,
    fineamount DECIMAL(6,2),
    FOREIGN KEY (studentId) REFERENCES Student(studentId),
    FOREIGN KEY (bookId) REFERENCES Books(bookId)
);
INSERT INTO Student VALUES (101, 'Jahnavi', 'CSE', '2022-06-10');
INSERT INTO Student VALUES (102, 'Sharanya', 'ECE', '2022-06-15');
INSERT INTO Student VALUES (103, 'Sneha', 'IT', '2022-07-12');
INSERT INTO Student VALUES (104, 'Akash', 'CSE', '2022-07-19');
INSERT INTO Student VALUES (105, 'Shravani', 'CSE', '2022-06-25');
INSERT INTO Student VALUES (106, 'Nithin', 'AIML', '2022-07-05');
INSERT INTO Student VALUES (107, 'Abhijeeth', 'IT', '2022-06-18');
INSERT INTO Student VALUES (108, 'Varsha', 'CSE', '2022-06-30');
INSERT INTO Student VALUES (109, 'Preethi', 'ECE', '2022-07-01');
INSERT INTO Student VALUES (110, 'Uday', 'AIML', '2022-07-22');
INSERT INTO Books VALUES (1, 'It Ends With Us', 'Colleen Hoover', 'Romance', 399);
INSERT INTO Books VALUES (3, 'Atomic Habits', 'James Clear', 'Personality Developmet', 500);
INSERT INTO Books VALUES (7, 'Ikigai', 'Hector Garcia', 'Personality Development', 300);
INSERT INTO Books VALUES (2, 'The Palace of Illusions', 'Chitra Banerjee Divakaruni', 'Mythology', 450);
INSERT INTO Books VALUES (4, 'The Forest of Enchantments', 'Chitra Banerjee Divakaruni', 'Mythology', 480);
INSERT INTO Books VALUES (5, 'The Alchemist', 'Paulo Coelho', 'Fiction', 380);
INSERT INTO Books VALUES (6, 'To Kill a Mockingbird', 'Harper Lee', 'Classic', 400);
INSERT INTO Books VALUES (8, 'Wings of Fire', 'A.P.J Abdul Kalam', 'Biography', 450);
INSERT INTO Books VALUES (9, 'Malgudi Days', 'R.K. Narayan', 'Fiction', 300);
INSERT INTO Books VALUES (10, 'The Fault in Our Stars', 'John Green', 'Romance', 350);
INSERT INTO IssuedBooks VALUES (1, 101, 1, '2026-02-01', '2026-02-10', 0);
ALTER TABLE IssuedBooks MODIFY fineamount INT;
INSERT INTO IssuedBooks VALUES (2, 102, 2, '2026-02-05', NULL, 0);
INSERT INTO IssuedBooks VALUES (4, 104, 4, '2026-02-10', NULL, 0);
INSERT INTO IssuedBooks VALUES (6, 106, 6, '2026-03-05', NULL, 0);
INSERT INTO IssuedBooks VALUES (3, 103, 3, '2026-02-12', '2026-02-20', 0);
INSERT INTO IssuedBooks VALUES (5, 105, 5, '2026-03-01', '2026-03-08', 0);
INSERT INTO IssuedBooks VALUES (7, 107, 7, '2026-03-08', '2026-03-15', 0);
INSERT INTO IssuedBooks VALUES (8, 108, 8, '2026-02-15', NULL, 0);
INSERT INTO IssuedBooks VALUES (10, 110, 10, '2026-02-20', NULL, 0);
INSERT INTO IssuedBooks VALUES (9, 109, 9, '2026-03-10', '2026-03-18', 0);
SELECT s.name, b.title, i.issueDate FROM IssuedBooks i
JOIN Student s ON i.studentId = s.studentId
JOIN Books b ON i.bookId = b.bookId
WHERE i.returnDate IS NULL AND DATEDIFF(CURDATE(), i.issueDate) > 14;
SELECT b.category, COUNT(*) AS total_borrowed FROM IssuedBooks i
JOIN Books b ON i.bookId = b.bookId
GROUP BY b.category
ORDER BY total_borrowed DESC;

