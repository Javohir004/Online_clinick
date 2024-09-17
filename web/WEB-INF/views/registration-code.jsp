<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Code</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            background: linear-gradient(135deg, #87CEFA, #B0E0E6); /* Light blue gradient */
            display: flex;
            justify-content: center;
            align-items: center;
            animation: gradientAnimation 10s ease infinite;
        }

        @keyframes gradientAnimation {
            0% { background: linear-gradient(135deg, #87CEFA, #B0E0E6); }
            50% { background: linear-gradient(135deg, #B0E0E6, #87CEFA); }
            100% { background: linear-gradient(135deg, #87CEFA, #B0E0E6); }
        }

        .container {
            background-color: rgba(211, 211, 211, 0.8); /* Semi-transparent gray */
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 300px;
            text-align: center;
        }

        .input-data {
            position: relative;
            margin-bottom: 20px;
        }

        .input-data input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background: #fff;
            font-size: 16px;
        }

        .input-data label {
            position: absolute;
            top: 10px;
            left: 10px;
            font-size: 16px;
            color: #333;
            transition: 0.3s ease;
        }

        .input-data input:focus + label,
        .input-data input:not(:placeholder-shown) + label {
            top: -10px;
            left: 10px;
            font-size: 12px;
            color: #007BFF;
        }

        .submit-btn {
            margin-top: 20px;
        }

        .submit-btn input[type="submit"] {
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .message {
            color: red;
            margin-bottom: 20px;
            font-size: 18px;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="message">
        <h4>${message}</h4>
    </div>
    <form action="${pageContext.request.contextPath}/auth/registration-code" method="post">
        <div class="input-data">
            <input type="text" name="code" required placeholder=" ">
            <label for="code">Code</label>
        </div>
        <div class="submit-btn">
            <input type="submit" value="Submit">
        </div>
    </form>
</div>

</body>
</html>

