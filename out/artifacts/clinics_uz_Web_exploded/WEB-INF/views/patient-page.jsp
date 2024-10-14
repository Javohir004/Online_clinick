<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Patient</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <link
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap"
            rel="stylesheet"
    />
    <link
            rel="stylesheet"
            href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <style>
        body {
            font-family: "Roboto", sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }

        .navbar {
            background-image: url("https://img.freepik.com/free-vector/blue-medical-background-with-hexagonal-shape-design_1017-26839.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            width: 310px;
            color: #807d88;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            border-right: 1px solid #ddd;
            position: relative;
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
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
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
            overflow: hidden;
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
            background-color: rgba(0, 0, 0, 0.5);
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
            color: #333;
            font-weight: 700;
        }

        .back-link {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: #69aff5; /* dark blue */
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s;
            cursor: pointer;
            z-index: 99;
        }

        .notification {
            background-color: #f8f9fa;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px;
            margin: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
            position: relative;
            padding-left: 40px;
        }

        .notification .icon {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 20px;
            color: #007bff;
        }
    </style>
</head>
<body>
<a href="${pageContext.request.contextPath}/" class="back-link"
>Back to Login</a
>
<div class="navbar">
    <img
            src="https://i.pinimg.com/564x/74/ea/5a/74ea5afad2388297aa6222d92efd3b67.jpg"
            alt="User Photo"
    />
    <h2>${user.firstname}</h2>
    <h2>${user.lastname}</h2>
    <h3>${user.email}</h3>
    <h4>PATIENT</h4>
    <div class="menu">
        <button>
            <a href="${pageContext.request.contextPath}/appointment/show"
            >My appointments</a
            >
        </button>
        <button>
            <a href="${pageContext.request.contextPath}/admin/balance">Balance</a>
        </button>
        <button>
            <a href="${pageContext.request.contextPath}/user-profile"
            >My Profile</a
            >
        </button>
        <button>
            <a
                    href="${pageContext.request.contextPath}/accepted-requests/next-page"
            >My diagnosis</a
            >
        </button>
    </div>
</div>
<div class="main-content">
    <div class="info-box">
        <strong>Hello, ${user.firstname} ${user.lastname}!</strong>
        <p>
            Welcome to our clinic. We're happy to have you and ready to assist
            with your health needs.
        </p>
        <p>
            To view your scheduled appointments and create new ones, click the "My
            Appointments" button.
        </p>
        <p>
            If you want to quickly and securely top up your bank account for using
            our services, click the "My Balance" button.
        </p>
        <p>
            To manage your profile, change or view your information, click the 'My
            Profile' button.
        </p>
        <p>
            To view information about diagnoses, prescriptions, and
            hospitalizations, click the "My Diagnosis" button.
        </p>
    </div>
    <c:forEach items="${notifications}" var="notification">
        <div class="notification">
            <i class="fas fa-bell icon"></i>
            <strong>Doctor: ${notification.doctor_fio}</strong>
            <div>Start time: ${notification.appointment_start}</div>
            <div>End time: ${notification.appointment_end}</div>
        </div>
    </c:forEach>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>




