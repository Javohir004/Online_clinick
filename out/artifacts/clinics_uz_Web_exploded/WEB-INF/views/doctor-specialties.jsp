<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Specialties</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            display: flex;
            background-repeat: no-repeat;
            background-image: url('https://i.pinimg.com/564x/69/8d/24/698d24b367fc44d6392a6d0ba41e04ce.jpg');
            background-size: cover;
            background-position: center;
            min-height: 100vh;
            margin: 0;
            font-family: 'Roboto', sans-serif;
        }

        .navbar {
            background-image: url("https://img.freepik.com/free-vector/blue-medical-background-with-hexagonal-shape-design_1017-26839.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            width: 300px;
            color: #ffffff;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            border-right: 1px solid #ddd;
            position: fixed;
            height: 100vh;
            overflow-y: auto;
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
            color: #ffffff;
        }
        .menu {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
        }
        .menu button {
            background-color: rgba(255, 255, 255, 0.8);
            color: #333;
            width: 100%;
            margin-bottom: 10px;
            border: none;
            padding: 12px;
            font-size: 16px;
            text-align: left;
            border-radius: 8px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .menu button:hover {
            transform: translateY(-4px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        .menu button a {
            text-decoration: none;
            color: inherit;
        }
        .container {
            margin-left: 320px;
            padding: 20px;
            flex: 1;
        }
        .doctor-card {
            border-radius: 12px;
            padding: 20px;
            margin: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            transition: box-shadow 0.3s, transform 0.3s;
            background-color: #ffffff;
        }
        .doctor-card:hover {
            box-shadow: 0 6px 20px rgba(0,0,0,0.3);
            transform: translateY(-5px);
        }
        .select-button {
            background-color: #ffffff2f;
            color: #6c7286;/* Semi-transparent white */
            border: none;
            padding: 10px 20px;
            text-align: center;
            display: inline-block;
            font-size: 14px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Default box shadow */
        }

        .select-button:hover {
            background-color: grey; /* Full white on hover */
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3); /* Darker shadow on hover */
        }
        a{
            color: rgb(58, 58, 58);
            text-decoration: none;
        }

        a:hover{
            text-decoration: none;
            color: #484747;
        }


        .back-link {
            color: white;
            background-color: #dc3545;
            border: none;
            padding: 10px 20px;
            margin-top: 20px;
            border-radius: 7px;
            transition: background-color 0.3s, transform 0.3s;
            display: inline-block;
        }
        .back-link:hover {
            background-color: #c82333;
            transform: translateY(-2px);
        }
        h2 {
            color: #333;
        }
    </style>
</head>
<body class=" bg-light">

<div class="navbar">
    <img src="https://i.pinimg.com/564x/74/ea/5a/74ea5afad2388297aa6222d92efd3b67.jpg" alt="User Photo" />
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
<div class="container">
    <div class="text-center mb-4">
        <h2 class="animate__animated animate__fadeInDown">Specialties</h2>
    </div>
    <div style="display: flex; flex-wrap: wrap; gap: 15px;">
        <button class="select-button">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=ALLERGIST">ALLERGIST</a>
        </button>
        <button class="select-button">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=GASTROENTEROLOGIST">GASTROENTEROLOGIST</a>
        </button>
        <button class="select-button">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=RHEUMATOLOGIST">RHEUMATOLOGIST</a>
        </button>
        <button class="select-button">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=ANESTHESIOLOGIST">ANESTHESIOLOGIST</a>
        </button>
        <button class="select-button">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=ENDOCRINOLOGIST">ENDOCRINOLOGIST</a>
        </button>
        <button class="select-button">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=CARDIOLOGIST">CARDIOLOGIST</a>
        </button>
        <button class="select-button">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=OTOLARYNGOLOGIST">OTOLARYNGOLOGY</a>
        </button>
        <button class="select-button">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=PEDIATRICIAN">PEDIATRICIAN</a>
        </button>
        <button class="select-button">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=THERAPIST">THERAPIST</a>
        </button>
        <button class="select-button">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=NEUROLOGIST">NEUROLOGIST</a>
        </button>
        <button class="select-button">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=SURGEON">SURGEON</a>
        </button>
        <button class="select-button">
            <a href="${pageContext.request.contextPath}/appointment/doctors?specialty=DENTIST">DENTIST</a>
        </button>
    </div>
    <h2 class="text-center mt-4">Doctors by specialty: ${param.specialty}</h2>
    <c:choose>
    <c:when test="${not empty doctors}">
    <div style="display: flex; flex-wrap: wrap;">
        <c:forEach var="doctor" items="${doctors}">
        <div class="doctor-card animate__animated animate__fadeInUp">
            <p><strong>Firstname:</strong> ${doctor.firstname} ${doctor.lastname}</p>
            <p><strong>Age:</strong> ${doctor.age}</p>

            <p><strong>Email:</strong> ${doctor.email}</p>
            <form action="${pageContext.request.contextPath}/appointment/select-doctor" method="post" style="display:inline;">
                <input type="hidden" name="doctorId" value="${doctor.id}">
                <button type="submit" class="select-button">Select</button>
            </form>
        </div>
        </c:forEach>
    </div>
    </c:when>
        <c:otherwise>
            <div class="text-center mt-4">No doctors available for this specialty</div>
        </c:otherwise>
    </c:choose>
    <form action="${pageContext.request.contextPath}/appointment/show" method="post" class="text-center">
        <button type="submit" class="back-link">
            <span>Back</span>
        </button>
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

