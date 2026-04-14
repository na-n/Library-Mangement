<%@ page import="java.sql.*" %>

<%
Connection con = null;

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/library_db",
        "root",
        "Nani@123"   
    );
} catch(Exception e) {
    out.println("DB Error: " + e);
}
%>