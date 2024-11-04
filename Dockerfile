# Use the official Python image
FROM python:3.10-slim

# Set the working directory in the container
WORKDIR /app

RUN apt-get update && \
    rm -rf /var/lib/apt/lists/*

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Copy the Django project files
COPY . .

# Expose the port the app will run on
EXPOSE 8001

# Command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

