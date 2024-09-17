<!DOCTYPE html>
<html lang="en">
<head>
    <title>Welcome</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <!-- Bootstrap CSS v5.2.1 -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
            crossorigin="anonymous"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
    />
    <style>
        body,
        html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            height: 100%;
            overflow-x: hidden;
        }
        .search-button {
            background-color: transparent;
            border: none;
            border-radius: 8px;
            color: white;
            cursor: pointer;
            font-size: 27px;
            padding: 7px;
            transition: background-color 0.3s ease;
        }

        .button_hover {
            transition: background-color 0.3s ease;
            background-color: rgba(255, 255, 255, 0.301);
            border-radius: 8px;
            text-align: center;
            width: 140px;
            height: 40px;
            font-size: 14px;
            border: none;
            padding: 7px;
            border: 1px solid white;
            color: white;
        }

        .header {
            background-color: rgba(255, 255, 255, 0.295) !important;
            position: absolute;
            top: 0;
            width: 100%;
            z-index: 2;
            color: white !important;
        }

        .contact-info {
            display: flex;
            flex-direction: column;
        }

        .nav {
            color: white !important;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .slider {
            position: relative;
            width: 100%;
            height: 100vh;
            overflow: hidden;
        }

        .slide {
            position: absolute;
            width: 100%;
            height: 100%;
            display: none;
            align-items: center;
            background-size: cover;
            background-position: center;
        }

        .slide img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            position: absolute;
            top: 0;
            left: 0;
            z-index: -1;
        }

        .slide .text h1 {
            font-size: 36px;
            font-weight: bold;

            margin-bottom: 20px;
            color: white;
            max-width: 400px;
        }

        .slide .text button {
            margin: 5px;
            padding: 10px 20px;
            border: none;
            color: white;
            cursor: pointer;
            border-radius: 7px;
        }

        .active {
            display: flex;
            animation: fadeIn 1s ease-in-out;
        }

        li {
            list-style: none;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .login {
            border-radius: 10px;
            text-align: center;
            border: none;
            color: white;
            background-color: #59d4fb;
            padding: 10px;
            width: 100px;
        }

        .text {
            margin-top: 20px;
            margin-left: 100px;
        }
    </style>
</head>
<body>
<main>
    <div class="slider">
        <header class="header">
            <div class="d-flex justify-content-between align-items-center pt-3">
                <ul class="d-flex gap-5">
                    <li>
                        Location: 121 Wallstreet Street, NY , USA
                    </li>
                    <li>Email:info@beclinic.com</li>
                </ul>
                <ul class="d-flex gap-3 pe-4 align-items-center">
                    <li>For emergency cases: 103</li>
                    <form action="${pageContext.request.contextPath}/auth/login" method="get">
                        <button class="login">Login</button>
                    </form>


                    <i
                            style="cursor: pointer; font-size: 25px;"
                            class="fa-solid fa-magnifying-glass"
                    ></i>
                </ul>
            </div>
            <hr />
            <nav class="nav">
                <ul class="d-flex gap-3 align-items-center">
                    <li>
                        <img
                                src="https://ld-wp73.template-help.com/wordpress/prod_13983/v3/wp-content/uploads/2021/12/logo.png"
                                alt=""
                        />
                    </li>
                    <li>Always glad to help</li>
                </ul>
            </nav>
        </header>
        <div class="slide active">
            <img
                    src="https://ld-wp73.template-help.com/wordpress/prod_13983/v3/wp-content/uploads/2019/03/main-slider-img-1.jpg"
                    alt="Doctor Image 1"
            />
            <div class="text">
                <h1>Bringing Health to life for the whole family</h1>
                <button style="background-color: #59d4fb;">
                    <a href="${pageContext.request.contextPath}/auth/register" class="back-button">REGISTER</a>
                </button>

            </div>
        </div>
        <div class="slide">
            <img
                    src="https://ld-wp73.template-help.com/wordpress/prod_13983/v3/wp-content/uploads/2019/03/main-slider-img-2.jpg"
                    alt="Doctor Image 2"
            />
            <div class="text">
                <h1>Your Health, Our Priority</h1>
                <button style="background-color: #59d4fb;">
                    <a href="${pageContext.request.contextPath}/auth/register" class="back-button">REGISTER</a>
                </button>
            </div>
        </div>

        <div class="slide">
            <img
                    src="https://ld-wp73.template-help.com/wordpress/prod_13983/v3/wp-content/uploads/2019/03/main-slider-img-3.jpg"
                    alt="Doctor Image 2"
            />
            <div class="text">
                <h1>Your Health, Our Priority</h1>
                <button style="background-color: #59d4fb;">
                    <a href="${pageContext.request.contextPath}/auth/register" class="back-button">REGISTER</a>
                </button>
            </div>
        </div>
    </div>
</main>

<script>
    let currentSlide = 0;
    const slides = document.querySelectorAll(".slide");

    function showSlide(index) {
        slides.forEach((slide, i) => {
            slide.classList.remove("active");
            if (i === index) {
                slide.classList.add("active");
            }
        });
    }

    function nextSlide() {
        currentSlide = (currentSlide + 1) % slides.length;
        showSlide(currentSlide);
    }

    setInterval(nextSlide, 4000);

    document.addEventListener("DOMContentLoaded", () => {
        showSlide(currentSlide);
    });
</script>
<script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"
></script>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+"
        crossorigin="anonymous"
></script>
</body>
</html>

