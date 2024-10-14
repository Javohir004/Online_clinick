<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 22.07.2024
  Time: 21:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>New appointment</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        h2 {
            color: #333;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            background-color: #e6f7ff;
            border: 1px solid #b3daff;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
            text-align: center;
            font-size: 18px;
            color: #007acc;
        }
        li:hover {
            background-color: #cceeff;
        }
    </style>
</head>
<body>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Available Time Slots</title>
</head>
<body>
<h2>Available Time Slots</h2>
<ul>
    <c:forEach var="slot" items="${timeSlots}">
        <li>${slot}</li>
    </c:forEach>
</ul>

</body>
</html>
