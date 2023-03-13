<!DOCTYPE html>
<html>
<head>
  <title>My Moving Images Webpage</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    /* Add your CSS styling here */
    #container {
      position: relative;
      width: 500px;
      height: 500px;
      border: 1px solid black;
      overflow: hidden;
    }
    
    .random-image {
      position: absolute;
      width: 50px;
      height: 50px;
      left: 0;
      top: 0;
    }
  </style>
</head>
<body>
  <h1>My Moving Images Webpage</h1>
  <div id="container">
    <img src="path/to/image.jpg" alt="Local Image" width="500" height="500">
    <script>
      var container = document.getElementById("container");
      var images = ["path/to/image1.png", "path/to/image2.png", "path/to/image3.png"];
      var shapes = ["square", "circle", "triangle"];
      
      setInterval(function() {
        var image = document.createElement("img");
        image.src = images[Math.floor(Math.random() * images.length)];
        image.className = "random-image " + shapes[Math.floor(Math.random() * shapes.length)];
        container.appendChild(image);
        
        var x = Math.floor(Math.random() * (container.offsetWidth - image.width));
        var y = Math.floor(Math.random() * (container.offsetHeight - image.height));
        
        image.style.left = x + "px";
        image.style.top = y + "px";
        
        var dx = Math.random() * 10 - 5;
        var dy = Math.random() * 10 - 5;
        
        var intervalId = setInterval(function() {
          x += dx;
          y += dy;
          
          if (x < -image.width || x > container.offsetWidth || y < -image.height || y > container.offsetHeight) {
            clearInterval(intervalId);
            container.removeChild(image);
          } else {
            image.style.left = x + "px";
            image.style.top = y + "px";
          }
        }, 100);
      }, 1000);
    </script>
  </div>
</body>
</html>

