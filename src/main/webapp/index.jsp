<!DOCTYPE html>
<html>
<head>
    <title>more more more</title>
    <style>
        body {
            margin: 0;
            padding: 0;
        }
        #container {
            position: relative;
            width: 600px;
            height: 400px;
            border: 1px solid black;
            overflow: hidden;
        }
        .shape {
            position: absolute;
            transform-origin: center center;
            border-radius: 5px;
            animation: move 10s linear infinite;
        }
        .triangle {
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 0 30px 52.2px 30px;
        }
        .quadrilateral {
            width: 50px;
            height: 50px;
            transform: skew(20deg);
        }
        .pentagon {
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 0 25px 43.3px 25px;
        }
        @keyframes move {
            0% {
                transform: translate(0, 0) rotate(0deg);
            }
            100% {
                transform: translate(0, 0) rotate(360deg);
            }
        }
    </style>
</head>
<body>
    <div id="container"></div>

    <script>
        const container = document.getElementById('container');
        const width = container.clientWidth;
        const height = container.clientHeight;
        
        function createShape() {
            const shape = document.createElement('div');
            const size = Math.floor(Math.random() * 50) + 30;
            const left = Math.floor(Math.random() * (width - size));
            const top = Math.floor(Math.random() * (height - size));
            const hue = Math.floor(Math.random() * 360);
            const color = `hsl(${hue}, 70%, 70%)`;
            const duration = Math.floor(Math.random() * 10) + 5;
            const direction = Math.random() * 360;
            const speed = Math.floor(Math.random() * 10) + 1;

            let shapeClass = 'shape';
            let shapeStyle = `width: ${size}px; height: ${size}px;`;
            let shapeType = Math.floor(Math.random() * 3);

            switch (shapeType) {
                case 0:
                    shapeClass += ' triangle';
                    shapeStyle += `border-color: transparent transparent ${color} transparent;`;
                    break;
                case 1:
                    shapeClass += ' quadrilateral';
                    shapeStyle += `background-color: ${color};`;
                    break;
                case 2:
                    shapeClass += ' pentagon';
                    shapeStyle += `border-color: transparent transparent ${color} transparent;`;
                    break;
            }

            shape.classList.add(shapeClass);
            shape.style.cssText += shapeStyle;
            shape.style.left = `${left}px`;
            shape.style.top = `${top}px`;

            container.appendChild(shape);

            setTimeout(() => {
                shape.remove();
            }, duration * 1000);

            setInterval(() => {
                const x = Math.cos(direction * Math.PI / 180);
                const y = Math.sin(direction * Math.PI / 180);

                left += x * speed;
                top += y * speed;

                if (left < -size || left > width || top < -size || top > height) {
                    shape.remove();
                } else {
                    shape.style.left = `${left}px`;
                    shape.style.top = `${top}px`;
                }
            }, 50);
        }
    setInterval(createShape, 500);
    </script>
</body>
</html>
                   
