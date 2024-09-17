<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<style>
    body,
    html {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background: -webkit-linear-gradient(
                45deg,
                rgb(154, 216, 239),
                rgb(37, 177, 181)
        );
        background: -moz-linear-gradient(
                45deg,
                rgb(154, 216, 239),
                rgb(37, 177, 181)
        );
        background: linear-gradient(45deg, rgb(154, 216, 239), rgb(37, 177, 181));
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .container {
        display: flex;
        max-width: 1000px;
        width: 100%;
        background: white;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        overflow: hidden;
    }

    .form-container {
        padding: 50px;
        width: 60%;
    }

    .form-container h2 {
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
        text-align: center;
    }

    .form-container label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    .form-container input,
    .form-container select {
        width: calc(100% - 20px);
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .form-container input[type="submit"] {
        width: 100%;
        padding: 10px;
        background: #007bff;
        border: none;
        color: white;
        font-size: 16px;
        cursor: pointer;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .form-container input[type="submit"]:hover {
        background: linear-gradient(
                135deg,
                #0069d9,
                #004085
        ); /* Градиентный фон при наведении */
        transform: translateY(-2px); /* Легкий эффект поднятия */
    }

    .form-container input[type="submit"]:active {
        background: linear-gradient(
                135deg,
                #0056b3,
                #003d6b
        ); /* Градиент при нажатии */
        transform: translateY(0); /* Возврат к исходному положению */
    }

    .form-container input[type="submit"]:focus {
        outline: none;
        box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.5); /* Подсветка при фокусе */
    }

    .form-row {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        margin-bottom: 20px;
    }

    .input-data {
        flex: 1 1 45%;
        display: flex;
        flex-direction: column;
    }

    .input-data label {
        margin-bottom: 5px;
    }

    .underline {
        height: 2px;
        background: #007bff;
        width: 100%;
        margin-top: 5px;
    }

    .error-message {
        color: red;
        text-align: center;
        margin-bottom: 20px;
    }

    .back-button {
        display: block;
        text-align: center;
        margin-top: 10px;
        text-decoration: none;
        color: #007bff;
        font-size: 14px;
        transition: color 0.3s ease;
    }

    .back-button:hover {
        color: #0056b3;
    }

    .image-container img {
        width: 120%;
        height: 100%;
    }
</style>
<body>
<div class="container">
    <div class="form-container">
        <h2>Sign Up</h2>

        <c:if test="${not empty message}">
        <div class="error-message">${message}</div>
        </c:if>


        <form
                action="${pageContext.request.contextPath}/auth/register"
                method="post"
        >
            <div class="form-row">
                <div class="input-data">
                    <label for="firstname">Enter Firstname</label>
                    <input type="text" name="firstname" id="firstname" required />
                    <div class="underline"></div>
                </div>
                <div class="input-data">
                    <label for="lastname">Enter Lastname</label>
                    <input type="text" name="lastname" id="lastname" required />
                    <div class="underline"></div>
                </div>
                <div class="input-data">
                    <label for="username">Enter Username</label>
                    <input type="text" name="username" id="username" required />
                    <div class="underline"></div>
                </div>
                <div class="input-data">
                    <label for="password">Enter Password</label>
                    <input type="password" name="password" id="password" required />
                    <div class="underline"></div>
                </div>
            </div>
            <div class="form-row">
                <div class="input-data">
                    <label for="age">Enter Age</label>
                    <input type="text" name="age" id="age" required />
                    <div class="underline"></div>
                </div>
                <div class="input-data">
                    <label for="gender">Gender</label>
                    <select name="gender" id="gender">
                        <option value="MALE">MALE</option>
                        <option value="FEMALE">FEMALE</option>
                        <option value="OTHER">OTHER</option>
                    </select>
                </div>
                <div class="input-data">
                    <label for="address">Address</label>
                    <input type="text" name="address" id="address" required />
                    <div class="underline"></div>
                </div>
                <div class="input-data">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="text" name="phoneNumber" id="phoneNumber" required />
                    <div class="underline"></div>
                </div>
                <div class="input-data">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" required />
                    <div class="underline"></div>
                </div>
            </div>
            <div class="form-row submit-btn">
                <input type="submit" value="Submit" />
            </div>
        </form>
        <a
                href="${pageContext.request.contextPath}/auth/login"
                class="back-button"
        >Back to Login</a
        >
    </div>
    <div class="image-container">
        <img
                src="https://png.pngtree.com/thumb_back/fw800/background/20220703/pngtree-doctor-utilizing-advanced-computer-interface-for-medical-tasks-photo-image_32306914.jpg"
        />
    </div>
</div>
</body>
</html>

