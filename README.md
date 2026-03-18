# go-simple-server

A lightweight HTTP server written in Go that serves static files and exposes a thread-safe counter endpoint.

## Requirements

- Go 1.23+
- Docker (optional)

## Endpoints

| Method | Path         | Description                              |
|--------|--------------|------------------------------------------|
| GET    | `/`          | Serves static files from `./static/`     |
| GET    | `/hi`        | Returns a plain `hi` response            |
| GET    | `/increment` | Increments and returns a shared counter  |

## Running locally

```bash
go run main.go
```

Server starts on port `8081`.

## Running with Docker

```bash
# Build
docker build -t go-simple-server .

# Run
docker run -p 8081:8081 go-simple-server
```

Then open [http://localhost:8081](http://localhost:8081).

## Project structure

```
.
├── main.go          # Server entry point
├── go.mod           # Go module definition
├── dockerfile       # Multi-stage Docker build
└── static/
    └── index.html   # Static HTML served at /
```
