<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa, #b2ebf2);
            font-family: 'Roboto', sans-serif;
            background-color: #f0f2f5; /* Light background for a clean look */
            color: #333; /* Dark text for readability */
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            padding: 0;
        }
        .container {
            margin-top: 30px;
            text-align: center;
            background: #ffffff; /* White background for contrast */
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
            max-width: 500px; /* Generous width */
            width: 100%; /* Full width for smaller screens */
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px; /* Space between buttons */
        }
        .button {
            background-color: #28a745; /* Green, suitable for medical theme */
            color: #fff;
            border: none;
            padding: 12px 24px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 18px;
            margin: 10px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .button:hover {
            background-color: #218838;
            transform: scale(1.05);
            background: linear-gradient(145deg, #0056b3, #003d7a); /* Darker gradient on hover */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* Subtle shadow change on hover */
        }
        .back-link {
            display: block;
            margin-top: 20px;
            color: #007bff;
            background: #6c757d; /* Grey background for a neutral look */
            color: white;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
            font-size: 18px;
            width: 100%; /* Full width for consistency */
            max-width: 200px; /* Maximum width for buttons */
            transition: all 0.3s ease;
        }
        .back-link:hover {
            text-decoration: underline;
            background: #5a6268; /* Darker grey on hover */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Shadow effect on hover */
        }
    </style>
</head>
<body>
<div class="container animate__animated animate__fadeIn">
    <form action="${pageContext.request.contextPath}/admin/create-doctors" method="post">
        <input type="submit" value="Create Employee" class="button">
    </form>
    <a href="${pageContext.request.contextPath}/admin/show-employee" class="button">
        View Doctors
    </a>
    <a href="${pageContext.request.contextPath}/" class="back-link">
        Back to Login
    </a>
</div>
</body>
</html>

