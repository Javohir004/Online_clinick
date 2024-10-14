
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Accepted Requests</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* General Styles */
        body {
            font-family: sans-serif;
            margin: 0;
            display: flex;
            background: linear-gradient(to bottom right, #cce5ff, #b3d9ff); /* Light blue gradient */
            height: 100vh; /* Ensure body takes full height */
            overflow: hidden; /* Prevent scrolling */
        }

        /* Navbar Styles */
        .navbar {
            background-image: url("https://img.freepik.com/free-vector/blue-medical-background-with-hexagonal-shape-design_1017-26839.jpg");
            background-repeat: no-repeat;
            background-size: cover; /* Cover the full width and height */
            color: #807d88;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px 0;
            border-right: 1px solid #ddd;
            height: 100vh; /* Full height of viewport */
            width: 310px;
            box-sizing: border-box; /* Include padding and border in width and height */
            position: fixed; /* Fix the navbar to the left side */
            left: 0; /* Align to the left edge */
            top: 0; /* Align to the top edge */
        }

        /* Main Container Styles */
        .container {
            display: flex;
            flex: 1;
            margin-left: 310px; /* Space for the fixed navbar */
            width: calc(100% - 310px); /* Adjust width to account for the fixed navbar */
        }

        .main-content {
            flex: 1; /* Take up remaining space */
            padding: 20px;
            overflow-y: auto; /* Allow scrolling in the main content */
        }

        .navbar img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-bottom: 10px;
        }

        .navbar h2, .navbar h3, .navbar h4 {
            margin: 5px 0;
            text-align: center;
        }

        .navbar .menu {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            padding: 0;
        }

        .navbar .menu button {
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

        .navbar .menu button:hover {
            transform: translateY(-8px);
        }

        .navbar .menu button a {
            text-decoration: none;
            color: rgb(95, 94, 94);
        }

        .navbar .back-link {
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: #807d88;
        }

        /* Accordion Styles */
        .accordion-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr); /* Two columns */
            gap: 10px; /* Space between accordion items */
        }

        .accordion {
            background-color: rgba(173, 216, 230, 0.5); /* Transparent light blue */
            color: #444;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            transition: 0.4s;
            border-radius: 12px; /* Rounded corners */
            border-bottom: 1px solid #ddd;
        }

        .active, .accordion:hover {
            background-color: rgba(200, 230, 255, 0.7); /* Slightly more opaque on hover */
        }

        .panel {
            padding: 0 18px;
            display: none;
            background-color: white;
            overflow-y: auto;
            max-height: 400px;
            border-top: 1px solid #ddd;
            border-radius: 0 0 12px 12px; /* Rounded bottom corners */
        }

        .panel p {
            margin: 0;
            padding: 10px 0;
        }

        .btn-select {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 4px;
        }

        .btn-select:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="navbar">
    <img
            src="https://i.pinimg.com/564x/e2/1d/42/e21d423f7c1bcea86f1680d47279bd3f.jpg"
            alt="User Photo"
    />
    <h2>${user.firstname}</h2>
    <h2>${user.lastname}</h2>
    <h3>${user.email}</h3>
    <h4>DOCTOR</h4>
    <div class="menu">
        <button>
            <a href="${pageContext.request.contextPath}/appointment/requests">Incoming Requests</a>
        </button>
        <button>
            <a href="${pageContext.request.contextPath}/accepted-requests/show">New Diagnose</a>
        </button>
        <button>
            <a href="${pageContext.request.contextPath}/user-profile">My Profile</a>
        </button>
    </div>
    <a href="${pageContext.request.contextPath}/" class="back-link">Back to Login</a>
</div>
<div class="container">
    <div class="main-content">
        <h1>Accepted Appointments</h1>
        <c:choose>
            <c:when test="${not empty appointments}">
                <div class="accordion-container">
                    <c:forEach var="appointment" items="${appointments}">
                        <button class="accordion">
                                ${appointment.patientFirstname} ${appointment.patientLastname}
                            <br>
                            <fmt:formatDate value="${appointment.startTime}" pattern="yyyy-MM-dd HH:mm:ss" /> -
                            <fmt:formatDate value="${appointment.endTime}" pattern="yyyy-MM-dd HH:mm:ss" />
                        </button>
                        <div class="panel">
                            <p>Patient First Name: ${appointment.patientFirstname}</p>
                            <p>Patient Last Name: ${appointment.patientLastname}</p>
                            <p>Start Time: <fmt:formatDate value="${appointment.startTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                            <p>End Time: <fmt:formatDate value="${appointment.endTime}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
                            <form action="${pageContext.request.contextPath}/accepted-requests/selected-appointment" method="post" style="display:inline;">
                                <input type="hidden" name="appointmentId" value="${appointment.id}">
                                <button type="submit" class="btn-select">SELECT</button>
                            </form>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <p>No accepted appointments available.</p>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script>
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
                panel.style.display = "none";
            } else {
                panel.style.display = "block";
            }
        });
    }
</script>
</body>
</html>



