<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Doctor Dashboard</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
            rel="stylesheet"
    />
    <style>
        body {
            font-family: "Roboto", sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
            position: relative;
        }

        .navbar {
            background-image: url("https://img.freepik.com/free-vector/blue-medical-background-with-hexagonal-shape-design_1017-26839.jpg");
            background-repeat: no-repeat;
            background-size: 300% 100%;
            object-fit: cover;
            width: 310px;
            color: #807d88;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px 0;
            border-right: 1px solid #ddd;
        }

        .navbar img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            object-fit: cover;
        }

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
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
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

        .info-box {
            position: relative;
            border-radius: 15px;
            padding: 40px;
            max-width: 800px;
            text-align: center;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
            font-size: 18px;
            color: white;
            margin: 120px 0;
            background: rgba(0, 0, 0, 0.6);
        }

        .info-box::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url("https://png.pngtree.com/thumb_back/fh260/background/20210924/pngtree-health-care-abstract-light-effect-icon-decoration-image_906585.png");
            background-size: cover;
            background-position: center;
            filter: blur(8px);
            z-index: 0;
        }

        .info-box::after {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: 1;
        }

        .info-box * {
            position: relative;
            z-index: 2;
        }

        .info-box p {
            margin: 20px 0;
            line-height: 1.6;
            font-weight: 400;
        }

        .info-box strong {
            display: block;
            margin-bottom: 30px;
            font-size: 24px;
            color: black;
            font-weight: 700;
        }

        .back-link {
            position: absolute;
            top: 80px; /* Adjust as needed to align with the menu */
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
            <a href="${pageContext.request.contextPath}/appointment/requests"
            >Incoming Requests</a
            >
        </button>
        <button>
            <a href="${pageContext.request.contextPath}/accepted-requests/show"
            >New Diagnose</a
            >
        </button>
        <button>
            <a href="${pageContext.request.contextPath}/user-profile"
            >My Profile</a
            >
        </button>
    </div>
    <a href="${pageContext.request.contextPath}/" class="back-link">Back to Login</a>
</div>
<div class="main-content">
    <div class="info-box">
        <strong>Welcome, ${user.firstname} ${user.lastname}!</strong>
        <p>
            In this section, you can manage your information, update your details,
            and check your appointment schedule.
        </p>
        <p>
            You can manage your schedule, accept or decline appointment requests
            from patients. To use this service, click the 'Incoming requests'
            button.
        </p>
        <p>
            To manage your profile, change or view your information, click the 'My
            profile' button.
        </p>
        <p>
            To write a new diagnosis and prescriptions for patients you have
            already seen, click the 'New diagnosis' button.
        </p>
    </div>
    <c:choose>
        <c:when test="${not empty appointments}">
            <a
                    href="${pageContext.request.contextPath}/appointment/new-appointments"
                    class="notification-bell"
            >
                <i class="fas fa-bell"></i>
                <span class="badge">${fn:length(appointments)}</span>
            </a>
        </c:when>
        <c:otherwise>
            <a
                    href="${pageContext.request.contextPath}/appointment/new-appointments"
                    class="notification-bell"
                    style="color: red;"
            >
                <i class="fas fa-bell"></i>
            </a>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>






