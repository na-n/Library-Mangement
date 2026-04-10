<!DOCTYPE html>
<html>
<head>
    <title>Library Management System</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #667eea, #764ba2);
        }

        .header {
            text-align: center;
            padding: 20px;
            color: white;
            font-size: 28px;
            font-weight: bold;
        }

        .container {
            width: 80%;
            margin: 40px auto;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .card {
            background: white;
            padding: 30px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            transition: 0.3s;
        }

        .card:hover {
            transform: scale(1.05);
        }

        .card a {
            text-decoration: none;
            color: #333;
            font-size: 18px;
            font-weight: bold;
        }

        .card a:hover {
            color: #667eea;
        }

        .footer {
            text-align: center;
            color: white;
            margin-top: 40px;
        }
    </style>
</head>

<body>

<div class="header">
    📚 Library Management System
</div>

<div class="container">

    <div class="card">
        <a href="addBook.jsp">➕ Add Book</a>
    </div>

    <div class="card">
        <a href="bookList.jsp">📖 View Books</a>
    </div>

    <div class="card">
        <a href="search.jsp">🔍 Search Book</a>
    </div>

    <div class="card">
        <a href="issue.jsp">📕 Issue Book</a>
    </div>

    <div class="card">
        <a href="return.jsp">📗 Return Book</a>
    </div>

    <div class="card">
        <a href="purchase.jsp">🛒 Purchase Book</a>
    </div>

</div>

<div class="footer">
    © 2026 Library System
</div>

</body>
</html>
