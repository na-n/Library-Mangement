<%@ page import="java.sql.*" %>
<html>
<body>

<h2>Book List</h2>

<table border="1">
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
    <td><%= rs.getDouble("price") %></td>
    <td><%= rs.getInt("quantity") %></td>
</tr>

<%
    }
}catch(Exception e){
    out.println(e);
}
%>

</table>

</body>
</html>