<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #9face6);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 80px auto;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 15px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: 0.3s;
        }

        input[type="text"]:focus,
        input[type="number"]:focus {
            border-color: #6a82fb;
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: #6a82fb;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: #5a72e0;
        }

        .message {
            text-align: center;
            margin-top: 15px;
            font-weight: bold;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Add Book</h2>

    <form method="post">
        <label>Title:</label>
        <input type="text" name="title" required>

        <label>Author:</label>
        <input type="text" name="author" required>

        <label>Price:</label>
        <input type="number" name="price" step="0.01" required>

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
            out.println("<p class='message error'>Invalid price! Enter numbers only.</p>");
            return;
        }

        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO books(title, author, price) VALUES (?, ?, ?)"
        );
        ps.setString(1, title);
        ps.setString(2, author);
        ps.setDouble(3, bookPrice);

        ps.executeUpdate();
        out.println("<p class='message success'>Book Added Successfully</p>");
        ps.close();

    } catch(Exception e) {
        out.println("<p class='message error'>" + e.getMessage() + "</p>");
    }
}
%>

</div>

</body>
</html>
