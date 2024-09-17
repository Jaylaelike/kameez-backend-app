# Use the official Go image as the base image
FROM golang:1.23-buster AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Go module files and download dependencies
COPY go.mod go.sum ./
RUN go mod download



# Copy the source code into the container
COPY . .

RUN go build -o /app/quiz ./cmd/quiz/quiz.go

# Expose port 3004 to the outside world
EXPOSE 3004

# Command to run the application
CMD ["go", "run", "./cmd/quiz/quiz.go"]