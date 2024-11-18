# Use an official Python runtime as a parent image
FROM python:3.10

# Set the working directory in the container
WORKDIR /app

# Update package list and ensure pip is available
RUN apt-get update && apt-get install -y python3-pip ffmpeg

# Verify pip and ffmpeg installations
RUN pip3 --version
RUN ffmpeg -version

# Copy the current directory contents into the container at /app
COPY . /app/

# Install required Python packages
RUN pip3 install --no-cache-dir -r requirements.txt

# Run the bot
CMD ["python3", "bot.py"]
