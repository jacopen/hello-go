FROM golang:1.12.0 AS builder
WORKDIR /builder/working/directory
RUN curl -L https://github.com/balena-io/qemu/releases/download/v3.0.0%2Bresin/qemu-3.0.0+resin-aarch64.tar.gz | tar zxvf - -C . && mv qemu-3.0.0+resin-aarch64/qemu-aarch64-static .

FROM arm64v8/golang:1.11-alpine
COPY --from=builder /builder/working/directory/qemu-aarch64-static /usr/bin/qemu-aarch64-static
COPY hello.go .
RUN go build hello.go && mv hello /usr/bin/hello
ENTRYPOINT ["hello"]
