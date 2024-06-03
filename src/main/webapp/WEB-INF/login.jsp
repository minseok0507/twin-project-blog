<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: minseok
  Date: 24. 6. 1.
  Time: 오전 1:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400..700&family=Dancing+Script:wght@400..700&family=East+Sea+Dokdo&family=Jua&family=Gaegu&family=Gamja+Flower&family=Pacifico&family=Single+Day&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Yeseva+One&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=Yeseva+One&display=swap"
          rel="stylesheet">
    <style>
        h1, h2, h3, h4, h5, h6 {
            font-family: Yeseva One, serif;
        }
        input[type=text],
        input[type=password],
        input[type=email]
        {
            color: black;
        }
        .login_error{
            color: red;
            display: none;
        }
    </style>
    <title>Title</title>
</head>
<body>


<div class="flex flex-col min-h-screen">
    <header class="bg-gray-900 text-white py-4 shadow-md">
        <div class="container mx-auto flex items-center justify-between">
            <a class="flex items-center gap-2" href="<c:url value="/"/>">
                <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="h-6 w-6"
                >
                    <path d="m8 3 4 8 5-5 5 15H2L8 3z"></path>
                </svg>
                <span class="text-xl font-bold">Blog</span>
            </a>
            <nav class="hidden md:flex items-center gap-4">
                <a class="hover:underline" href="<c:url value="/"/>">
                    Blog
                </a>
                <a class="hover:underline" href="<c:url value="/login"/>">
                    Login
                </a>
            </nav>
            <button class="inline-flex items-center justify-center whitespace-nowrap text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 border border-input bg-background hover:bg-accent hover:text-accent-foreground h-9 rounded-md px-3 md:hidden">
                <svg
                        xmlns="http://www.w3.org/2000/svg"
                        width="24"
                        height="24"
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="2"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        class="h-5 w-5"
                >
                    <line x1="4" x2="20" y1="12" y2="12"></line>
                    <line x1="4" x2="20" y1="6" y2="6"></line>
                    <line x1="4" x2="20" y1="18" y2="18"></line>
                </svg>
                <span class="sr-only">Toggle menu</span>
            </button>
        </div>
    </header>


    <main class="container max-w-lg mt-16">
        <div class="border rounded-lg shadow-sm overflow-hidden" id="login-form">
            <div class="bg-gray-900 text-white p-6">
                <h2 class="text-2xl font-bold mb-4">Login</h2>
                <form class="space-y-4">
                    <div class="login_error">
                        Invalid username or password
                    </div>
                    <div>
                        <label
                                class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                                for="login_username"
                        >
                            username
                        </label>
                        <input
                                class="flex h-10 rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 w-full"
                                type="text"
                                id="login_username"
                                placeholder="Enter your username"
                        />
                    </div>
                    <div>
                        <label
                                class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                                for="login_password"
                        >
                            Password
                        </label>
                        <input
                                class="flex h-10 rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 w-full"
                                type="password"
                                id="login_password"
                                placeholder="Enter your password"
                        />
                    </div>
                    <button
                            class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 w-full"
                            type="button"
                            onclick="login()"
                    >
                        Login
                    </button>
                    <div class="text-center">
                        <button type="button" class="text-blue-500 hover:underline" onclick="changeLogin()">
                            Don't have an account? Register
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="border rounded-lg shadow-sm overflow-hidden" id="register-form">
            <div class="bg-gray-900 text-white p-6">
                <h2 class="text-2xl font-bold mb-4">Register</h2>
                <form class="space-y-4" id="registerForm">
                    <div>
                        <label
                                class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                                for="username"
                        >
                            UserName
                        </label>
                        <input
                                class="flex h-10 rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 w-full"
                                type="text"
                                id="username"
                                placeholder="Enter your username"
                        />
                    </div>
                    <div>
                        <label
                                class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                                for="email"
                        >
                            Email
                        </label>
                        <input
                                class="flex h-10 rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 w-full"
                                type="email"
                                id="email"
                                placeholder="Enter your email"
                        />
                    </div>
                    <div>
                        <label
                                class="text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
                                for="password"
                        >
                            Password
                        </label>
                        <input
                                class="flex h-10 rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 w-full"
                                type="password"
                                id="password"
                                placeholder="Enter your password"
                        />
                    </div>
                    <button
                            class="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2 w-full"
                            type="button"
                            onclick="registUser()"
                    >
                        Register
                    </button>
                    <div class="text-center">
                        <button type="button" class="text-blue-500 hover:underline" onclick="changeRegister()">
                            Already have an account? Login
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </main>

    <script>
        registerForm = document.getElementById("register-form");
        loginForm = document.getElementById("login-form");
        registerForm.style.display = "none";

        function changeRegister() {
            registerForm.style.display = "none";
            loginForm.style.display = "block";
        }

        function changeLogin() {
            registerForm.style.display = "block";
            loginForm.style.display = "none";
        }


        function registUser() {
            const username = document.querySelector('#username').value;
            const email = document.querySelector('#email').value;
            const password = document.querySelector('#password').value;

            if (username === "" || email === "" || password === ""){
                alert("Enter your content");
                return;
            }
            if (!isValidEmail(email)) {
                alert("Invalid email format");
                return;
            }
            fetch('/login/regist', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: new URLSearchParams({
                        username: username,
                        email: email,
                        password: password
                    })
                })
                    .then(response => {
                        if (response.ok) {
                            // 등록 성공 처리
                            alert("ID created");
                            window.location.href = '/login';
                        } else {
                            // 등록 실패 처리
                            alert('Registration failed. Please try again.');
                        }
                    })
                    .catch(error => {
                        // 네트워크 오류 처리
                        console.error('Error:', error);
                        alert('An error occurred. Please try again later.');
                    });
        }

        function isValidEmail(email) {
            // 이메일 정규표현식
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            // 정규표현식을 사용해서 이메일 형식 검사
            return emailRegex.test(email);
        }

        function login(){
            const login_username = document.querySelector('#login_username').value;
            const login_password = document.querySelector('#login_password').value;

            if (login_username === "" || login_password === ""){
                alert("Enter your content")
                return;
            }

            fetch('/login/action', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    login_username: login_username,
                    login_password: login_password
                })
            })
                .then(response => {
                    console.log(response);
                    if (response.ok) {
                        // 등록 성공 처리
                        alert("Welcome " + login_username);
                        window.location.href = '/';
                    } else {
                        // 등록 실패 처리
                        document.getElementsByClassName("login_error")[0].style.display = "block";
                    }
                })
                .catch(error => {
                    // 네트워크 오류 처리
                    console.error('Error:', error);
                    alert('An error occurred. Please try again later.');
                });


        }

    </script>


    <footer class="bg-gray-900 text-white py-6 mt-auto">
        <div class="container mx-auto flex items-center justify-between">
            <p>© 2023 Blog. All rights reserved.</p>
            <nav class="flex items-center gap-4">
                <a class="hover:underline" href="#">
                    Privacy
                </a>
                <a class="hover:underline" href="#">
                    Terms
                </a>
                <a class="hover:underline" href="#">
                    About
                </a>
            </nav>
        </div>
    </footer>
</div>


</body>
</html>
