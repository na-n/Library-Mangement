<%@ page import="java.sql.*" %>
<html>
<body>

<h2>Issue Book</h2>

<form method="post">
    Book ID: <input type="text" name="id"><br><br>
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

                out.println("Book Issued Successfully!");
            } else {
                out.println("Out of Stock!");
            }
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