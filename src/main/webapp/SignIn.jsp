<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>signIn Page</title>
        <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script> -->
        <link rel="stylesheet" href="Sign In.css">
        <script>
            function validateForm() {
                var name = document.myForm.name.value;
                var password = document.myForm.password.value;

                if (username == null || username == "") {
                    alert("Name can't be blank");
                    return false;
                } else if (password.length < 6) {
                    alert("Password must be at least 6 characters long.");
                    return false;
                }
            }  
        </script>



    </head>

    <body>

        <section>



            <div class="box">
                <div class="square" style="--i:0;"></div>
                <div class="square" style="--i:1;"></div>
                <div class="square" style="--i:2;"></div>
                <div class="square" style="--i:3;"></div>
                <div class="square" style="--i:4;"></div>
                <div class="container">
                    <div class="form">
                        <h2>Sign-In Form</h2>
                        <form action="/login" method="post" onclick="validateform()">
                            <div class="inputBox">
                                <input type="text" id="username" placeholder="Enter Your UserName" name="username"
                                    required>
                            </div>
                            <div class="inputBox">
                                <input type="Password" id="password" placeholder="Password" name="password" required>



                                <div class="button">

                                    <input type="submit" value="login">
                                </div>

                                <p class="forget">Don't have an account?
                                    <a href="registration.jsp" target="blank">Click Here</a>
                                </p>



                        </form>
                    </div>

                    <div class="bubbles">
                        <img src="./images/bubble.png">
                        <img src="./images/bubble.png">
                        <img src="./images/bubble.png">
                        <img src="./images/bubble.png">
                        <img src="./images/bubble.png">
                        <img src="./images/bubble.png">
                        <img src="./images/bubble.png">
                    </div>
                </div>

            </div>
        </section>


    </body>

    </html>