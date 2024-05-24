<%-- 
    Document   : register
    Created on : Nov 18, 2023, 9:29:44 PM
    Author     : acer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Register</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

            @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap');

            *{
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Montserrat', sans-serif;
            }

            #logo-link {
                position: absolute;
                top: 20px;
                left: 20px;
                display: flex;
                align-items: center;
            }
            #logo {
                width: 100px;
                height: 100px;
            }
            #welcome-text {
                margin-left: 10px;
            }

            body{
                background-color: #d5d4d4;
                /* background: radial-gradient(circle at center, #4f4f4f 0%, #ffffff 100%); */
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                height: 100vh;
            }

            .container{
                background-color: #fff;
                border-radius: 30px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.35);
                position: relative;
                overflow: hidden;
                width: 768px;
                max-width: 100%;
                min-height: 600px;
            }

            .container p{
                font-size: 16px;
                line-height: 20px;
                letter-spacing: 0.3px;
                margin: 20px 0;
            }

            .container span{
                font-size: 12px;
            }

            .container a{
                color: #333;
                font-size: 13px;
                text-decoration: none;
                margin: 15px 0 10px;
            }

            .container button{
                background-color: #7a7a7a;
                color: #fff;
                font-size: 12px;
                padding: 10px 45px;
                border: 1px solid transparent;
                border-radius: 8px;
                font-weight: 600;
                letter-spacing: 0.5px;
                text-transform: uppercase;
                margin-top: 10px;
                cursor: pointer;
            }

            .container button.hidden{
                background-color: #7a7a7a;
                border-color: #fff;
            }

            .container form{
                background-color: #fff;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                padding: 0 40px;
                height: 100%;
            }

            .container input{
                background-color: #d1d1d1;
                border: none;
                margin: 8px 0;
                padding: 10px 15px;
                font-size: 16px;
                border-radius: 8px;
                width: 100%;
                outline: none;
            }

            .form-container{
                position: absolute;
                top: 0;
                height: 100%;
                transition: all 0.6s ease-in-out;
            }

            .sign-in{
                left: 0;
                width: 50%;
                z-index: 2;
            }

            .container.active .sign-in{
                transform: translateX(100%);
            }

            .sign-up{
                left: 0;
                width: 50%;
                opacity: 0;
                z-index: 1;
            }

            .container.active .sign-up{
                transform: translateX(100%);
                opacity: 1;
                z-index: 5;
                animation: move 0.6s;
            }

            @keyframes move{
                0%, 49.99%{
                    opacity: 0;
                    z-index: 1;
                }
                50%, 99%{
                    opacity: 1;
                    z-index: 5;
                }
            }

            .social-icons{
                margin: 20px 0;
            }

            .social-icons a{
                border: 1px solid #ccc;
                border-radius: 20%;
                display: inline-flex;
                justify-content: center;
                align-items: center;
                margin: 0 3px;
                width: 40px;
                height: 40px;
            }

            .toggle-container{
                position: absolute;
                top: 0;
                left: 50%;
                width: 50%;
                height: 100%;
                overflow: hidden;
                transition: all 0.6s ease-in-out;
                border-radius: 150px 0 0 100px;
                z-index: 1000;
            }

            .container.active .toggle-container{
                transform: translateX(-100%);
                border-radius: 0 150px 150px 0;
            }

            .toggle{
                background-color: #6e6e6e;
                height: 100%;
                background: linear-gradient(to right,rgb(98, 110, 96), rgb(98, 110, 96));
                color: #fff;
                position: relative;
                left: -100%;
                height: 100%;
                width: 200%;
                transform: translateX(0);
                transition: all 0.6s ease-in-out;
            }

            .container.active .toggle{
                transform: translateX(50%);
            }

            .toggle-panel{
                position: absolute;
                width: 50%;
                height: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                padding: 0 30px;
                text-align: center;
                top: 0;
                transform: translateX(0);
                transition: all 0.6s ease-in-out;
            }

            .toggle-left{
                transform: translateX(-200%);
            }

            .container.active .toggle-left{
                transform: translateX(0);
            }

            .toggle-right{
                right: 0;
                transform: translateX(0);
            }

            .container.active .toggle-right{
                transform: translateX(200%);
            }



        </style>
    </head>
    <script>
        window.onload = function () {
            const container = document.getElementById('container');
            const registerBtn = document.getElementById('register');
            const loginBtn = document.getElementById('login');

            registerBtn.addEventListener('click', () => {
                container.classList.add("active");
            });

            loginBtn.addEventListener('click', () => {
                container.classList.remove("active");
            });
        }

    </script>

    <body>

        <div class="container" id="container">
            <div class="form-container sign-up">
                <form action="login" method="post">
                    <h1>Create Account</h1>
                    <input type="hidden" name="action" value="createAccount">  
                    <input type="email" name="email" value="${customer.customer_email}" placeholder="Email"><br>
                    <input type="name" name="name" value="${customer.customer_name}" placeholder="Name"><br>
                    <input type="text" name="address" value="${customer.address}" placeholder="Address"><br>
                    <input type="text" name="password" value="${customer.customer_password}" placeholder="Password"><br> 
                    <input type="tel" name="phonenumber" value="${customer.phone_number}" placeholder="Phone number"><br>     
                    <input type="submit" value="SIGN UP" ></input>
                </form>
            </div>
            <div class="form-container sign-in">
                <form method="post" action="login">
                    <h1>Sign In</h1>
                    <span>${error}</span>
                    <input type="hidden" name="action" value="signin">  
                    <input type="name" name="email" value="${customer.customer_email}" placeholder="Email"><br>
                    <input type="text" name="password" value="${customer.customer_password}" placeholder="Password"><br>
                    <span>${errorMessage}</span>
                    <a href="#">Forget Your Password?</a>
                    <input type="submit" value="SIGN IN" ></input>
                </form>
            </div>
            <div class="toggle-container">
                <div class="toggle">
                    <div class="toggle-panel toggle-left">
                        <h1>Welcome Back!</h1>
                        <p>Enter your personal details to use all of site features</p>
                        <button class="hidden" id="login">Sign In</button>
                    </div>
                    <div class="toggle-panel toggle-right">
                        <h1>Hello, Friend!</h1>
                        <p>Register with your personal details to use all of site features</p>
                        <button class="hidden" id="register">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

