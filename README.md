📚 Library Management System
🛠️ Overview
This Library Management System (LMS) enables libraries to manage users, books, loans, reservations, and fines efficiently. The system allows users to borrow, return, reserve books, and handle overdue fines automatically through triggers.

🚀 Features
User Management (Students, Faculty, Guests)
Book Management (Add, View, and Update Books)
Loan Management (Borrow & Return Books)
Reservation System (Reserve Books for Future Borrowing)
Fine Calculation (Automatic Fine on Overdue Books)
📌 Workflow
1️⃣ User Registration
New users are added to the Users table with their name, email, phone, address, and membership type.
Each user is assigned a unique user_id.
2️⃣ Adding Books to the Library
New books are added to the Books table with details like title, author, publisher, published year, ISBN, category, and copies available.
Each book is assigned a unique book_id.
3️⃣ Borrowing a Book
A user borrows a book, and a record is inserted into the Loans table with:
user_id, book_id, loan_date, due_date (default 14 days from borrowing).
status = 'Borrowed'.
If the book is borrowed, the copies available count decreases.
4️⃣ Returning a Book
When a user returns a book:
The Loans table is updated with return_date and status = 'Returned'.
If overdue, a fine is applied.
If there is a pending reservation for the book, the first user in the queue gets priority.
5️⃣ Fine Calculation for Overdue Books
A trigger checks if the due_date has passed, and if status = 'Borrowed', a fine is inserted into the Fines table.
If a book is returned, the fine is marked as Paid.
6️⃣ Reserving a Book
If a book is already borrowed, a user can reserve it in the Reservations table.
When the book is returned, the first user in the queue automatically gets access to borrow it.
7️⃣ Checking Overdue Books & Fines
