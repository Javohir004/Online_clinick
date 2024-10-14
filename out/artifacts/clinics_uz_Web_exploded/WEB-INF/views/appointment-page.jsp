<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Appointments</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            background-image: url('https://i.pinimg.com/236x/3b/e3/63/3be3636ca1cff58ea64dc8096a851ffc.jpg');
            background-repeat: no-repeat;
        }

        .navbar {
            background-image: url("https://img.freepik.com/free-vector/blue-medical-background-with-hexagonal-shape-design_1017-26839.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            width: 310px;
            color: #9d9c90;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            border-right: 1px solid #ddd;
            position: fixed;
            height: 100%;
            overflow-y: auto;
        }

        .navbar img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            object-fit: cover;
        }

        .navbar h3, .navbar h4 {
            margin: 10px 0;
            text-align: center;
        }

        .menu {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            padding-left: 20px;
            width: 100%;
        }

        .menu button {
            background-color: rgba(255, 255, 255, 0.637);
            width: 90%;
            margin-bottom: 5%;
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
            margin-left: 310px;
            padding: 20px;
            width: calc(100% - 310px);
            overflow-y: auto;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            margin: 20px;
            max-width: 100%;
        }

        .card .card-header, .card .card-footer {
            background-color: lightskyblue;
            color: white;
        }

        .card .card-body {
            text-align: center;
            padding: 20px;
        }

        .card .projcard-subtitle {
            font-size: 18px;
            color: #333;
            margin-bottom: 10px;
        }

        .card .projcard-subtitle strong {
            font-weight: 700;
        }

        .btn-primary {
            background-color: #7070e0;
            border-color: #7070e0;
        }

        .btn-primary:hover {
            background-color: #4f4ff8;
            border-color: #3939fa;
        }

        .back-link {
            text-decoration: none;
            color: cornflowerblue;
            margin: 20px;
            font-size: 18px;
        }

        .no-appointments {
            font-size: 18px;
            color: #555;
            margin: 20px;
        }

        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .col-md-6 {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>

<div class="navbar">
    <img src="https://i.pinimg.com/564x/74/ea/5a/74ea5afad2388297aa6222d92efd3b67.jpg" alt="User Photo">
    <h2>${user.firstname}</h2>
    <h2>${user.lastname}</h2>
    <h3>${user.email}</h3>
    <h4>PATIENT</h4>
    <div class="menu">
        <button><a href="${pageContext.request.contextPath}/appointment/show">My appointments</a></button>
        <button><a href="${pageContext.request.contextPath}/admin/balance">Balance</a></button>
        <button><a href="${pageContext.request.contextPath}/user-profile">My Profile</a></button>
        <button><a href="${pageContext.request.contextPath}/accepted-requests/next-page">My diagnosis</a></button>
    </div>
</div>

<div class="main-content">
    <div class="text-center mb-4">
        <h2 class="animate__animated animate__fadeInDown">My Appointments</h2>
    </div>

    <c:choose>
        <c:when test="${not empty appointments}">
            <div class="row">
                <c:forEach var="appointment" items="${appointments}">
                    <div class="col-md-6">
                        <div class="card animate__animated animate__fadeInUp">
                            <div class="card-header">Appointment Details</div>
                            <div class="card-body">
                                <div class="projcard-subtitle"><strong>Doctor:</strong> ${appointment.doctor.firstname} ${appointment.doctor.lastname}</div>
                                <div class="projcard-subtitle"><strong>Start time:</strong> ${appointment.startTime}</div>
                                <div class="projcard-subtitle"><strong>End time:</strong> ${appointment.endTime}</div>
                                <div class="projcard-subtitle"><strong>Status:</strong> ${appointment.status}</div>
                            </div>
                            <div class="card-footer">Stay Healthy!</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="no-appointments animate__animated animate__fadeIn">No appointments</div>
        </c:otherwise>
    </c:choose>

    <div class="text-center">
        <a href="${pageContext.request.contextPath}/appointment/choose-specialties" class="btn btn-primary animate__animated animate__bounceIn">New appointment</a>
    </div>

    <div class="text-center">
        <a href="${pageContext.request.contextPath}/admin/back-balance" class="back-link animate__animated animate__fadeInUp">
            <span>Back</span>
        </a>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>




