<%@ page import="java.sql.*" %>
<html>
<body>

<h2>Return Book</h2>

<form method="post">
    Book ID: <input type="text" name="id"><br><br>
    <input type="submit" value="Return Book">
</form>

<%
if(request.getMethod().equals("POST")){
    int id = Integer.parseInt(request.getParameter("id"));

    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library","root","Nani@123");

        String sql = "UPDATE books SET quantity = quantity + 1 WHERE id=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);

        int i = ps.executeUpdate();

        if(i>0){
            out.println("Book Returned Successfully!");
        } else {
            out.println("Book not found!");
        }

    } catch(Exception e){
        out.println(e);
    }
}
%>

</body>
</html>