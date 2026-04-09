<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>

<h2>Assign Book to Student</h2>
<form method="post">
    Student: 
    <select name="student_id">
    <%
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM students");
        while(rs.next()){
    %>
        <option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>
    <%
        }
        rs.close(); st.close();
    %>
    </select><br><br>

    Book: 
    <select name="book_id">
    <%
        Statement st2 = con.createStatement();
        ResultSet rs2 = st2.executeQuery("SELECT * FROM books WHERE available=1");
        while(rs2.next()){
    %>
        <option value="<%=rs2.getInt("id")%>"><%=rs2.getString("title")%></option>
    <%
        }
        rs2.close(); st2.close();
    %>
    </select><br><br>

    <input type="submit" value="Assign Book">
</form>

<%
String studentId = request.getParameter("student_id");
String bookId = request.getParameter("book_id");

if(studentId != null && bookId != null){
    try{
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO book_student(book_id, student_id, purchase_date) VALUES(?,?,CURDATE())"
        );
        ps.setInt(1, Integer.parseInt(bookId));
        ps.setInt(2, Integer.parseInt(studentId));
        ps.executeUpdate();

        // Mark book as unavailable
        PreparedStatement ps2 = con.prepareStatement(
            "UPDATE books SET available=0 WHERE id=?"
        );
        ps2.setInt(1, Integer.parseInt(bookId));
        ps2.executeUpdate();

        out.println("<p style='color:green'>Book assigned successfully</p>");

        ps.close(); ps2.close();

    } catch(Exception e){
        out.println("<p style='color:red'>"+e.getMessage()+"</p>");
    }
}
%>