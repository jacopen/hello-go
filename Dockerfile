FROM golang:latest
COPY hello.go .
RUN go build hello.go && mv hello /usr/bin/hello
ENTRYPOINT ["hello"]
