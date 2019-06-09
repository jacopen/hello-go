FROM arm64v8/golang:1.11-alpine
COPY hello.go .
RUN go build hello.go && mv hello /usr/bin/hello
ENTRYPOINT ["hello"]
