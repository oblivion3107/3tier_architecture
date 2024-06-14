# StudentDetails Web Application

## Project Overview
StudentDetails is a Java web application designed to retrieve and display student information based on their roll number. The application is built using Java Servlets, JSP, and MySQL database, packaged and deployed using Apache Maven and Apache Tomcat.

## System Requirements:
1. Java Development Kit (JDK) 17
2. Apache Tomcat 9 or later
3. MySQL Server 5.7 or later
4. Apache Maven 3.8.4 or later
5. AWS Linux on all the servers

## Installation Guide

### Java JDK Installation

Update your system package index: `sudo yum update -y`

Install JDK 17: `sudo yum install java-17* -y`

Verify installation: `java -version`

### Tomcat Installation

Download Tomcat 9: `wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.89/bin/apache-tomcat-9.0.89.tar.gz`

Extract the downloaded file: `tar -xvzf apache-tomcat-9.0.89.tar.gz`

Move to the desired installation directory: `sudo mv apache-tomcat-9.0.89 /usr/local/tomcat9`

Start Tomcat: `/usr/local/tomcat9/bin/startup.sh`

Verify by accessing: http://your-server-ip:8080 in a web browser.

### Maven Installation:

Download Maven: `sudo yum install maven -y`

Verify Installation: `mvn --version` 

### Git Innstallation:

Download  git: `sudo yum install git -y` 

### MySQL Installation:

Connect to your EC2 instance using SSH.

Update the package repository: `sudo yum update`

Install MySQL server: 
```
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022
wget http://dev.mysql.com/get/mysql57-community-release-el7-8.noarch.rpm
sudo yum localinstall -y mysql57-community-release-el7-8.noarch.rpm
sudo yum install -y mysql-community-server
```
Start the MySQL service and enable it to start on boot: `sudo systemctl enable mysqld` 
`sudo systemctl enable mysqld`

## Configuration

### MySQL Configuration:

Retrieve the root password: `sudo grep 'temporary password' /var/log/mysqld.log`

Log in to MYSQL: `mysql -u root -p`

Change the root password: `ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MyNewPass1!';`

Create a new database for your application: 
```
CREATE DATABASE Logindetails; USE Logindetails;
```
Create tables: 
```
CREATE TABLE student_details ( id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(45) NOT NULL, `phone number` VARCHAR(45) NOT NULL,  `aadharNumber` VARCHAR(45) NOT NULL,  `father_name` VARCHAR(45) NOT NULL);
```
Insert data into the created tables: 
```
INSERT INTO student_details (id, name, `phone number`, `aadharNumber`, `father_name`) 
VALUES (give required values as mentioned in the table);
```
For example,
INSERT INTO student_details (id, name, `phone number`, `aadharNumber`, `father_name`) VALUES (2, 'ditch', 12456689, 1249830012, 'doe');

User Setup:

Grant Privileges to the User:

Create a new MySQL user and grant appropriate privileges on the database:  
```
CREATE USER 'db_user'@'tomcat_public_ip_address' IDENTIFIED BY 'Password';
```
Replace db_user, tomcat_public_ip_address and password with appropriate values.

Grant necessary privileges to the user for the specific database. For example, to grant all privileges on the YourDatabaseName database
```
GRANT ALL PRIVILEGES ON Logindetails.* TO 'username'@'ip_address';
```
Replace username, and ip_address with the appropriate values.

Flush Privileges:
After granting privileges, flush the MySQL privileges to apply the changes
```
FLUSH PRIVILEGES;
```
# Project Structure
Here is a typical layout of the Maven-based project:

- StudentDetails/
- ├── src/
- │......├── main
- │......│......├── java
- │......│......│   └── com
- │......│......│       └── jsp
- │......│......│           ├── StudentServlet.java
- │......│......├── resources
- │......│......├── webapp
- │......│................├── WEB-INF
- │......│................│........├── web.xml
- │......│................├── index.jsp
- │......│................├── studentDetails.jsp
- ├── pom.xml

## Key Files
1. StudentServlet.java: Handles HTTP requests and interacts with the database.
2. index.jsp: Initial page where the user inputs the roll number.
3. studentDetails.jsp: Displays the retrieved student details.
4. web.xml: Deployment descriptor that maps the servlet.

## Application Flow:
1. User navigates to the web application.
2. User submits the roll number through index.jsp.
3. The StudentServlet processes the request.
4. The servlet queries the database for student details.
5. Data is forwarded to studentDetails.jsp.
6. The JSP displays the student's information.

## Procedure

1. Take two ec2 instannces with aws linux.
2. Two seperate groups having access to 22 port for ssh, 8080 port for tomcat server, and 3306 port for mysql database server.
3. Dedicate one server for tomcat application and other server for mysql database.
4. On tomcat server install Java 17, tomcat 9, git and maven. Installation steps  are mentioned in installation guide above.
5. On mysql server install mysql 5.7 by followinng thee steps mentioned above.
6. After installing all the requirements on the instances follow the build steps to  build and deploy the application.

## Build Procedure
1. On tomcat server, using git, clone the repository in to /home/ec2-user/ directory.
 ```
git clone 'repo_link'
```
2. studentDetails.jsp and validateRollNumber.jsp file have to be modified at the jdbc connection line. Following are the steps: `cd /home/ec2-user/3tier_architecture/StudentDetails/src/main/webapp/`
3. In studentDetails.jsp and validateRollNumber.jsp following is the line to  be edited: 'Connection con = DriverManager.getConnection("jdbc:mysql://mysql_server_ip:3306/Logindetails", "username", "password");' 
Replace mysql_server_ip with the ip of the mysql  server and the username and password has to be changed to the credentials given in the database server with priviliges.
4. After the changes go to the directory where pom.xml file  is located: `cd home/ec2-user/3tier_architecture/StudentDetails/`
5. Use the maven build  goals to build the project: `mvn clean package`
6. A war file will be generated in the path `cd home/ec2-user/3tier_architecture/StudentDetails/target/`
7. Move the war file to the tomcat directory: `mv home/ec2-user/3tier_architecture/StudentDetails/target/StudentDetails.war /usr/local/tomcat9/webapps`
8. Change the directory to  the tomcat location: `cd usr/local/tomcat9/webapps`
** Make sure the tomcat service is stopped `/usr/local/tomcat9/bin/shutdown.sh` **
10. Remove the existing ROOT.war and ROOT file from the directory: `sudo rm -rf ROOT.war ROOT`
11. Move the StudentDetails.war file to  ROOT.war: `mv StudentDetails.war ROOT.war`
12. Use  the following command to start the tomcat service `/usr/local/tomcat9/bin/start.sh`
13. Check  the the service is runnning: http://tomcat_server_ip:8080 
