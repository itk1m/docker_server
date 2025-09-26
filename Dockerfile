
FROM debian:stable-slim

#COPY source destination
COPY goserver /bin/goserver

#Set the PORT enviornment to 8991
ENV PORT=8991

# automatically starts the server process in the containers
CMD ["/bin/goserver"]