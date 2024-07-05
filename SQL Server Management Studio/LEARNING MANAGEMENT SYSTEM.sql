CREATE DATABASE lms;

USE lms;

CREATE TABLE Students (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL CHECK (role IN ('student', 'instructor', 'admin'))
);


CREATE TABLE Courses (
    course_id INT IDENTITY(1,1) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    instructor_id INT,
   
);

CREATE TABLE Enrollments (
    enrollment_id INT IDENTITY(1,1) PRIMARY KEY,
    course_id INT,
    student_id INT,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
    
);

CREATE TABLE Modules (
    module_id INT IDENTITY(1,1) PRIMARY KEY,
    course_id INT,
    title VARCHAR(100) NOT NULL,
    content TEXT,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Assessments (
    assessment_id INT IDENTITY(1,1) PRIMARY KEY,
    course_id INT,
    title VARCHAR(100) NOT NULL,
    type VARCHAR(10) NOT NULL CHECK (type IN ('quiz', 'assignment')),
    content TEXT,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


CREATE TABLE Submissions (
    submission_id INT IDENTITY(1,1) PRIMARY KEY,
    assessment_id INT,
    student_id INT,
    content TEXT,
    grade DECIMAL(5, 2),
    FOREIGN KEY (assessment_id) REFERENCES Assessments(assessment_id),
    FOREIGN KEY (student_id) REFERENCES Students(user_id)
);

CREATE TABLE Progress (
    progress_id INT IDENTITY(1,1) PRIMARY KEY,
    course_id INT,
    student_id INT,
    module_id INT,
    status VARCHAR(20) NOT NULL CHECK (status IN ('completed', 'in-progress')),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id),
    FOREIGN KEY (student_id) REFERENCES Students(user_id),
    FOREIGN KEY (module_id) REFERENCES Modules(module_id)
);


INSERT INTO Students (username, password, email, role) VALUES
('john_doe', 'password123', 'john.doe@example.com', 'student'),
('jane_smith', 'securePass!45', 'jane.smith@example.com', 'instructor'),
('alice_wonder', 'aliceSecret12', 'alice.wonder@example.com', 'student'),
('bob_brown', 'pass@word456', 'bob.brown@example.com', 'admin'),
('carol_white', 'whiteCarol!78', 'carol.white@example.com', 'instructor');


INSERT INTO Courses (title, description, instructor_id)
VALUES
    ('Introduction to Programming', 'Learn the basics of programming using Python.', 1),
    ('Advanced Mathematics', 'An in-depth study of calculus and linear algebra.', 2),
    ('Physics 101', 'Fundamentals of mechanics, waves, and thermodynamics.', 3),
    ('History of Art', 'Explore the history of art from the Renaissance to modern times.', 4),
    ('Business Management', 'Principles and practices of business management.', 5);


	INSERT INTO Enrollments (course_id, student_id) VALUES 
	(1, 101),
    (2, 102),
    (3, 103),
    (4, 104),
    (5, 105);


INSERT INTO Modules (course_id, title, content) VALUES
(1, 'Introduction to Programming', 'This module covers the basics of programming, including syntax, variables, and control structures.'),
(1, 'Data Structures', 'In this module, students will learn about arrays, linked lists, stacks, queues, and trees.'),
(2, 'Database Design', 'This module introduces database concepts, including relational models, normalization, and SQL.'),
(3, 'Web Development', 'Students will learn about HTML, CSS, JavaScript, and how to build dynamic websites.'),
(2, 'Advanced SQL', 'This module covers advanced SQL topics such as joins, subqueries, and optimization techniques.');


INSERT INTO Assessments (course_id, title, type, content) VALUES
(1, 'Quiz 1', 'quiz', 'This quiz covers chapters 1-3.'),
(2, 'Assignment 1', 'assignment', 'Write a 2-page essay on the impact of technology on society.'),
(1, 'Quiz 2', 'quiz', 'This quiz covers chapters 4-6.'),
(3, 'Assignment 2', 'assignment', 'Create a presentation on renewable energy sources.'),
(2, 'Quiz 3', 'quiz', 'This quiz covers chapters 7-9.');

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;
SELECT * FROM Modules;
SELECT * FROM Assessments;
SELECT * FROM Submissions;
SELECT * FROM Progress;