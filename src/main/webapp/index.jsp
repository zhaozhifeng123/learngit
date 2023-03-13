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
  <h1>Welcome to zzf park</h1>
  <h2>My Moving Images Webpage</h1>
  <div id="container">
    <img src="path/to/image.jpg" alt="Local Image" width="500" height="500">
<script>
  var container = document.getElementById("container");
  var shapes = ["square", "circle", "triangle", "star", "heart", "pentagon", "hexagon"];
  
  setInterval(function() {
    var shape = document.createElement("div");
    shape.className = "random-shape " + shapes[Math.floor(Math.random() * shapes.length)];
    
    var size = Math.floor(Math.random() * 50) + 25;
    shape.style.width = size + "px";
    shape.style.height = size + "px";
    
    var x = Math.floor(Math.random() * (container.offsetWidth - size));
    var y = Math.floor(Math.random() * (container.offsetHeight - size));
    
    shape.style.left = x + "px";
    shape.style.top = y + "px";
    
    var red = Math.floor(Math.random() * 256);
    var green = Math.floor(Math.random() * 256);
    var blue = Math.floor(Math.random() * 256);
    
    shape.style.backgroundColor = "rgb(" + red + "," + green + "," + blue + ")";
    
    container.appendChild(shape);
    
    var dx = Math.random() * 10 - 5;
    var dy = Math.random() * 10 - 5;
    
    var intervalId = setInterval(function() {
      x += dx;
      y += dy;
      
      if (x < -size || x > container.offsetWidth || y < -size || y > container.offsetHeight) {
        clearInterval(intervalId);
        container.removeChild(shape);
      } else {
        shape.style.left = x + "px";
        shape.style.top = y + "px";
      }
    }, 100);
  }, 1000);
</script>

  </div>
</body>
</html>

