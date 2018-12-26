# BUILD STAGE
FROM golang:alpine AS builder

WORKDIR /go/src/go-web

RUN set -ex; \
    apk add --no-cache curl git

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

# FINAL STAGE
FROM alpine

RUN apk --no-cache add ca-certificates

WORKDIR /root/

COPY --from=builder /go/src/go-web/app .

EXPOSE 8080

CMD ["./app"]
