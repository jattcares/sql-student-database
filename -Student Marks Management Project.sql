-- Student Marks Management Project (SQL)
-- Author: Dhruv
-- Description: Simple student database with marks analysis

-- Step 1: Create Database & Tables
CREATE DATABASE school;
USE school;

CREATE TABLE student (
  Rollno INT PRIMARY KEY,
  Name CHAR(15),
  Gender CHAR(7),
  Email VARCHAR(50)
);

CREATE TABLE marks (
  Rollno INT,
  Subject CHAR(15),
  Marks FLOAT
);

-- Step 2: Insert Sample Data
INSERT INTO student VALUES (1,'dhruv','male','abc@gmail.com');
INSERT INTO marks VALUES (1,'english',90), (1,'maths',70), (1,'science',55), (1,'hindi',60);

INSERT INTO student VALUES (2,'sidharth','male','adc@gmail.com');
INSERT INTO marks VALUES (2,'english',65), (2,'maths',90), (2,'science',77), (2,'hindi',80);

INSERT INTO student VALUES (3,'teena','female','gfc@gmail.com');
INSERT INTO marks VALUES (3,'english',77), (3,'maths',100), (3,'science',55), (3,'hindi',85);

-- Step 3: Queries
-- 1. Join student and marks table
SELECT * FROM student, marks WHERE student.rollno = marks.rollno;

-- 2. Total marks per student
SELECT name, SUM(marks) FROM student, marks WHERE student.rollno = marks.rollno GROUP BY name;

-- 3. Average marks per student
SELECT name, AVG(marks) FROM student, marks WHERE student.rollno = marks.rollno GROUP BY name;

-- 4. Students with average marks > 75
SELECT name, AVG(marks)
FROM student, marks
WHERE student.rollno = marks.rollno
GROUP BY name
HAVING AVG(marks) > 75;