<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Roll Number Validation</title>
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
    <%
        String rollNumber = request.getParameter("rollNumber");
        boolean isValid = false;
        // JDBC code to validate the roll number
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://184.169.218.244:3306/Logindetails", "db_user", "Admin@1");
            PreparedStatement ps = con.prepareStatement("SELECT * FROM student_details WHERE id=?");
            ps.setString(1, rollNumber);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                isValid = true;
            }
            con.close();
        } catch(Exception e) {
            out.println(e);
        }
        if(isValid) {
            // Redirect to studentDetails.jsp with the validated roll number
            response.sendRedirect("studentDetails.jsp?rollNumber=" + rollNumber);
        } else {
    %>
        <h1>Invalid Roll Number</h1>
        <p>The roll number <%= rollNumber %> is invalid.</p>
         <!-- Include a link/button to return to the index.jsp page -->
        <form action="index.jsp">
                <button class="back-button" type="submit"></button>
            </form>
    <%
        }
    %>
</body>
</html>
