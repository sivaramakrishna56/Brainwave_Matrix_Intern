
# Library Management System
This Library Management System (LMS) enables libraries to manage users, books, loans, reservations, and fines efficiently. It allows users to borrow, return, and reserve books while handling overdue fines automatically using SQL triggers.
# Features
User Management (Students, Faculty, Guests)
Book Management (Add, View, and Update Books)
Loan Management (Borrow & Return Books)
Reservation System (Reserve Books for Future Borrowing)
Fine Calculation (Automatic Fine on Overdue Books)
# Workflow
# User Registration
New users are added to the Users table with their name, email, phone, address, and membership type.
Each user is assigned a unique user_id.
# Adding Books to the Library
Books are added to the Books table with title, author, publisher, published year, ISBN, category, and copies available.
Each book is assigned a unique book_id.
# Borrowing a Book
A user borrows a book, and a record is inserted into the Loans table with:
user_id, book_id, loan_date, due_date (default 14 days from borrowing).
status = 'Borrowed'.
The copies available count decreases.
# Returning a Book
When a book is returned:
The Loans table is updated with return_date and status = 'Returned'.
If overdue, a fine is applied.
If there is a pending reservation, the first user in the queue gets priority.
# Fine Calculation for Overdue Books
A trigger checks if due_date has passed, and if status = 'Borrowed', a fine is inserted into the Fines table.
When the book is returned, the fine is marked as Paid.
# Reserving a Book
If a book is already borrowed, a user can reserve it in the Reservations table.
When the book is returned, the first user in the queue automatically gets access to borrow it.
# Checking Overdue Books & Fines
Overdue books can be found using:

SELECT * FROM Loans WHERE due_date < CURDATE() AND status = 'Borrowed';

Unpaid fines can be viewed with:

SELECT Users.name, Fines.amount, Fines.paid 
FROM Fines 
JOIN Users ON Users.user_id = Fines.user_id 
WHERE Fines.paid = FALSE;

# Database Schema

# Users Table
| user_id ||  name ||  email || phone || address || membership_type  ||created_at |

# Books Table
| book_id ||  title ||	author || publisher || published_year || isbn  || category || copies_available |

# Loans Table
|  loan_id  ||  user_id  ||  book_id  ||  loan_date  ||  due_date  || return_date || status |
							
# Reservations Table
|  reservation_id  ||  user_id  ||  book_id  ||  reservation_date  ||  status |

# Fines Table
|  fine_id  ||  user_id  ||  loan_id  ||  amount  ||  paid  |

