# 3tier_architecture
# Overview
The StudentDetails web application provides a platform for managing student information. It allows users to validate student roll numbers and retrieve detailed information about students from a MySQL database.

# Architecture
The web application follows a typical three-tier architecture:

1. Frontend: Utilizes JSP (JavaServer Pages), HTML, CSS, and JavaScript for the user interface.
2. Backend: Implements Java servlets to handle HTTP requests and interact with the database.
3. Database: Uses MySQL as the backend database management system to store student details.

# Build Instructions

Steps to Install Apache Tomcat:
Update System Packages:
```
sudo yum update -y
```
Install Java:
```
sudo yum install java-17* -y
```
Download Tomcat:
```
wget https://downloads.apache.org/tomcat/tomcat-10/v10.1.5/bin/apache-tomcat-10.1.5.tar.gz
```
(Replace the URL with the latest version as needed)

Extract Tomcat:
```
tar -xvf apache-tomcat-10.1.5.tar.gz
```
Move Tomcat to /usr/local:
```
sudo mv apache-tomcat-10.1.5 /usr/local/tomcat
```
Start Tomcat:
```
/usr/local/tomcat/bin/startup.sh
```
Verify Installation:

Open your browser and visit: http://your-server-ip:8080

## Steps to Install MySQL 5.7:

Update System Packages:
```
sudo yum update -y
```
Add MySQL 5.7 Repository:
```
sudo rpm -Uvh https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
```
Install MySQL 5.7 Server:
```
sudo dnf install mysql80-community-release-el9-1.noarch.rpm -y
sudo dnf install mysql-community-server -y
```
Start MySQL Service:
```
sudo systemctl start mysqld
```
Get Temporary Root Password:

Retrieve the temporary root password generated during installation:
```
sudo grep 'temporary password' /var/log/mysqld.log
```

Follow the prompts to change the root password and apply other security settings.
Login to MySQL:

Log in to MySQL with the new root password:
```
mysql -u root -p
```
Enable MySQL to Start on Boot:
```
sudo systemctl enable mysqld
```

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

# Procedure

1. After building the code using maven, a WAR file will  be generated.
2. Stop the tomcat service if it is in running state.
3. Move this WAR file into the webapps directory in the tomcat file.
4. Rename the WAR file as ROOT.war
5. Restart the tomcat services.

Operations to be performed in MySQL

1.Create a New MySQL User:
Create a new MySQL user with the following command:
```
CREATE USER 'username'@'ip_address' IDENTIFIED BY 'password';
```
Replace username with the desired username, ip_address with the IP address where the user will connect from and password with a strong password.
2. Grant Privileges to the User:
Grant necessary privileges to the user for the specific database. For example, to grant all privileges on the YourDatabaseName database:
```
GRANT ALL PRIVILEGES ON YourDatabaseName.* TO 'username'@'ip_address';
```
Replace YourDatabaseName, username, and ip_address with the appropriate values.
3.Flush Privileges:
After granting privileges, flush the MySQL privileges to apply the changes:
```
FLUSH PRIVILEGES;
```
