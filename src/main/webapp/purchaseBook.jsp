<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Purchase Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #a1ffce, #faffd1);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 420px;
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
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: 0.3s;
        }

        input[type="text"]:focus {
            border-color: #28a745;
            outline: none;
        }

        input[type="submit"] {
            width: 95%;
            padding: 10px;
            background: #28a745;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: #218838;
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
    </style>
</head>

<body>

<div class="container">
    <h2>Purchase Book (Add Stock)</h2>

    <form method="post">
        <input type="text" name="id" placeholder="Enter Book ID" required>
        <input type="text" name="qty" placeholder="Enter Quantity" required>
        <input type="submit" value="Purchase">
    </form>

<%
if(request.getMethod().equals("POST")){
    int id = Integer.parseInt(request.getParameter("id"));
    int qty = Integer.parseInt(request.getParameter("qty"));

    Connection con = null;
    PreparedStatement ps = null;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Nani@123");

        String sql = "UPDATE books SET quantity = quantity + ? WHERE id=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, qty);
        ps.setInt(2, id);

        int i = ps.executeUpdate();

        if(i>0){
            out.println("<p class='message success'>Stock updated successfully!</p>");
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
