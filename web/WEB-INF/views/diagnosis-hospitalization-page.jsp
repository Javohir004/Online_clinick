<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diagnosis Details</title>
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
            background-size: cover;
            background-attachment: fixed;
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

        .diagnosis-details {
            padding: 20px;
            border: 1px solid #ddd;
            margin-bottom: 20px;
            border-radius: 15px;
            background-color: #f9f9f9;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .diagnosis-description {
            font-size: 16px; /* уменьшение размера текста */
            font-weight: bold;
            margin-bottom: 10px;
        }

        .prescriptions {
            margin-top: 20px;
            background-color: #e0f7fa; /* небесный цвет */
            padding: 15px;
            border-radius: 10px;
        }

        .prescription {
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
            margin-bottom: 10px;
        }

        .hospitalization-recommendation {
            margin-top: 30px;
            padding: 20px;
            background-color: #f1f1f1;
            border: 1px solid #ccc;
            border-radius: 10px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
            margin-right: 10px;
            transition: background-color 0.3s ease;
        }

        .btn-hospitalization {
            background-color: #4CAF50;
            color: white;
        }

        .btn-hospitalization:hover {
            background-color: #45a049;
        }

        .btn-reject {
            background-color: #f44336;
            color: white;
        }

        .btn-reject:hover {
            background-color: #e53935;
        }

        .no-diagnosis {
            font-size: 18px;
            color: #555;
            margin: 20px;
            text-align: center;
        }

        .message {
            padding: 10px;
            border-radius: 5px;
            background-color: #d4edda; /* Green background */
            color: #155724; /* Dark green text */
            border: 1px solid #c3e6cb; /* Border color */
            margin: 10px 0;
        }

        .error-message {
            padding: 10px;
            border-radius: 5px;
            background-color: #f8d7da; /* Red background */
            color: #721c24; /* Dark red text */
            border: 1px solid #f5c6cb; /* Border color */
            margin: 10px 0;
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
        <h2 class="animate__animated animate__fadeInDown">Diagnosis Details</h2>
    </div>

    <!-- Show messages if present -->
    <c:if test="${not empty successMessage}">
        <div class="message">
            <strong>${successMessage}</strong>
        </div>
    </c:if>

    <c:if test="${not empty failMessage}">
        <div class="error-message">
            <strong>${failMessage}</strong>
        </div>
    </c:if>

    <c:if test="${empty diagnoses}">
        <div class="no-diagnosis">
            <h3>The doctor hasn't made a diagnosis yet</h3>
        </div>
    </c:if>

    <c:if test="${not empty diagnoses}">
        <h2>Diagnosis and Prescription Details</h2>
        <c:forEach var="diagnosis" items="${diagnoses}">
            <div class="diagnosis-details animate__animated animate__fadeInUp">
                <div class="diagnosis-description">Description: ${diagnosis.description}</div>
                <div class="prescriptions">
                    <h3>Prescriptions:</h3>
                    <c:forEach var="prescription" items="${diagnosis.prescriptions}">
                        <div class="prescription">
                            <div>Medicine: ${prescription.medicine}</div>
                            <div>Dosage: ${prescription.dosage}</div>
                            <div>Duration: ${prescription.duration}</div>
                        </div>
                    </c:forEach>
                </div>
                <c:if test="${diagnosis.hospitalization}">
                    <div class="hospitalization-recommendation">
                        <c:if test="${diagnosis.agreedToHospitalization == null}">
                            The doctor recommends hospitalization.
                            <form method="post">
                                <input type="hidden" name="diagnosisId" value="${diagnosis.id}">
                                <input type="hidden" name="decision" value="accept">
                                <button type="submit" formaction="${pageContext.request.contextPath}/create-room/accept"
                                        class="btn btn-hospitalization">Accept hospitalization
                                </button>
                            </form>
                            <form method="post">
                                <input type="hidden" name="diagnosisId" value="${diagnosis.id}">
                                <input type="hidden" name="decision" value="reject">
                                <button type="submit" formaction="${pageContext.request.contextPath}/create-room/reject"
                                        class="btn btn-reject">Refuse hospitalization
                                </button>
                            </form>
                        </c:if>
                    </div>
                </c:if>
            </div>
        </c:forEach>
    </c:if>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>




