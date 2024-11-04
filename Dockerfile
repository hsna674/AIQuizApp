# Use the official Python image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

RUN apt-get update && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get install -y gcc build-essential || true

RUN apt-get install -y gcc build-essential

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Copy the Django project files
COPY . .

# Expose the port the app will run on
EXPOSE 8001

# Command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]

