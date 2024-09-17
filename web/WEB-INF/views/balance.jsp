<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>User Balance</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0');
            background-size: cover;
            background-repeat: no-repeat;
            color: #333;
            display: flex;
            margin: 0;
            height: 100vh;
        }

        .navbar {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 250px;
            border-right: 1px solid #ddd;
            position: fixed;
            height: 100%;
            top: 0;
            left: 0;
        }

        .navbar img {
            border-radius: 50%;
            width: 80px;
            height: 80px;
            object-fit: cover;
        }

        .navbar h3, .navbar h4 {
            margin: 10px 0;
            text-align: center;
        }

        .menu {
            display: flex;
            flex-direction: column;
            width: 100%;
            padding: 0;
            margin-top: 20px;
        }

        .menu button {
            background-color: rgba(255, 255, 255, 0.8);
            width: 100%;
            margin-bottom: 10px;
            border: none;
            padding: 10px;
            font-size: 16px;
            border-radius: 8px;
            transition: transform 0.3s ease;
        }

        .menu button:hover {
            transform: translateY(-5px);
        }

        .menu button a {
            text-decoration: none;
            color: #333;
        }

        .main-content {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 100%;
            max-width: 500px;
            margin-left: 270px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin: auto; /* Центрирование формы */
        }

        .error-message {
            color: red;
            font-weight: bold;
            margin-bottom: 10px;
        }

        form {
            margin-top: 20px;
            width: 100%;
        }

        form label, form input, form button {
            display: block;
            width: 100%;
        }

        input[type="number"], input[type="submit"], button {
            padding: 10px;
            margin-top: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
<div class="navbar">
    <img src="https://i.pinimg.com/564x/74/ea/5a/74ea5afad2388297aa6222d92efd3b67.jpg" alt="User Photo">
    <h3>${user.firstname} ${user.lastname}</h3>
    <h4>${user.email}</h4>
    <div class="menu">
        <button><a href="${pageContext.request.contextPath}/appointment/show">My appointments</a></button>
        <button><a href="${pageContext.request.contextPath}/admin/balance">Balance</a></button>
        <button><a href="${pageContext.request.contextPath}/user-profile">My Profile</a></button>
        <button><a href="${pageContext.request.contextPath}/accepted-requests/next-page">My diagnosis</a></button>
    </div>
</div>

<div class="main-content">
    <h1>User Balance</h1>

    <c:if test="${not empty message}">
        <div class="error-message">${message}</div>
    </c:if>

    <p>Current Balance: ${balance}</p>

    <form action="${pageContext.request.contextPath}/admin/add-balance" method="post">
        <label for="amount">Amount to Add:</label>
        <input type="number" id="amount" name="amount" required>
        <input type="submit" value="Add">
    </form>

    <button type="button" onclick="navigateBack()">Back</button>
</div>

<script>
    function navigateBack() {
        window.location.href = '${pageContext.request.contextPath}/admin/back-balance';
    }
</script>
</body>
</html>

