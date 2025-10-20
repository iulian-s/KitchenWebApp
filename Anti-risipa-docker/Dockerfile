# Use the official Tomcat image
FROM tomcat:10.1-jdk17-temurin
RUN apt-get update && apt-get install -y mysql-client && rm -rf /var/lib/apt/lists/*
# Copy your WAR file into Tomcat
COPY anti-risipa.war /usr/local/tomcat/webapps

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
