<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Webpage.com</title>
     <link rel="stylesheet" href="Home.css">
     <script src="https://kit.fontawesome.com/a076d05399.js"></script>


</head>
<body>

<nav>
    <div class="logo"></div>

    <img src="./images/hotwax-systems-logo_fe34b522273d8b9d6ef33253908487bf@2x.png" alt="" class="img">
    <input type="checkbox" name="" id="click">
    <label for="click" class="menu">
    <i class="fas fa-bars"></i>
</label>
    <ul>
        <li><a href="index.jsp" class="active">Home</a></li>
        <li><a href="SignIn.jsp"  class="active" target="blank">Sign-In</a></li>
        <li><a href="registration.jsp"  class="active">Sign-Up</a></li>


    </ul>
</nav>
<section id="home">
    <h1 class="h-primary">Welcome to this website</h1>
</section>

<section class="console-container" id="console">
    <div class='console-container block'><span id='text'></span></div>
</section>

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
</section>
            <!-- JavaScript Using -->
<script>
    consoleText(['Your Partner In Better OFBiz Innovation....', 'Apache OFBiz Accelerator.', ' Yes Takes You Further.'], 'text', ['Whitesmoke', 'cyan', 'Whitesmoke']);

function consoleText(words, id, colors) {
    if (colors === undefined) colors = ['#fff'];
    var visible = true;
    var con = document.getElementById('console');
    var letterCount = 1;
    var x = 1;
    var waiting = false;
    var target = document.getElementById(id)
    target.setAttribute('style', 'color:' + colors[0])
    window.setInterval(function() {

        if (letterCount === 0 && waiting === false) {
            waiting = true;
            target.innerHTML = words[0].substring(0, letterCount)
            window.setTimeout(function() {
                var usedColor = colors.shift();
                colors.push(usedColor);
                var usedWord = words.shift();
                words.push(usedWord);
                x = 1;
                target.setAttribute('style', 'color:' + colors[0])
                letterCount += x;
                waiting = false;
            }, 1000)
        } else if (letterCount === words[0].length + 1 && waiting === false) {
            waiting = true;
            window.setTimeout(function() {
                x = -1;
                letterCount += x;
                waiting = false;
            }, 1000)
        } else if (waiting === false) {
            target.innerHTML = words[0].substring(0, letterCount)
            letterCount += x;
        }

    }, 120)
    window.setInterval(function() {
        if (visible === true) {
            con.className = 'console-underscore hidden'
            visible = false;

        } else {
            con.className = 'console-underscore'

            visible = true;
        }
    }, 400)
}
</script>
</body>
</html>