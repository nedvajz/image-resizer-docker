# Image Resizer

This is a simple image resizer service that accepts a URL to an image and resizes it to a specified width while maintaining the aspect ratio. The resized image can be accessed through a web interface.

## How to Run

1. Make sure you have Docker installed on your system.
2. Clone this repository to your local machine.
3. Navigate to the cloned repository directory.

### Build the Docker Image

To build the Docker image, run the following command:

`make build`

### Run the Docker Container

To run the Docker container and start the image resizer service, use the following command:

#### ease: 
`make run`

#### advanced:  
`docker run -d -p 8111:8111 --name image-resizer-container image-resizer`

The image resizer service will now be accessible at `http://localhost:8111/`.

## How to Use

To resize an image, make an HTTP GET request to the following URL:

`http://localhost:8111/?url=<IMAGE_URL>&w=<WIDTH>`

Replace `<IMAGE_URL>` with the URL of the image you want to resize, and `<WIDTH>` with the desired width for the resized image.

## Example

Resize an image to a width of 1024 pixels:

`http://localhost:8111/?url=http://www.example.com/image.jpg&w=1024`

## License

This project is licensed under the [MIT License](https://mit-license.org/).