-- Run this script to set up your MySQL database

-- Create database
CREATE DATABASE IF NOT EXISTS nmims_clubs;
show databases;
-- Use the database
USE nmims_clubs;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

use college_club;
show tables;
select * from events;
select * from event_registrations;
select * from club_memberships;
select * from clubs;
select * from announcements;
desc announcements;
select * from users;

-- You can add additional tables as needed for clubs, events, etc.


CREATE DATABASE IF NOT EXISTS college_club;
use college_club;