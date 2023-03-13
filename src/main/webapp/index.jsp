<!DOCTYPE html>
<html>
<head>
    <title>随机六边形图形</title>
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
            width: 50px;
            height: 50px;
            transform: rotate(30deg);
            border-radius: 5px;
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
            const size = Math.floor(Math.random() * 50) + 10;
            const left = Math.floor(Math.random() * (width - size));
            const top = Math.floor(Math.random() * (height - size));
            const hue = Math.floor(Math.random() * 360);
            const color = `hsl(${hue}, 70%, 70%)`;
            const duration = Math.floor(Math.random() * 10) + 5;
            const direction = Math.random() * 360;

            shape.classList.add('shape');
            shape.style.width = `${size}px`;
            shape.style.height = `${size}px`;
            shape.style.left = `${left}px`;
            shape.style.top = `${top}px`;
            shape.style.backgroundColor = color;

            container.appendChild(shape);

            setTimeout(() => {
                shape.remove();
            }, duration * 1000);

            setInterval(() => {
                const x = Math.cos(direction * Math.PI / 180);
                const y = Math.sin(direction * Math.PI / 180);

                left += x;
                top += y;

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

