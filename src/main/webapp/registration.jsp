<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link rel="stylesheet" href="registration.css">

<script>
 function CloseAndRefresh()
  {
    opener.location.reload(true);
      self.close();
  }
</script>

</head>
<body>
    <section class="logo" >
    <img src="./images/hotwax-systems-logo_fe34b522273d8b9d6ef33253908487bf@2x.png" alt="" class="img">
    </section>

    <div class="container">
        <div class="title"> <b>Registration Form</b></div>
        <form action="Register" method = "post">
            <div class="user-details">


                <div class="input-box">
                    <span class="details">First Name</span>
                    <input type="text" placeholder="Enter your firstName" name="firstName" required>
                </div>
                <div class="input-box">
                    <span class="details">Last Name</span>
                    <input type="text" placeholder="Enter your lastName" name = "lastName"  required>
                </div>
                <div class="input-box">
                    <span class="details">Address</span>
                    <input type="text" placeholder="Enter your Address"  name = "address"   required>
                </div>
                <div class="input-box">
                    <span class="details">City</span>
                    <input type="text" placeholder="Enter your City" name = "city"  required>
                </div>
                <div class="input-box">
                    <span class="details">Zip</span>
                    <input type="text" placeholder="Enter your Pin-Code" name = "zip"  required>
                </div>
                <div class="input-box">
                    <span class="details">State</span>
                    <input type="text" placeholder="Enter your State" name = "state"  required>
                </div>
                <div class="input-box">
                    <span class="details">Country</span>
                    <input type="text" placeholder="Enter your Country" name = "country"  required>
                </div>
                <div class="input-box">
                    <span class="details">Mobile-Number</span>
                    <input type="text" placeholder="Enter your Mobile-Number" name = "phone" required>
                </div>
                <div class="input-box">
                    <span class="details">E-Mail</span>
                    <input type="email" placeholder="Enter your UserName&E-Mail" name = "username"  required>
                </div>


                <div class="input-box">
                    <span class="details">PassWord</span>

                    <input type="password" placeholder="Enter your PassWord" name = "password"
                     pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
 title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>
                </div>
            </div>

            <div class="agree">
                <input type="checkbox" name="check-box" id="checkbox" required>
                <span class="check-box">Check-Box</span>
               
                <div class="button">

                     <a href="Sucess.jsp"><input type="submit" value="submit" onclick="CloseAndRefresh();"> </a>
                            <input type="Reset" value="Reset">

                </div>
            </div>
        </form>
    </div>
    <section>
        <div class="bubbles">
            <img src="./images/bubble.png">
            <img src="./images/bubble.png">
            <img src="./images/bubble.png">
            <img src="./images/bubble.png">
            <img src="./images/bubble.png">
            <img src="./images/bubble.png">
            <img src="./images/bubble.png">
    
        </div>
</body>
<script>
        var myInput = document.getElementById("psw");
        var letter = document.getElementById("letter");
        var capital = document.getElementById("capital");
        var number = document.getElementById("number");
        var length = document.getElementById("length");

        // When the user clicks on the password field, show the message box
        myInput.onfocus = function() {
          document.getElementById("message").style.display = "block";
        }

        // When the user clicks outside of the password field, hide the message box
        myInput.onblur = function() {
          document.getElementById("message").style.display = "none";
        }

        // When the user starts to type something inside the password field
        myInput.onkeyup = function() {
          // Validate lowercase letters
          var lowerCaseLetters = /[a-z]/g;
          if(myInput.value.match(lowerCaseLetters)) {
            letter.classList.remove("invalid");
            letter.classList.add("valid");
          } else {
            letter.classList.remove("valid");
            letter.classList.add("invalid");
          }

          // Validate capital letters
          var upperCaseLetters = /[A-Z]/g;
          if(myInput.value.match(upperCaseLetters)) {
            capital.classList.remove("invalid");
            capital.classList.add("valid");
          } else {
            capital.classList.remove("valid");
            capital.classList.add("invalid");
          }

          // Validate numbers
          var numbers = /[0-9]/g;
          if(myInput.value.match(numbers)) {
            number.classList.remove("invalid");
            number.classList.add("valid");
          } else {
            number.classList.remove("valid");
            number.classList.add("invalid");
          }

          // Validate length
          if(myInput.value.length >= 8) {
            length.classList.remove("invalid");
            length.classList.add("valid");
          } else {
            length.classList.remove("valid");
            length.classList.add("invalid");
          }
        }
        
        </script>
</html>