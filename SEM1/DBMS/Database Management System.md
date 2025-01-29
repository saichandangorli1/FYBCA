# FYBCA Database Management System Notes

## Unit 1: Database Management System

- **Drawbacks of using files:** Data redundancy, inconsistency, data isolation, integrity problems, security issues, concurrency control problems, and difficulty in accessing data.
- **Purpose of database systems:** To organize, store, and manage data efficiently, providing data integrity, security, and concurrency control. To minimize redundancy and inconsistency.
- **DBMS Definition:** Software that allows users to define, create, maintain, and control access to a database.
- **Comparison of File Processing vs. DBMS:**

| Feature          | File Processing       | DBMS               |
| ---------------- | --------------------- | ------------------ |
| Data Redundancy  | High                  | Low                |
| Data Consistency | Low                   | High               |
| Data Integrity   | Difficult to enforce  | Easier to enforce  |
| Security         | Low                   | High               |
| Concurrency      | Difficult             | Easier             |
| Data Access      | Difficult and complex | Easier and simpler |

- **Limitations of File Processing:** Same as drawbacks.
- **Advantages of DBMS:** Data integrity, data consistency, improved data sharing, data security, data independence, efficient data access, and application development.
- **Disadvantages of DBMS:** Cost of software and hardware, complexity, database failure can affect all applications, and potential performance overhead.
- **Users of DBMS:** Database administrators (DBA), application programmers, end-users.
- **Overall System Structure:** Users interact with the DBMS through applications. The DBMS interacts with the database, which is stored on storage devices. Includes components like query processor, storage manager, etc.

## Unit 2: Entity-Relationship Model (ER Model)

- **Entities and Entity Sets:** Entity: A real-world object (e.g., student, book). Entity Set: A collection of similar entities (e.g., all students).
- **Relationships and Relationship Sets:** Relationship: An association between entities (e.g., a student enrolls in a course). Relationship Set: A collection of similar relationships.
- **Attributes:** Properties of entities or relationships (e.g., student's name, course's title).
- **Mapping Cardinalities:** Specify the number of entities one entity can be associated with in a relationship. One-to-one, one-to-many, many-to-one, many-to-many.
- **ER Diagram:** A visual representation of the ER model, showing entities, attributes, and relationships.
- **Case Studies:** Designing ER diagrams for various scenarios (e.g., library management, hospital management).

## Unit 3: Relational Model

- **Structure of Relational Database:** Data is organized into tables (relations) with rows (tuples) and columns (attributes).
- **Terms:**
  - Relation: A table.
  - Tuple: A row in a table.
  - Attribute: A column in a table.
  - Cardinality: Number of tuples (rows).
- **Keys:**
  - Super Key: Any combination of attributes that can uniquely identify a tuple.
  - Candidate Key: A minimal super key (no redundant attributes).
  - Primary Key: The chosen candidate key to uniquely identify tuples.
  - Foreign Key: An attribute in one table that references the primary key of another table.
- **ER to Relational Model Conversion:** Entities become tables, attributes become columns, and relationships are implemented using foreign keys.
- **Relational Schema to 3NF:** Normalization process to reduce redundancy and improve data integrity. 3NF is a level of normalization.
- **Case Studies:** Converting ER diagrams to relational schemas and normalizing them.

## Unit 4: Relational Database Design

- **Pitfalls in Relational Database:** Redundancy, update anomalies (insertion, deletion, modification), and data inconsistency.
- **Functional Dependencies (FD):** A relationship between attributes. X -> Y means X determines Y.
- **Closure of Functional Dependencies (F+):** The set of all FDs that can be derived from a given set of FDs.
- **Closure of an Attribute Set:** The set of attributes that are functionally determined by a given set of attributes.
- **Primary Key Derivation Algorithm:** Using FDs to find candidate keys and choose a primary key.
- **Decomposition:** Breaking down a table into smaller tables to reduce redundancy.
- **Desirable Properties of Decomposition:** Lossless-join and dependency preservation.
- **Normalization:** A process of organizing data to reduce redundancy and improve data integrity.
- **Normal Forms:**
  - 1NF: All attributes are atomic (indivisible).
  - 2NF: 1NF and no non-prime attribute is dependent on part of a candidate key.
  - 3NF: 2NF and no non-prime attribute is transitively dependent on the primary key.

## Unit 5: SQL (Structured Query Language)

- **Introduction and History:** SQL is a standard language for interacting with relational databases.
- **Basic Structure:** `SELECT... FROM... WHERE...`
- **Classification of SQL Statements:**

  - DDL (Data Definition Language): `CREATE`, `DROP`, `ALTER`.
  - DML (Data Manipulation Language): `INSERT`, `UPDATE`, `DELETE`, `SELECT`.
  - DCL (Data Control Language): `GRANT`, `REVOKE`.

