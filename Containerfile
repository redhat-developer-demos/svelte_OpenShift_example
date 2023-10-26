# RHEL8 UBI Node JS 18 image used as base
FROM registry.access.redhat.com/ubi8/nodejs-18:1-71.1695741533

# Set environment variables (change them as needed)
ENV NODE_ENV=development 

# Set the working directory to /app
WORKDIR /app

# Install Meteor CLI globally
COPY --chown=1001:1001 package.json /app/

# Install Meteor dependencies
RUN npm install

# Copy your Meteor application files to the container
COPY --chown=1001:1001 . /app/

# set up the file permissions for build directory 
VOLUME ["/app/public/build/"]

# expose the 8080 port to accept the traffic in container
EXPOSE 8080

# Run the application in development mode
CMD ["npm", "run", "dev"]
