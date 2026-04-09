<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<h2>Books and Students</h2>
<table border="1">
<tr>
    <th>Book ID</th>
    <th>Title</th>
    <th>Author</th>
    <th>Price</th>
    <th>Available</th>
    <th>Student</th>
    <th>Purchase Date</th>
</tr>

<%
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(
    "SELECT b.id, b.title, b.author, b.price, b.available, s.name, bs.purchase_date " +
    "FROM books b LEFT JOIN book_student bs ON b.id=bs.book_id " +
    "LEFT JOIN students s ON s.id=bs.student_id"
);

while(rs.next()){
%>
<tr>
    <td><%=rs.getInt("id")%></td>
    <td><%=rs.getString("title")%></td>
    <td><%=rs.getString("author")%></td>
    <td><%=rs.getDouble("price")%></td>
    <td><%=rs.getInt("available")==1?"Yes":"No"%></td>
    <td><%=rs.getString("name")!=null?rs.getString("name"):"-" %></td>
    <td><%=rs.getDate("purchase_date")!=null?rs.getDate("purchase_date"):"-" %></td>
</tr>
<%
}
rs.close(); st.close();
%>
</table>