- **DDL Commands:**

  - `CREATE`: Creates database objects (tables, views, etc.).

  ```sql
  CREATE TABLE Students (
      StudentID INT PRIMARY KEY,
      Name VARCHAR(255),
      Age INT,
      City VARCHAR(255)
  );
  ```

  - `DROP`: Deletes database objects.

  ```sql
  DROP TABLE Students;
  ```

  - `ALTER`: Modifies database objects.

  ```sql
  ALTER TABLE Students ADD COLUMN Major VARCHAR(255); -- Add a column
  ```

- **Data Types and Constraints:**

  - Data Types: `INT`, `VARCHAR`, `DATE`, etc.
  - Constraints: `PRIMARY KEY`, `NOT NULL`, `UNIQUE`, `CHECK`, `FOREIGN KEY`, `DEFAULT`.

- **DML Commands:**
  - `INSERT`: Adds new tuples to a table.
  ```sql
  INSERT INTO Students (StudentID, Name, City) VALUES (1, 'Alice', 'New York');
  ```
  - `UPDATE`: Modifies existing tuples.
  ```sql
  UPDATE Students SET City = 'London' WHERE StudentID = 1;
  ```
  - `DELETE`: Removes tuples.
  ```sql
  DELETE FROM Students WHERE StudentID = 1;
  ```
  - `SELECT`: Retrieves data from tables.
  ```sql
  SELECT * FROM Students; -- Select all columns and rows
  SELECT Name, City FROM Students; -- Select specific columns
  SELECT * FROM Students WHERE Age > 20; -- Select rows based on a condition
  ```
  - `DISTINCT` Keyword: Eliminates duplicate rows.
  ```sql
  SELECT DISTINCT City FROM Students; -- Select unique cities
  ```
  - Operators: `IN`, `NOT IN`, `BETWEEN`, `LIKE`.
  ```sql
  SELECT * FROM Students WHERE City IN ('New York', 'London'); -- IN operator
  SELECT * FROM Students WHERE Age BETWEEN 20 AND 25; -- BETWEEN operator
  SELECT * FROM Students WHERE Name LIKE 'A%'; -- LIKE operator (starts with 'A')
  ```
  - Built-in Functions: String functions (`UPPER`, `LOWER`, `SUBSTRING`), numeric functions (`AVG`, `SUM`, `MAX`, `MIN`), date and time functions (`NOW`, `DATE`, `MONTH`).
  ```sql
  SELECT UPPER(Name) FROM Students; -- String function (uppercase)
  SELECT AVG(Age) FROM Students; -- Numeric function (average age)
  SELECT DATE('now'); -- Date function (current date)
  ```

## Unit 6: Advanced Queries using SQL

- **Aggregate Functions:** `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`.
  ```sql
  SELECT COUNT(*) FROM Students; -- Count all students
  SELECT SUM(Age) FROM Students; -- Sum of ages
  SELECT MAX(Age) FROM Students; -- Maximum age
  ```
- **Set Operations:** `UNION`, `INTERSECT`, `MINUS`.
  ```sql
  -- Assuming you have a table 'Graduates' with similar structure
  SELECT Name FROM Students UNION SELECT Name FROM Graduates; -- Combine results (remove duplicates)
  SELECT Name FROM Students INTERSECT SELECT Name FROM Graduates; -- Common names
  SELECT Name FROM Students EXCEPT SELECT Name FROM Graduates; -- Names in Students but not Graduates
  ```
- **`ORDER BY` Clause:** Sorts the result set.
  ```sql
  SELECT * FROM Students ORDER BY Age ASC; -- Ascending order (default)
  SELECT * FROM Students ORDER BY Age DESC; -- Descending order
  ```
- **`GROUP BY` Clause:** Groups rows based on one or more columns.
  ```sql
  SELECT City, COUNT(*) AS NumberOfStudents FROM Students GROUP BY City; -- Group by city and count students
  ```
- **`HAVING` Clause:** Filters groups.

  ```sql
  SELECT City, COUNT(*) AS NumberOfStudents FROM Students GROUP BY City HAVING COUNT(*) > 1; --
  ```

- **Joins:**:

1.  Inner Join: Returns rows where the join condition is met in both tables.

2.  Outer Joins: Return all rows from one table and matching rows from the other table (Left, Right, Full).
    SQL

```sql
SELECT Students.Name, Courses.CourseName
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID; -- Inner join
Nested Queries: Queries within other queries.
SQL
```

```sql
SELECT Name FROM Students WHERE Age IN (SELECT MAX(Age) FROM Students GROUP BY City); -- Students with maximum age in each city
Case Studies: Complex SQL queries involving joins, subqueries, and aggregate functions.*    Joins:
Inner Join: Returns rows where the join condition is met in both tables.
Outer Joins: Return all rows from one table and matching rows from the other table (Left, Right, Full).
SQL
```

```sql
SELECT Students.Name, Courses.CourseName
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID; -- Inner join
Nested Queries: Queries within other queries.
SQL
```

```sql
SELECT Name FROM Students WHERE Age IN (SELECT MAX(Age) FROM Students GROUP BY City); -- Students with maximum age in each city
```

- **Case Studies:** Complex SQL queries involving joins, subqueries, and aggregate functions.
