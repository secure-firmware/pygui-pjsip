# Use an official Python runtime as a parent image
FROM python:3.10-slim

# Install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libasound2-dev \
    libssl-dev \
    libx11-dev \
    wget \
    openjdk-11-jdk \
    && rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH="$JAVA_HOME/bin:$PATH"

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Build PJProject
RUN cd /app && \
    ./configure --enable-shared --disable-sound --disable-resample --disable-video --disable-opencore-amr && \
    make dep && \
    make && \
    make install

# Set the library path
ENV LD_LIBRARY_PATH=/usr/local/lib

# Build the Python bindings
RUN cd /app/pjsip-apps/src/swig && \
    make

# Expose the port the app runs on
EXPOSE 5060

# Command to run the application
CMD ["python3", "/app/pjsip-apps/src/pygui/application.py"]
