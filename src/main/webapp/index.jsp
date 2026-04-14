<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Library Menu</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #74ebd5, #ACB6E5);
        margin: 0;
        padding: 0;
        text-align: center;
    }

    h2 {
        margin-top: 40px;
        color: #333;
    }

    .menu-container {
        background: white;
        width: 300px;
        margin: 40px auto;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.2);
    }

    a {
        display: block;
        text-decoration: none;
        background: #4CAF50;
        color: white;
        padding: 10px;
        margin: 10px 0;
        border-radius: 5px;
        transition: 0.3s;
    }

    a:hover {
        background: #45a049;
        transform: scale(1.05);
    }
</style>

</head>
<body>

<h2>Library Menu</h2>

<div class="menu-container">
    <a href="addBook.jsp">Add Book</a>
    <a href="viewBooks.jsp">View Books</a>
    <a href="purchaseBook.jsp">Purchase Book</a>
    <a href="issueBook.jsp">Issue Book</a>
    <a href="returnBook.jsp">Return Book</a>
    <a href="searchBook.jsp">Search Book</a>
</div>

</body>
</html>
