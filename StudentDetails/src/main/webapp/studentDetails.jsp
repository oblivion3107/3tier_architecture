<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Details</title>
    <style>
        .back-button {
            position: absolute;
            top: 10px;
            left: 10px;
            background-image: url('path_to_arrow_icon/back_arrow_icon.png');
            width: 30px;
            height: 30px;
            background-size: cover;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>Student Details</h1>
    <% 
        String rollNumber = request.getParameter("rollNumber");
        // JDBC code to retrieve student details based on the roll number
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://3.101.37.102:3306/Logindetails", "phill", "Jhonathan@1");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM student_details WHERE id=?");
            ps.setString(1, rollNumber);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
    %>
            <p>Name: <%= rs.getString("name") %></p>
            <p>Phone Number: <%= rs.getString("phone number") %></p>
            <p>Aadhar Number: <%= rs.getString("aadharNumber") %></p>
            <p>Father Name: <%= rs.getString("father_name") %></p>
            <!-- Add more fields as needed -->
            <form action="index.jsp">
                <button class="back-button" type="submit"></button>
            </form>
    <%
            } else {
    %>
            <p>No student found with the provided roll number.</p>
            <!-- Include a link/button to return to the index.jsp page -->
            <form action="index.jsp">
                <button class="back-button" type="submit"></button>
            </form>
    <%
            }
            con.close();
        } catch(Exception e) {
            out.println(e);
        }
    %>
</body>
</html>
