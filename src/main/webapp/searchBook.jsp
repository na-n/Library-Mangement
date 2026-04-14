<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #fddb92, #d1fdff);
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 80px auto;
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
            border-color: #ff9966;
            outline: none;
        }

        input[type="submit"] {
            width: 95%;
            padding: 10px;
            background: #ff9966;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 6px;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: #e67e50;
        }

        .result {
            margin-top: 20px;
            text-align: left;
        }

        .book-card {
            background: #f9f9f9;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .book-card p {
            margin: 5px 0;
            color: #333;
        }

        .no-result {
            margin-top: 15px;
            color: red;
            font-weight: bold;
        }
    </style>
</head>

<body>

<div class="container">
    <h2>Search Book</h2>

    <form method="post">
        <input type="text" name="name" placeholder="Enter Book Name" required>
        <input type="submit" value="Search">
    </form>

    <div class="result">
<%
if(request.getMethod().equals("POST")){
    String name = request.getParameter("name");
    boolean found = false;

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Nani@123");

        String sql = "SELECT * FROM books WHERE title LIKE ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, "%" + name + "%");

        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            found = true;
%>
            <div class="book-card">
                <p><strong>ID:</strong> <%= rs.getInt("id") %></p>
                <p><strong>Title:</strong> <%= rs.getString("title") %></p>
                <p><strong>Quantity:</strong> <%= rs.getInt("quantity") %></p>
            </div>
<%
        }

        if(!found){
            out.println("<p class='no-result'>No books found!</p>");
        }

    } catch(Exception e){
        out.println("<p class='no-result'>" + e.getMessage() + "</p>");
    }
}
%>
    </div>

</div>

</body>
</html>
