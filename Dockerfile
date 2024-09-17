# Use the official Go image as the base image
FROM golang:1.17-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files and download dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy the source code into the container
COPY . .

# Expose port 3004 to the outside world
EXPOSE 3004

# Command to run the application
CMD ["go", "run", "./cmd/quiz/quiz.go"]