FROM golang:1.12.0 AS builder
# ... my go build steps (removed from this example)
WORKDIR /builder/working/directory
RUN curl -L https://github.com/balena-io/qemu/releases/download/v3.0.0%2Bresin/qemu-3.0.0+resin-arm.tar.gz | tar zxvf - -C . && mv qemu-3.0.0+resin-arm/qemu-arm-static .
#
FROM arm64v8/golang:1.11-alpine
COPY --from=builder /builder/working/directory/qemu-arm-static /usr/bin
COPY hello.go .
RUN go build hello.go
RUN find .
RUN mv hello /usr/bin/hello
ENTRYPOINT ["hello"]
