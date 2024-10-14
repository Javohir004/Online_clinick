<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Appointment</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            background-color: #e0f7fa; /* Light blue background */
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
            margin-left: 330px; /* Adjusted to account for the navbar width */
            padding: 20px;
        }

        .appointment-table {
            width: 100%;
            height: auto;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            background: linear-gradient(to right, #81d4fa, #4fc3f7); /* Light blue gradient */
        }

        .appointment-table th,
        .appointment-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .appointment-table th {
            background-color: #4fc3f7; /* Darker blue for header */
            color: white;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4); /* Black with opacity */
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .modal-content {
            width: 80%;
            max-width: 600px;
            background-color: rgba(255, 255, 255, 0.9); /* Light transparent background */
            border-radius: 15px;
            padding: 20px;
            margin: auto;
        }

        .modal .close {
            color: #000;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .modal .close:hover,
        .modal .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }

        .panel {
            margin-top: 15px;
        }

        .prescription {
            margin-bottom: 10px;
        }

        .top-right-button {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        .hidden {
            display: none;
        }
    </style>
</head>
<body>
<div class="d-flex">
    <div class="navbar">
        <img src="https://i.pinimg.com/564x/e2/1d/42/e21d423f7c1bcea86f1680d47279bd3f.jpg" alt="User Photo" />
        <h2>${user.firstname}</h2>
        <h2>${user.lastname}</h2>
        <h3>${user.email}</h3>
        <h4>Doctor</h4>
        <div class="menu">
            <button><a href="${pageContext.request.contextPath}/appointment/requests">Incoming Requests</a></button>
            <button><a href="${pageContext.request.contextPath}/accepted-requests/show">New Diagnose</a></button>
            <button><a href="${pageContext.request.contextPath}/user-profile">My Profile</a></button>
        </div>
    </div>

    <div class="main-content">
        <c:choose>
            <c:when test="${not empty message}">
                <div class="message">${message}</div>
            </c:when>
            <c:otherwise>
                <button class="top-right-button btn btn-primary" onclick="showDiagnosisButton()">Start</button>

                <h2>Selected Appointment Details</h2>
                <table class="appointment-table">
                    <tr>
                        <th>Firstname</th>
                        <td>${appointment.patient.firstname}</td>
                    </tr>
                    <tr>
                        <th>Lastname</th>
                        <td>${appointment.patient.lastname}</td>
                    </tr>
                    <tr>
                        <th>Age</th>
                        <td>${appointment.patient.age}</td>
                    </tr>
                    <tr>
                        <th>Gender</th>
                        <td>${appointment.patient.gender}</td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td>${appointment.patient.address}</td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>${appointment.patient.email}</td>
                    </tr>
                    <tr>
                        <th>Phone number</th>
                        <td>${appointment.patient.phoneNumber}</td>
                    </tr>
                </table>

                <div id="createDiagnosisSection" class="hidden">
                    <button id="createDiagnosisButton" class="btn btn-primary" disabled>Create diagnosis</button>
                </div>

                <!-- Modal -->
                <div id="diagnosisModal" class="modal">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <h2>Create Diagnosis</h2>
                        <form id="diagnosisForm" action="${pageContext.request.contextPath}/accepted-requests/createDiagnosis" method="post">
                            <input type="hidden" name="appointmentId" value="${appointment.id}" />
                            <label for="diagnosisDescription">Diagnosis Description:</label>
                            <input type="text" id="diagnosisDescription" name="diagnosisDescription" class="form-control" required /><br />
                            <label for="hospitalization">Hospitalization Recommended:</label>
                            <select id="hospitalization" name="hospitalization" class="form-control" required>
                                <option value="true">Yes</option>
                                <option value="false">No</option>
                            </select><br />
                            <button type="button" id="addPrescription" class="btn btn-secondary">Add Prescription</button>
                            <div id="prescriptionPanel" class="panel"></div>
                            <button type="button" id="submitDiagnosis" class="btn btn-primary">Submit Diagnosis</button>
                        </form>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script>
    function showDiagnosisButton() {
        console.log("Diagnosis button shown");
        document.getElementById("createDiagnosisSection").classList.remove("hidden");
        document.getElementById("createDiagnosisButton").disabled = false;
    }

    document.addEventListener("DOMContentLoaded", function () {
        console.log("DOM fully loaded and parsed");

        document.getElementById("createDiagnosisButton").addEventListener("click", function () {
            console.log("Create Diagnosis button clicked");
            document.getElementById("diagnosisModal").style.display = "flex";
        });

        document.querySelector(".modal .close").addEventListener("click", function () {
            console.log("Modal close button clicked");
            document.getElementById("diagnosisModal").style.display = "none";
        });

        window.addEventListener("click", function (event) {
            if (event.target == document.getElementById("diagnosisModal")) {
                console.log("Outside modal clicked");
                document.getElementById("diagnosisModal").style.display = "none";
            }
        });

        document.getElementById("addPrescription").addEventListener("click", function () {
            console.log("Add Prescription clicked");
            var panel = document.getElementById("prescriptionPanel");
            var newPrescription = document.createElement("div");
            newPrescription.className = "prescription";
            newPrescription.innerHTML =
                '<label for="medicine">Medicine:</label>' +
                '<input type="text" name="medicine" class="form-control" required><br>' +
                '<label for="dosage">Dosage:</label>' +
                '<input type="text" name="dosage" class="form-control" required><br>' +
                '<label for="duration">Duration:</label>' +
                '<input type="text" name="duration" class="form-control" required><br>';
            panel.appendChild(newPrescription);
        });

        document.getElementById("submitDiagnosis").addEventListener("click", function () {
            console.log("Submit Diagnosis clicked");
            var diagnosisForm = document.getElementById("diagnosisForm");
            diagnosisForm.submit();
        });
    });
</script>
</body>
</html>

