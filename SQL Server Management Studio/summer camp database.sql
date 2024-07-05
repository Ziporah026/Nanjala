create DATABASE Summer
use Summer

CREATE TABLE Campers (
    camper_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    registration_date DATE
);

CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY IDENTITY(1,1),
    camper_id INT,
    registration_date DATE,
    payment_status VARCHAR(20),
    total_payment DECIMAL(10, 2),
    FOREIGN KEY (camper_id) REFERENCES Campers(camper_id)
);

CREATE TABLE Counselors (
    counselor_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE Bunks (
    bunk_id INT PRIMARY KEY IDENTITY(1,1),
    bunk_name VARCHAR(50),
    counselor_id INT,
    FOREIGN KEY (counselor_id) REFERENCES Counselors(counselor_id)
);

CREATE TABLE BunkAssignments (
    assignment_id INT PRIMARY KEY IDENTITY(1,1),
    camper_id INT,
    bunk_id INT,
    assigned_date DATE,
    FOREIGN KEY (camper_id) REFERENCES Campers(camper_id),
    FOREIGN KEY (bunk_id) REFERENCES Bunks(bunk_id)
);

CREATE TABLE Activities (
    activity_id INT PRIMARY KEY IDENTITY(1,1),
    activity_name VARCHAR(50)
);

CREATE TABLE CamperPreferences (
    preference_id INT PRIMARY KEY IDENTITY(1,1),
    camper_id INT,
    activity_id INT,
    preference_rank INT,
    FOREIGN KEY (camper_id) REFERENCES Campers(camper_id),
    FOREIGN KEY (activity_id) REFERENCES Activities(activity_id)
);

CREATE TABLE CounselorActivities (
    counselor_activity_id INT PRIMARY KEY IDENTITY(1,1),
    counselor_id INT,
    activity_id INT,
    supervision_rank INT,
    FOREIGN KEY (counselor_id) REFERENCES Counselors(counselor_id),
    FOREIGN KEY (activity_id) REFERENCES Activities(activity_id)
);
