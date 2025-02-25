FROM ubuntu:latest
WORKDIR /app
COPY . .
RUN echo "Your build steps here"
CMD ["echo", "Hello, World!"]