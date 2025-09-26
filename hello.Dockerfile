# this is a comment

# Use a lightweight debian os
# as the image
FROM debian:stable-slim

# execute the 'echo "hello world"
# command when the container runs
CMD ["echo","hello world"]