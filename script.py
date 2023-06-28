import requests
from PIL import Image
from io import BytesIO
from flask import Flask, send_file, request

app = Flask(__name__)

@app.route('/')
def resize_image():
    image_url = request.args.get('url')
    desired_width = int(request.args.get('w', 1024))

    if image_url:
        response = requests.get(image_url)
        image = Image.open(BytesIO(response.content))

        # Calculate the new height while maintaining the aspect ratio
        aspect_ratio = float(image.width) / image.height
        desired_height = int(desired_width / aspect_ratio)

        # Resize the image
        resized_image = image.resize((desired_width, desired_height), Image.ANTIALIAS)

        # Save the resized image to a temporary file
        output = BytesIO()
        resized_image.save(output, format='JPEG')
        output.seek(0)

        return send_file(output, mimetype='image/jpeg')
    else:
        return 'No image URL provided.'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8111)