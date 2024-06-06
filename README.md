# 3tier_architecture
# Overview
The StudentDetails web application provides a platform for managing student information. It allows users to validate student roll numbers and retrieve detailed information about students from a MySQL database.

# Architecture
The web application follows a typical three-tier architecture:

1. Frontend: Utilizes JSP (JavaServer Pages), HTML, CSS, and JavaScript for the user interface.
2. Backend: Implements Java servlets to handle HTTP requests and interact with the database.
3. Database: Uses MySQL as the backend database management system to store student details.

# Installation

## Requirements:
* Java Development Kit (JDK)
* Apache Tomcat (Servlet container)
* MySQL Server
## Setup Instructions:
* Build the code files using the maven tool by specifiyinng the goals "clean" "install".
* Install JDK *17 and Apache Tomcat on your system.
* Configure Apache Tomcat and deploy the WAR file of the StudentDetails web application.
* Install MySQL Server and create a database named "Logindetails".
* Import the database schema provided in the project to create the necessary tables.
* Configure database connection settings in web.xml and Java code.
# Configuration
## Database Connection:
* JDBC URL: jdbc:mysql://<ip_address of the server>:3306/Logindetails
* Username: User given for  the database.
* Password: Password for the user.
* User for the database should have privileges
## Usage
1. Access the web application using the URL provided by the servlet container.
2. Enter a valid student roll number and submit to validate.
3. View detailed student information if the roll number is valid.
# Code Structure
The codebase follows a standard Maven project structure:

* src/main/java: Contains Java source code, including servlets.
* src/main/webapp: Contains web resources (JSP files, CSS, JavaScript).
* pom.xml: Maven project configuration file.
# Database Schema
The database schema consists of the following tables:

student_details: Stores student information, including ID, name, phone number, Aadhar number, and father's name.
# Dependencies
* Servlet API (provided)
* MySQL Connector/J (version 8.0.33)

