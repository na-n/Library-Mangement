<%@ page import="java.sql.*" %>
<html>
<body>

<h2>Search Book</h2>

<form method="post">
    Book Name: <input type="text" name="name"><br><br>
    <input type="submit" value="Search">
</form>

<%
if(request.getMethod().equals("POST")){
    String name = request.getParameter("name");

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Nani@123");

        String sql = "SELECT * FROM books WHERE title LIKE ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, "%" + name + "%");

        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            out.println("ID: " + rs.getInt("id") + "<br>");
            out.println("Title: " + rs.getString("title") + "<br>");
            out.println("Quantity: " + rs.getInt("quantity") + "<br><hr>");
        }

    } catch(Exception e){
        out.println(e);
    }
}
%>

</body>
</html>