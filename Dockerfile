FROM python:3.9-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    libjpeg-dev \
    zlib1g-dev

# Set working directory
WORKDIR /app

# Install Python dependencies
RUN pip install --no-cache-dir flask pillow requests

# Copy the script file
COPY script.py .

# Expose port 8111
EXPOSE 8111

# Set the entrypoint command
CMD ["python", "script.py"]