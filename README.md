# Author: Rohan Sul-Patil

# HTML Docker Project

This project contains a simple HTML web application that is containerized with Docker.

## Project Structure

```
.
├── dockerfile
├── src/
│   └── index.html
└── README.md
```

## Getting Started

### Prerequisites

- Docker installed on your machine

### Building the Docker Image

```bash
docker build -t html-app .
```

### Running the Container

```bash
docker run -p 8080:80 html-app
```

After running these commands, the application will be available at http://localhost:8080

## About

This project uses Nginx as a web server to serve static HTML content. The Dockerfile configures an Nginx server with the HTML content from the src directory.

## Last Updated

May 8, 2025