# Start from Ubuntu 24.04
FROM ubuntu:24.04

# Update and install curl
RUN apt update && apt install -y curl

# Copy the script into the image
COPY script.sh /usr/local/bin/script.sh

# Make sure the script has execution permissions
RUN chmod +x /usr/local/bin/script.sh

# Set the default command to run the script
CMD ["/usr/local/bin/script.sh"]
