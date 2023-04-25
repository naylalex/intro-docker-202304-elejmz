FROM golang:latest AS primera
WORKDIR /app
COPY . . 

RUN CGO_ENABLED=0 go build dispatcher.go
FROM alpine:latest AS segunda

WORKDIR /app1

COPY --from=primera /app/dispatcher dispatcher
COPY --from=primera /app/static static

ENTRYPOINT ["./dispatcher"]

EXPOSE 80



















