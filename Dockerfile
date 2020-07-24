FROM golang:1.14.4-alpine3.12 as builder
ENV CGO_ENABLED 0
ENV GOOS linux
WORKDIR /go/src/github.com/kaissi/fct7-devops-docker-desafio
ADD . /go/src/github.com/kaissi/fct7-devops-docker-desafio/
RUN go build -ldflags '-w -s' -a -installsuffix cgo -o /go/bin/code-education-rocks \
    && apk add --no-cache upx \
    && upx --brute /go/bin/code-education-rocks

FROM scratch
COPY --from=builder /go/bin/code-education-rocks /usr/local/bin/
ENTRYPOINT ["code-education-rocks"]

