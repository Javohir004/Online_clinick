<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Days</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-repeat: no-repeat;
            background-color: #f0f8ff;
            background-image: url('https://i.pinimg.com/564x/69/8d/24/698d24b367fc44d6392a6d0ba41e04ce.jpg'); /* Replace with your background image URL */
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            text-align: center;
            width: 80%;
            background-color: rgba(255, 266, 333, 0.8); /* Slightly transparent background for the container */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            background-color: #e6f7ff;
            border: 1px solid #b3daff;
            padding: 15px;
            margin: 10px 0;
            border-radius: 8px;
            font-size: 18px;
            color: #007acc;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        li:hover {
            background-color: #cceeff;
            box-shadow: 0 6px 8px rgba(0,0,0,0.15);
            transform: translateY(-5px);
        }
        a {
            text-decoration: none;
            color: inherit;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007acc;
            color: white;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .back-link:hover {
            background-color: #005fa3;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="animate__animated animate__fadeIn">Select a Day</h2>
    <ul>
        <c:forEach var="day" items="${days}">
            <li class="animate__animated animate__fadeInUp">
                <a href="select-day?doctorId=${doctorId}&date=${day}">
                        ${day}
                </a>
            </li>
        </c:forEach>
    </ul>
    <a href="${pageContext.request.contextPath}/user-profile/back-patient-page" class="btn btn-secondary mt-3">Back</a>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

