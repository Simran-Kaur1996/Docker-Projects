# Use Amazon Linux as the base image
FROM amazonlinux:latest

# Install dependencies
RUN yum update -y && \
    yum install -y httpd wget unzip

# Set working directory
WORKDIR /var/www/html

# Download the repository ZIP file
RUN wget https://github.com/Simran-Kaur1996/Docker-Projects/archive/refs/heads/main.zip

# Unzip the downloaded file
RUN unzip main.zip

# Copy files into the html directory
RUN cp -r Docker-Projects-main/jupiter/* /var/www/html/

# Clean up unnecessary files
RUN rm -rf Docker-Projects-main main.zip

# Expose port 80
EXPOSE 80

# Start the Apache server
ENTRYPOINT ["/usr/sbin/httpd", "-D", "FOREGROUND"]
