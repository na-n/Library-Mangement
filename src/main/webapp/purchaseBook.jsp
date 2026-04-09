<%@ page import="java.sql.*" %>
<html>
<body>

<h2>Purchase Book (Add Stock)</h2>

<form method="post">
    Book ID: <input type="text" name="id"><br><br>
    Quantity to Add: <input type="text" name="qty"><br><br>
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
            out.println("Stock updated successfully!");
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