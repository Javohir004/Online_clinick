<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Doctor Appointment Requests</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet" />
    <style>
        body {
            font-family: "Roboto", sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
            position: relative;
            background-image: url("https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0");
            background-size: cover;
            background-repeat: no-repeat;
        }

        .navbar {
            background-image: url("https://img.freepik.com/free-vector/blue-medical-background-with-hexagonal-shape-design_1017-26839.jpg");
            background-repeat: no-repeat;
            background-size: 300% 100%;
            object-fit: cover;
            width: 310px;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px 0;
            border-right: 1px solid #ddd;
            height: 100%;
            position: fixed;
            left: 0;
            top: 0;
            overflow: auto;
        }

        .navbar img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            object-fit: cover;
        }

        .navbar h2,
        .navbar h3,
        .navbar h4 {
            margin: 10px 0;
            text-align: center;
        }

        .menu {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            padding: 0;
        }

        .menu button {
            background-color: rgba(255, 255, 255, 0.637);
            width: 90%;
            margin-bottom: 10%;
            border: none;
            padding: 15px;
            font-size: 17px;
            text-align: start;
            border-radius: 13px !important;
            transition: transform 0.3s ease;
        }

        .menu button:hover {
            transform: translateY(-8px);
        }

        .menu button a {
            text-decoration: none;
            color: rgb(95, 94, 94);
        }

        .main-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
            overflow: hidden;
            position: relative;
            width: calc(100% - 310px);
            margin-left: 310px;
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        .appointment-card {
            background-color: #fff;
            border: 1px solid #dee2e6;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .appointment-card strong {
            display: block;
            font-size: 1.2em;
            margin-bottom: 5px;
        }

        .btn-group {
            margin-top: 10px;
        }

        .reason-input {
            display: none;
            margin-top: 10px;
        }

        .notification-bell {
            font-size: 36px;
            position: absolute;
            top: 20px;
            right: 20px;
            cursor: pointer;
            z-index: 100;
        }

        .badge {
            position: absolute;
            top: -10px;
            right: -10px;
            background-color: red;
            color: white;
            border-radius: 50%;
            padding: 5px 10px;
            font-size: 14px;
            font-weight: bold;
        }

        .back-link {
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: lightskyblue;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s;
            z-index: 100;
        }

        .back-link:hover {
            background-color: cornflowerblue;
        }

        .reason-input {
            display: none;
            margin-top: 10px;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ddd;
            background-color: #f8f9fa;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .reason-input input[type="text"] {
            width: calc(100% - 22px); /* Adjust width to account for padding */
            padding: 8px 12px;
            border-radius: 5px;
            border: 1px solid #ced4da;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .reason-input button {
            background-color: #dc3545; /* Bootstrap red color */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
        }

        .reason-input button:hover {
            background-color: #c82333; /* Darker red for hover effect */
        }
    </style>
</head>
<body>
<div class="navbar">
    <img src="https://i.pinimg.com/564x/e2/1d/42/e21d423f7c1bcea86f1680d47279bd3f.jpg" alt="User Photo" />
    <h2>${user.firstname}</h2>
    <h2>${user.lastname}</h2>
    <h3>${user.email}</h3>
    <h4>DOCTOR</h4>
    <div class="menu">
        <button><a href="${pageContext.request.contextPath}/appointment/requests">Incoming Requests</a></button>
        <button><a href="${pageContext.request.contextPath}/accepted-requests/show">New Diagnose</a></button>
        <button><a href="${pageContext.request.contextPath}/user-profile">My Profile</a></button>
    </div>
</div>
<div class="main-content">
    <h1 class="mb-4">Doctor Appointment Requests</h1>
    <c:forEach items="${appointmentRequests}" var="appointment" varStatus="loop">
        <div class="appointment-card">
            <strong>User: ${appointment.user_fio}</strong>
            <strong>Start Time: ${appointment.start_time}</strong>
            <strong>End Time: ${appointment.end_time}</strong>
            <div class="btn-group">
                <form method="post" action="${pageContext.request.contextPath}/appointment/requests" style="display:inline;">
                    <input type="hidden" name="appointment_id" value="${appointment.appointment_id}">
                    <input type="hidden" name="action" value="1">
                    <button type="submit" class="btn btn-success">Accept</button>
                </form>
                <form method="post" action="${pageContext.request.contextPath}/appointment/requests" style="display:inline;">
                    <input type="hidden" name="appointment_id" value="${appointment.appointment_id}">
                    <input type="hidden" name="action" value="0">
                    <button type="button" id="rejectButton-${appointment.appointment_id}" class="btn btn-danger" onclick="showReasonInput('${appointment.appointment_id}')">Reject</button>
                    <div id="reasonDiv-${appointment.appointment_id}" class="reason-input">
                        <input type="text" id="reasonInput-${appointment.appointment_id}" name="reason" placeholder="What is the reason" required>
                        <button type="submit" class="btn btn-danger">Finish</button>
                    </div>
                </form>
            </div>
        </div>
    </c:forEach>
    <c:choose>
        <c:when test="${not empty appointments}">
            <a href="${pageContext.request.contextPath}/appointment/new-appointments" class="notification-bell">
                <i class="fas fa-bell"></i>
                <span class="badge">${fn:length(appointments)}</span>
            </a>
        </c:when>
        <c:otherwise>
            <a href="${pageContext.request.contextPath}/appointment/new-appointments" class="notification-bell" style="color: red;">
                <i class="fas fa-bell"></i>
            </a>
        </c:otherwise>
    </c:choose>
</div>
<a href="${pageContext.request.contextPath}/user-profile/back-doctor-page" class="btn btn-secondary mt-3">Back</a>
<script>
    function showReasonInput(appointmentId) {
        document.getElementById("reasonDiv-" + appointmentId).style.display = "block";
        document.getElementById("rejectButton-" + appointmentId).style.display = "none";
    }
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

