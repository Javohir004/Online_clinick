<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>LogIn</title>
    <link rel="stylesheet" href="styles.css"/>
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
        background: linear-gradient(rgb(154, 216, 239), rgb(87, 230, 234));
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

    .logout-box {
        padding: 100px;
        width: 30%;
    }

    .logout-box h2 {
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }

    .logout-box label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    .logout-box input,
    .logout-box select {
        width: calc(100% - 20px);
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .logout-box button {
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

    .logout-box button:hover {
        background: linear-gradient(135deg, #0069d9, #004085); /* Градиентный фон при наведении */
        transform: translateY(-2px); /* Легкий эффект поднятия */
    }

    .logout-box button:active {
        background: linear-gradient(135deg, #0056b3, #003d6b); /* Градиент при нажатии */
        transform: translateY(0); /* Возврат к исходному положению */
    }

    .logout-box button:focus {
        outline: none;
        box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.5); /* Подсветка при фокусе */
    }


    .image-container {
        width: 70%;
        position: relative;
    }

    .image-container img {
        width: 150%;
        height: 100%;
        background-position: center;
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
</style>
<body>
<div class="container">
    <div class="logout-box">
        <h2>Sign In</h2>

        <c:if test="${not empty error}">
            <div class="error-message">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/auth/login" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <a href="${pageContext.request.contextPath}/auth/register" class="back-button">Register</a>
    </div>
    <div class="image-container">
        <img
                src="https://i.pinimg.com/564x/95/61/17/9561170b103500ff75155cfb1971cdca.jpg"
                alt="Doctor Image"
        />
    </div>
</div>
</body>
</html>



