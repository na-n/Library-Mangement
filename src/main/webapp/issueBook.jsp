<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Issue Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #ffecd2, #fcb69f);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 400px;
            margin: 100px auto;
            background: #ffffff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        input[type="text"] {
            width: 90%;
            padding: 10px;
            margin-top: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: 0.3s;
        }

        input[type="text"]:focus {
            border-color: #ff7e5f;
            outline: none;
        }

        input[type="submit"] {
            width: 95%;
            padding: 10px;
            background: #ff7e5f;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: #eb6750;
        }

        .message {
            margin-top: 15px;
            font-weight: bold;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }

        .warning {
            color: orange;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Issue Book</h2>

    <form method="post">
        <input type="text" name="id" placeholder="Enter Book ID" required>
        <input type="submit" value="Issue Book">
    </form>

<%
if(request.getMethod().equals("POST")){
    int id = Integer.parseInt(request.getParameter("id"));

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Nani@123");

        String check = "SELECT quantity FROM books WHERE id=?";
        ps = con.prepareStatement(check);
        ps.setInt(1, id);
        rs = ps.executeQuery();

        if(rs.next()){
            int qty = rs.getInt("quantity");

            if(qty > 0){
                String update = "UPDATE books SET quantity = quantity - 1 WHERE id=?";
                ps = con.prepareStatement(update);
                ps.setInt(1, id);
                ps.executeUpdate();

                out.println("<p class='message success'>Book Issued Successfully!</p>");
            } else {
                out.println("<p class='message warning'>Out of Stock!</p>");
            }
        } else {
            out.println("<p class='message error'>Book not found!</p>");
        }

    } catch(Exception e){
        out.println("<p class='message error'>" + e.getMessage() + "</p>");
    }
}
%>

</div>

</body>
</html>
