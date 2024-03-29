FROM golang:1.21.0-alpine3.18 AS builder
WORKDIR /build
COPY . .
RUN go build -o webtest

FROM alpine:3.18 AS prod
WORKDIR /app
COPY --from=builder /build/webtest .
CMD [ "./webtest" ]                                                         