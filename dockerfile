FROM golang:1.23-alpine AS builder

ENV CGO_ENABLED=0\
        GOOS=linux\
        GOARCH=amd64

WORKDIR /build

COPY go.mod ./

RUN go mod download

COPY . .

RUN go build -o /main .

FROM alpine:3.21 AS final

WORKDIR /app

COPY --from=builder /main /app/main

EXPOSE 8081

CMD ["/app/main"]
