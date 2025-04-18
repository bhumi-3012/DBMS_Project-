create database dbms_queries;
use dbms_queries;
-- ---------------------------
-- TABLE CREATION QUERIES
-- ---------------------------

CREATE TABLE User (
  User_ID INT PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(100) UNIQUE,
  Password VARCHAR(100),
  Role ENUM('Student', 'Club Admin', 'Super Admin'),
  Username VARCHAR(50) UNIQUE,
  Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
describe user;

CREATE TABLE Club (
  Club_ID INT PRIMARY KEY,
  Name VARCHAR(100),
  Description TEXT,
  Created_Date DATE,
  Club_Admin_ID INT,
  FOREIGN KEY (Club_Admin_ID) REFERENCES User(User_ID)
);
describe club;

CREATE TABLE Club_Membership (
  Membership_ID INT PRIMARY KEY,
  User_ID INT,
  Club_ID INT,
  Role ENUM('President', 'Treasurer', 'Member'),
  Join_Date DATE,
  FOREIGN KEY (User_ID) REFERENCES User(User_ID),
  FOREIGN KEY (Club_ID) REFERENCES Club(Club_ID)
);
describe Club_Membership;

CREATE TABLE Event (
  Event_ID INT PRIMARY KEY,
  Name VARCHAR(100),
  Description TEXT,
  Date DATE,
  Created_at DATE,
  Club_ID INT,
  FOREIGN KEY (Club_ID) REFERENCES Club(Club_ID)
);
describe event;

CREATE TABLE Event_Registration (
  Registration_ID INT PRIMARY KEY,
  User_ID INT,
  Event_ID INT,
  Category VARCHAR(50),
  Full_Name VARCHAR(100),
  Email VARCHAR(100),
  Phone_Number BIGINT,
  Year VARCHAR(20),
  Registration_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (User_ID) REFERENCES User(User_ID),
  FOREIGN KEY (Event_ID) REFERENCES Event(Event_ID)
);
describe Event_Registration;

CREATE TABLE Announcement (
  Announcement_ID INT PRIMARY KEY,
  Title VARCHAR(100),
  Message TEXT,
  Club_ID INT,
  Importance VARCHAR(50),
  Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (Club_ID) REFERENCES Club(Club_ID)
);
describe Announcement;

CREATE TABLE Discussion (
  Discussion_ID INT PRIMARY KEY,
  Club_ID INT,
  User_ID INT,
  Topic TEXT,
  Date DATE,
  FOREIGN KEY (Club_ID) REFERENCES Club(Club_ID),
  FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);
describe Discussion;

CREATE TABLE Comment (
  Comment_ID INT PRIMARY KEY,
  Discussion_ID INT,
  User_ID INT,
  Content TEXT,
  Date DATE,
  FOREIGN KEY (Discussion_ID) REFERENCES Discussion(Discussion_ID),
  FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);
describe Comment;

CREATE TABLE Resource (
  Resource_ID INT PRIMARY KEY,
  Club_ID INT,
  Uploaded_By INT,
  Type ENUM('Document', 'Image', 'Video'),
  URL VARCHAR(255),
  Upload_Date DATE,
  FOREIGN KEY (Club_ID) REFERENCES Club(Club_ID),
  FOREIGN KEY (Uploaded_By) REFERENCES User(User_ID)
);
describe Resource;

CREATE TABLE Poll (
  Poll_ID INT PRIMARY KEY,
  Club_ID INT,
  Question TEXT,
  Created_Date DATE,
  FOREIGN KEY (Club_ID) REFERENCES Club(Club_ID)
);
describe  Poll ;

CREATE TABLE Volunteer_Opportunity (
  Opportunity_ID INT PRIMARY KEY,
  Club_ID INT,
  Title VARCHAR(100),
  Description TEXT,
  Application_Deadline DATE,
  FOREIGN KEY (Club_ID) REFERENCES Club(Club_ID)
);
describe Volunteer_Opportunity;

-- ---------------------------
-- SAMPLE DATA INSERTION
-- ---------------------------

-- Users
INSERT INTO User VALUES (1, 'Alice Sharma', 'alice@example.com', 'pass123', 'Student', 'alice_s', DEFAULT);
INSERT INTO User VALUES (2, 'Rahul Mehta', 'rahul@example.com', 'pass123', 'Club Admin', 'rahul_m', DEFAULT);
INSERT INTO User VALUES (3, 'Sneha Patel', 'sneha@example.com', 'pass123', 'Student', 'sneha_p', DEFAULT);
INSERT INTO User VALUES (4, 'Dev Jain', 'dev@example.com', 'pass123', 'Super Admin', 'dev_j', DEFAULT);
INSERT INTO User VALUES (5, 'Nisha Verma', 'nisha@example.com', 'pass123', 'Student', 'nisha_v', DEFAULT);

-- Clubs
INSERT INTO Club VALUES (1, 'Tech Club', 'Technology lovers community', '2023-06-01', 2);
INSERT INTO Club VALUES (2, 'Dance Club', 'For all dance enthusiasts', '2022-09-15', 2);
INSERT INTO Club VALUES (3, 'Music Club', 'Melody makers', '2023-01-20', 2);
INSERT INTO Club VALUES (4, 'Drama Club', 'Stage performances and plays', '2021-11-12', 4);
INSERT INTO Club VALUES (5, 'Photography Club', 'For photography lovers', '2023-05-10', 3);

-- Club Membership
INSERT INTO Club_Membership VALUES (1, 1, 1, 'Member', '2023-07-01');
INSERT INTO Club_Membership VALUES (2, 3, 1, 'Treasurer', '2023-07-01');
INSERT INTO Club_Membership VALUES (3, 5, 2, 'Member', '2023-08-01');
INSERT INTO Club_Membership VALUES (4, 2, 3, 'President', '2023-06-15');
INSERT INTO Club_Membership VALUES (5, 4, 2, 'Member', '2023-09-10');

-- Events
INSERT INTO Event VALUES (1, 'Tech Meetup', 'A meet for techies', '2024-04-30', '2024-04-10', 1);
INSERT INTO Event VALUES (2, 'Dance Night', 'Showcase your moves', '2024-05-01', '2024-04-15', 2);
INSERT INTO Event VALUES (3, 'Singing Showdown', 'Competition among singers', '2024-05-10', '2024-04-18', 3);
INSERT INTO Event VALUES (4, 'Drama Fest', 'Theatre performances', '2024-06-01', '2024-04-20', 4);
INSERT INTO Event VALUES (5, 'Photo Walk', 'Outdoor photography event', '2024-04-25', '2024-04-05', 5);

-- Event Registration
INSERT INTO Event_Registration VALUES (1, 1, 1, 'Technical', 'Alice Sharma', 'alice@example.com', 9876543210, '3rd Year', DEFAULT);
INSERT INTO Event_Registration VALUES (2, 3, 2, 'Cultural', 'Sneha Patel', 'sneha@example.com', 9876512312, '2nd Year', DEFAULT);
INSERT INTO Event_Registration VALUES (3, 5, 3, 'Music', 'Nisha Verma', 'nisha@example.com', 9876598765, '1st Year', DEFAULT);
INSERT INTO Event_Registration VALUES (4, 4, 4, 'Drama', 'Dev Jain', 'dev@example.com', 9876544321, 'Final Year', DEFAULT);
INSERT INTO Event_Registration VALUES (5, 2, 5, 'Photography', 'Rahul Mehta', 'rahul@example.com', 9876501234, '3rd Year', DEFAULT);

-- Announcements
INSERT INTO Announcement VALUES (1, 'Welcome!', 'Welcome to Tech Club!', 1, 'High', DEFAULT);
INSERT INTO Announcement VALUES (2, 'Dance Night Prep', 'Rehearsals from Monday', 2, 'Medium', DEFAULT);
INSERT INTO Announcement VALUES (3, 'Music Practice', 'Daily sessions in Hall A', 3, 'High', DEFAULT);
INSERT INTO Announcement VALUES (4, 'Drama Club', 'Auditions this Friday', 4, 'Low', DEFAULT);
INSERT INTO Announcement VALUES (5, 'Photography Workshop', 'Bring your DSLR', 5, 'Medium', DEFAULT);

-- Discussions
INSERT INTO Discussion VALUES (1, 1, 1, 'Best programming languages?', '2024-04-11');
INSERT INTO Discussion VALUES (2, 2, 3, 'Dance styles to perform', '2024-04-12');
INSERT INTO Discussion VALUES (3, 3, 5, 'Favorite genre of music', '2024-04-13');
INSERT INTO Discussion VALUES (4, 4, 4, 'Best stage setup ideas?', '2024-04-14');
INSERT INTO Discussion VALUES (5, 5, 2, 'Camera recommendations?', '2024-04-15');

-- Comments
INSERT INTO Comment VALUES (1, 1, 2, 'I love Python and JavaScript!', '2024-04-11');
INSERT INTO Comment VALUES (2, 2, 4, 'Try contemporary and hip-hop!', '2024-04-12');
INSERT INTO Comment VALUES (3, 3, 1, 'Bollywood songs hit different!', '2024-04-13');
INSERT INTO Comment VALUES (4, 4, 3, 'Use rotating stage lights!', '2024-04-14');
INSERT INTO Comment VALUES (5, 5, 5, 'Nikon Z50 is great!', '2024-04-15');

-- Resources
INSERT INTO Resource VALUES (1, 1, 1, 'Document', 'https://example.com/doc1.pdf', '2024-04-10');
INSERT INTO Resource VALUES (2, 2, 3, 'Image', 'https://example.com/image1.jpg', '2024-04-11');
INSERT INTO Resource VALUES (3, 3, 5, 'Video', 'https://example.com/video1.mp4', '2024-04-12');
INSERT INTO Resource VALUES (4, 4, 2, 'Document', 'https://example.com/doc2.pdf', '2024-04-13');
INSERT INTO Resource VALUES (5, 5, 4, 'Image', 'https://example.com/image2.jpg', '2024-04-14');

-- Polls
INSERT INTO Poll VALUES (1, 1, 'Which tech stack do you prefer?', '2024-04-11');
INSERT INTO Poll VALUES (2, 2, 'Which dance form is best?', '2024-04-12');
INSERT INTO Poll VALUES (3, 3, 'Should we have a music battle?', '2024-04-13');
INSERT INTO Poll VALUES (4, 4, 'Play ideas for fest?', '2024-04-14');
INSERT INTO Poll VALUES (5, 5, 'Do you want a new camera workshop?', '2024-04-15');

-- Volunteer Opportunities
INSERT INTO Volunteer_Opportunity VALUES (1, 1, 'Tech Booth Setup', 'Help set up tech booth', '2024-04-25');
INSERT INTO Volunteer_Opportunity VALUES (2, 2, 'Dance Coordination', 'Coordinate dance teams', '2024-04-20');
INSERT INTO Volunteer_Opportunity VALUES (3, 3, 'Music Equipment', 'Manage sound equipment', '2024-04-22');
INSERT INTO Volunteer_Opportunity VALUES (4, 4, 'Stage Management', 'Assist in drama fest', '2024-04-30');
INSERT INTO Volunteer_Opportunity VALUES (5, 5, 'Photography Coverage', 'Capture event photos', '2024-04-21');


SELECT Role, COUNT(*) AS TotalUsers
FROM User
GROUP BY Role;

SELECT Role, DATE(Created_at) AS CreatedDate, COUNT(*) AS UsersPerDay
FROM User
GROUP BY Role, DATE(Created_at);

SELECT *
FROM User
WHERE User_ID IN (
    SELECT Club_Admin_ID
    FROM Club
);

CREATE VIEW View_User_Roles AS
SELECT User_ID, Name, Role
FROM User;

CREATE VIEW View_User_Roles AS
SELECT User_ID, Name, Role
FROM User;

SELECT *FROM User ORDER BY Created_at DESC;
SELECT u.Name, c.Name AS ClubName FROM User u INNER JOIN Club c ON u.User_ID = c.Club_Admin_ID;
SELECT u.Name, c.Name AS ClubName FROM User u LEFT JOIN Club c ON u.User_ID = c.Club_Admin_ID;
SELECT u.Name, c.Name AS ClubName FROM User u RIGHT JOIN Club c ON u.User_ID = c.Club_Admin_ID;
SELECT u.Name, c.Name AS ClubName FROM User u LEFT JOIN Club c ON u.User_ID = c.Club_Admin_ID UNION SELECT u.Name, c.Name AS ClubName FROM User u RIGHT JOIN Club c ON u.User_ID = c.Club_Admin_ID;
SELECT u.Name, c.Name AS ClubName FROM User u CROSS JOIN Club c;
SELECT YEAR(Created_Date) AS Year, COUNT(*) AS TotalClubs FROM Club GROUP BY YEAR(Created_Date);
SELECT Club_Admin_ID, COUNT(*) AS ClubCount FROM Club GROUP BY Club_Admin_ID;
SELECT * FROM Club WHERE YEAR(Created_Date) > (     SELECT AVG(YEAR(Created_Date)) FROM Club);
CREATE VIEW View_Club_Admins AS SELECT c.Club_ID, c.Name AS ClubName, u.Name AS AdminName FROM Club c JOIN User u ON c.Club_Admin_ID = u.User_ID;
CREATE VIEW View_Club_Admins AS SELECT c.Club_ID, c.Name AS ClubName, u.Name AS AdminName FROM Club c JOIN User u ON c.Club_Admin_ID = u.User_ID;
SELECT *FROM Club ORDER BY Created_Date DESC;
SELECT c.Name AS ClubName, u.Name AS AdminName FROM Club c INNER JOIN User u ON c.Club_Admin_ID = u.User_ID;
SELECT c.Name AS lubName, u.Name AS AdminName FROM Club c LEFT JOIN User u ON c.Club_Admin_ID = u.User_ID;
SELECT u.Name  AS AdminName, c.Name AS ClubName FROM Club cRIGHT JOIN User u ON c.Club_Admin_ID = u.User_ID;
SELECT c.Name AS ClubName, u.Name AS  AdminName FROM Club c LEFT JOIN User u ON c.Club_Admin_ID = u.User_ID UNION SELECT c.Name AS ClubName, u.Name AS AdminName FROM Club c RIGHT JOIN User u ON c.Club_Admin_ID = u.User_ID;
SELECT c.Name AS ClubName, u.Name AS  UserName FROM Club c CROSS JOIN User u;
SELECT Role, COUNT(*) AS TotalMembers FROM Club_Membership GROUP BY Role;
SELECT Club_name, COUNT(*) AS MemberCount FROM Club_Membership GROUP BY Club_name;
SELECT Role, COUNT(*) AS TotalMembers 
FROM Club_Membership 
GROUP BY Role;

SELECT Club_name, COUNT(*) AS MemberCount 
FROM Club_Membership 
GROUP BY Club_name;
SELECT User_ID 
FROM Club_Membership 
WHERE Role = 'President';
SELECT Club_name, COUNT(*) AS MemberCount 
FROM Club_Membership 
GROUP BY Club_name;
SELECT Club_name 
FROM Club_Membership 
GROUP BY Club_name 
HAVING COUNT(*) = ( 
  SELECT MAX(member_count) 
  FROM ( 
    SELECT COUNT(*) AS member_count 
    FROM Club_Membership 
    GROUP BY Club_name 
  ) AS sub
);
CREATE VIEW View_ClubMembers AS 
SELECT cm.Membership_ID, u.Name AS MemberName, cm.Club_name, cm.Role 
FROM Club_Membership cm 
JOIN User u ON cm.User_ID = u.User_ID;
SELECT * 
FROM Club_Membership 
ORDER BY Join_Date DESC;
SELECT * 
FROM Club_Membership 
ORDER BY Club_name ASC, Role ASC;
SELECT u.Name AS MemberName, cm.Club_name, cm.Role 
FROM Club_Membership cm 
INNER JOIN User u ON cm.User_ID = u.User_ID;


SELECT u.Name AS UserName, cm.Club_name 
FROM User u 
CROSS JOIN Club_Membership cm;
SELECT cm.Club_name, u.Name AS UserName 
FROM Club_Membership cm 
LEFT JOIN User u ON cm.User_ID = u.User_ID 
UNION 
SELECT cm.Club_name, u.Name AS UserName 
FROM Club_Membership cm 
RIGHT JOIN User u ON cm.User_ID = u.User_ID;

