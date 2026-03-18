FROM golang:1.26-alpine AS builder

ENV CGO_ENABLED=0\
        GOOS=linux\
        GOARCH=amd64

WORKDIR /build

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o /main .

FROM alpine:3.21 AS final

COPY --from=builder /main /bin/main

EXPOSE 8081

CMD ["bin/main"]
