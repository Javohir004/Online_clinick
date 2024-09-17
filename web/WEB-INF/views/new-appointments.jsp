<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Doctor List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-top: 20px;
        }

        h2 {
            text-align: center;
            color: #4CAF50;
        }

        .error-message {
            color: #d9534f;
            background-color: #f2dede;
            border: 1px solid #ebccd1;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 4px;
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        .back-link {
            display: block;
            margin: 20px 0;
            text-align: center;
            text-decoration: none;
            color: #4CAF50;
            font-size: 16px;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <c:if test="${not empty message}">
        <div class="error-message">${message}</div>
    </c:if>

    <c:choose>
        <c:when test="${not empty appointments}">
            <h2>Doctors List</h2>
            <table>
                <thead>
                <tr>
                    <th>#</th>
                    <th>Role</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Age</th>
                    <th>Gender</th>
                    <th>Phone Number</th>
                    <th>Address</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="appointment" items="${appointments}" varStatus="num">
                    <tr>
                        <td>${num.index + 1}</td>
                        <td>${appointment.role}</td>
                        <td>${appointment.firstname}</td>
                        <td>${appointment.lastname}</td>
                        <td>${appointment.username}</td>
                        <td>${appointment.email}</td>
                        <td>${appointment.age}</td>
                        <td>${appointment.gender}</td>
                        <td>${appointment.phoneNumber}</td>
                        <td>${appointment.address}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:when>
        <c:otherwise>
            <p style="text-align: center; font-size: 18px;">You don't have any doctors yet.</p>
        </c:otherwise>
    </c:choose>
    <a href="${pageContext.request.contextPath}/appointment/back-appointments" class="back-link">
        <i class="fas fa-arrow-left"></i> Back to menu
    </a>
</div>
</body>
</html>
