FROM golang:1.18.1-alpine3.15 AS build 
ENV CGO_ENABLED 0

RUN apk add git make openssl

WORKDIR /go/src/github.com/implodingduck/azure-mdsd-proxy-helper
COPY . .
RUN make app

FROM scratch
WORKDIR /app
COPY --from=build /go/src/github.com/implodingduck/azure-mdsd-proxy-helper .
COPY --from=build /go/src/github.com/implodingduck/azure-mdsd-proxy-helper/ssl /ssl

CMD ["/app/mdsdproxyhelper"]