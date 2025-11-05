# Step 1: Use an official Python runtime as the base image
FROM python:3.10-slim

# Step 2: Set a working directory inside the container
WORKDIR /app

# Step 3: Copy dependency file first (helps with caching)
COPY requirements.txt .

# Step 4: Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the rest of your application code
COPY . .

# Step 6: Expose the port your app runs on (optional, e.g. Flask default = 5000)
EXPOSE 5000

# Step 7: Define the command to run your app
# If you use Flask, for example:
# CMD ["python", "app.py"]
CMD ["python", "app.py"]
