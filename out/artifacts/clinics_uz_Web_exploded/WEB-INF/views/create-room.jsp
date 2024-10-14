<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 7/25/2024
  Time: 5:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Room</title>
    <style>
        body {
            background-image: url('https://i.pinimg.com/564x/e5/b6/c2/e5b6c25adf26425c299e7ed4a86b7c5c.jpg'); /* Replace with the path to your background image */
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .form-container {
            background-color: rgba(211, 211, 211, 0.8); /* Semi-transparent light gray */
            border-radius: 10px;
            padding: 20px;
            max-width: 400px;
            margin: 50px auto;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            background-color: #4CAF50; /* Green */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
            width: 100%;
        }
        button:hover {
            background-color: #45a049; /* Darker green */
        }
        a {
            display: block;
            margin-top: 10px;
            text-align: center;
            color: #007bff; /* Blue */
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="form-container">
    <form action="${pageContext.request.contextPath}/create-room" method="post">
        <h4 style="color: red">Create a Room</h4>
        <label>Name of Room</label>
        <input type="text" name="name" placeholder="name" required>
        <label>Number of Room</label>
        <input type="number" name="number" placeholder="room" required>
        <label>Number of Floor</label>
        <input type="number" name="floor" placeholder="floor" required>
        <label>How Many Beds</label>
        <input type="number" name="beds" placeholder="beds" required>
        <button type="submit">Create Room</button>
        <a href="${pageContext.request.contextPath}/create-room/back-administrator-page">Back</a>
    </form>
</div>
</body>
</html>

