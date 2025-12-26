went some more information then contect contains "9740227692" AND "kumarmaruthi.ind@gmail.com"
#### you want ""OUTPUT"" then go ""DOWN"" side ###


Library Management System (Java + MySQL)

A complete Library Management System built using Java (Swing UI) and MySQL for backend database. This system supports Admin and User roles and provides functionalities like managing books, students, staff, issue/return operations, and more.

🚀 Features

Admin/User Login

Add/Edit/Delete/View Books

Add/Edit/Delete/View Students and Staff

Issue and Return Books

Fine Calculation

Search Books and Users

Dashboard Overview

Reports (Issued Books, Returned Books)

🛠️ Tech Stack

Frontend: Java Swing

Backend: Java Servlets (optional)

Database: MySQL

IDE: Eclipse/IntelliJ IDEA

Build Tool: Manual compilation or Ant/Maven (optional)

📁 Project Structure

Library-Management-System/
├── src/
│   ├── dao/              # Data Access Object classes
│   ├── model/            # Book, User, Borrow, etc.
│   ├── ui/               # UI Forms and Swing Components
│   └── main/             # Main class to start the app
├── lib/                  # External JARs (like mysql-connector)
├── assets/               # Logo/icons/images (optional)
└── sql/
    └── library.sql       # Database schema & sample data

🧑‍💻 How to Run (Step-by-Step)

🔹 1. Prerequisites

Java JDK 8 or higher

MySQL Server installed

Eclipse IDE (recommended)

🔹 2. Setup MySQL Database

Open MySQL Workbench or Command Line Interface.

Run the SQL script from sql/library.sql:

CREATE DATABASE library;
USE library;
-- Add tables: books, users, borrowings, etc.
-- Insert sample data

(Optional) Create a database user:

CREATE USER 'lms_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON library.* TO 'lms_user'@'localhost';
FLUSH PRIVILEGES;

🔹 3. Configure Database in Java

Update your DBConnection.java inside dao/ folder:

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/library";
    private static final String USER = "lms_user";
    private static final String PASSWORD = "password";
    // ... Connection logic
}

🔹 4. Add MySQL JDBC Connector

Download mysql-connector-java-X.X.X.jar

Move it to the lib/ folder in your project.

In Eclipse:

Right-click the project > Build Path > Configure Build Path

Click Add External JARs and select the JDBC JAR

Click Apply and Close

🔹 5. Run the Project in Eclipse

Open Eclipse and go to File > Import > Existing Projects into Workspace

Select the root folder of your project

Navigate to main/Main.java

Right-click Main.java > Run As > Java Application

🔹 6. Use the Application

Login using default Admin credentials (if provided in DB)

Use the UI to manage books, users, and borrowing operations

📦 Deployment (Optional - Servlet-based version)

Export the project as a WAR file:

Right-click project > Export > Web > WAR File

Deploy the WAR file to Apache Tomcat's webapps/ directory

Start the Tomcat server

Open browser: http://localhost:8080/LibrarySystem

✅ To Do / Enhancements

User Role Authorization

Search Suggestions

Export Reports (PDF/Excel)

Fine Payment Integration

Responsive UI

🙌 Author

Developed by: K Maruthi Valmiki

GitHub: kumarmaruthi

📝 License

This project is open-source and free to use for learning and educational purposes.

### OUTPUT

<img width="1366" height="624" alt="Screenshot (51)" src="https://github.com/user-attachments/assets/8da7460c-b853-4f7b-bd14-a31f625e8ed2" />
<img width="1366" height="616" alt="Screenshot (52)" src="https://github.com/user-attachments/assets/2f31ad22-2bdc-45c7-a1ce-b065202d6ae0" />

<img width="1366" height="623" alt="Screenshot (55)" src="https://github.com/user-attachments/assets/be8dc72a-4364-4987-bc44-952fa6b9e929" />
<img width="1366" height="649" alt="Screenshot (56)" src="https://github.com/user-attachments/assets/787c7a72-6f54-4996-b1ad-a2a3d14f6a2e" />
<img width="1366" height="624" alt="Screenshot (57)" src="https://github.com/user-attachments/assets/dd6976a3-548e-4362-b25f-bb3388330224" />
<img width="1366" height="638" alt="Screenshot (63)" src="https://github.com/user-attachments/assets/47543621-d201-424e-8865-0ba8e8c2f8d1" />
<img width="1366" height="639" alt="Screenshot (65)" src="https://github.com/user-attachments/assets/77c3eea0-b0de-43c0-9e65-fca2eba424bc" />












