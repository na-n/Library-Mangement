<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<h2>Add Book</h2>
<form method="post">
    Title: <input type="text" name="title" required><br><br>
    Author: <input type="text" name="author" required><br><br>
    Price: <input type="number" name="price" step="0.01" required><br><br>
    <input type="submit" value="Add Book">
</form>

<%
String title = request.getParameter("title");

if(title != null && !title.trim().isEmpty()) {
    try {
        String author = request.getParameter("author");
        String price = request.getParameter("price");

        double bookPrice = 0;
        try {
            bookPrice = Double.parseDouble(price);
        } catch(NumberFormatException e) {
            out.println("<p style='color:red'>Invalid price! Enter numbers only.</p>");
            return;
        }

        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO books(title, author, price) VALUES (?, ?, ?)"
        );
        ps.setString(1, title);
        ps.setString(2, author);
        ps.setDouble(3, bookPrice);

        ps.executeUpdate();
        out.println("<p style='color:green'>Book Added Successfully</p>");
        ps.close();

    } catch(Exception e) {
        out.println("<p style='color:red'>" + e.getMessage() + "</p>");
    }
}
%>