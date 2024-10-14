<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Time Slots</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            background-image: url('https://i.pinimg.com/564x/69/8d/24/698d24b367fc44d6392a6d0ba41e04ce.jpg'); /* Replace with your background image URL */
            background-size: cover;
            background-position: center;
        }
        h2 {
            color: #333;
            margin: 20px 0;
        }
        .slots-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 80%;
        }
        .slot-button {
            background-color: #2793dc;
            border: none;
            padding: 15px 25px;
            margin: 10px 0;
            border-radius: 5px;
            font-size: 16px;
            color: white;
            cursor: pointer;
            text-align: center;
            transition: background-color 0.3s, transform 0.3s;
        }
        .slot-button:hover {
            background-color: #007acc;
            transform: translateY(-3px);
        }
        .not-available {
            background-color: #dc3545;
            color: white;
            border: 1px solid #ddd;
            cursor: default;
            pointer-events: none; /* Disables clicking */
        }
        .not-available:hover {
            background-color: #c82333;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.8); /* Slightly transparent background for readability */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
<div class="container animate__animated animate__fadeIn">
    <h2>Available Time Slots for ${selectedDate}</h2>
    <div class="slots-container">
        <c:forEach var="slot" items="${timeSlots}">
            <c:choose>
                <c:when test="${slot.available}">
                    <form method="post" action="${pageContext.request.contextPath}/appointment/create">
                        <input type="hidden" name="start" value="${slot.start}">
                        <input type="hidden" name="end" value="${slot.end}">
                        <button class="slot-button" type="submit">${slot}</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <button class="slot-button not-available">${slot} (Not Available)</button>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>



