<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #e0c3fc, #8ec5fc);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 60px auto;
            background: #ffffff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            overflow: hidden;
            border-radius: 10px;
        }

        th {
            background: #6a5acd;
            color: white;
            padding: 12px;
            text-align: center;
        }

        td {
            padding: 10px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        table, th, td {
            border: none;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Book List</h2>

    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
            <th>Quantity</th>
        </tr>

<%
try{
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/library","root","Nani@123");

    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM books");

    while(rs.next()){
%>

        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("author") %></td>
            <td>₹ <%= rs.getDouble("price") %></td>
            <td><%= rs.getInt("quantity") %></td>
        </tr>

<%
    }
}catch(Exception e){
    out.println("<p style='color:red;text-align:center;'>" + e.getMessage() + "</p>");
}
%>

    </table>
</div>

</body>
</html>
