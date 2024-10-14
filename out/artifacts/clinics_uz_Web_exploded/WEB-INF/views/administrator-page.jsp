<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 7/25/2024
  Time: 4:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Administrator Page</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            color: #333;
            text-align: center;
            background: url('https://i.pinimg.com/564x/15/4c/1f/154c1f366463f9872424acbfaead5225.jpg') no-repeat center center fixed; /* Background image URL */
            background-size: cover;
        }

        .overlay {
            background: rgba(255, 255, 255, 0.6); /* White overlay with 60% opacity */
            padding: 50px;
            border-radius: 15px;
        }

        h2 {
            margin-bottom: 30px;
            font-weight: 700;
        }

        .btn {
            margin: 10px;
            font-size: 16px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .btn a {
            color: white;
            text-decoration: none;
        }

        .btn:hover {
            transform: scale(1.05);
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .picture {
            margin: 30px auto;
            width: 300px;
            height: auto;
            border-radius: 15px;
            overflow: hidden;
        }

        .picture img {
            width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
<div class="overlay">
    <h2>Here is Administrator Page</h2>
    <button class="btn btn-primary">
        <a href="${pageContext.request.contextPath}/create-room">Create Room</a>
    </button>
  <%--  <button class="btn btn-secondary">
        <a href="${pageContext.request.contextPath}/create-room/all-rooms">All Rooms</a>
    </button>--%>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

