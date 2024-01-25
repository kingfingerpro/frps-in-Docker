FROM alpine:latest
LABEL maintainer="World·Peace"

ENV TZ=Asia/Shanghai
WORKDIR /

RUN apk add --no-cache tzdata \
    && ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone

RUN VERSION=$(wget --no-check-certificate -qO- https://api.github.com/repos/fatedier/frp/tags | grep 'name' | cut -d\" -f4 | head -1 | cut -c 2- ) \
    && if [ "$(uname -m)" = "x86_64" ]; then export PLATFORM=amd64 ; else if [ "$(uname -m)" = "aarch64" ]; then export PLATFORM=arm64 ; fi fi \
    && wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${VERSION}/frp_${VERSION}_linux_${PLATFORM}.tar.gz \
    && tar xzf frp_${VERSION}_linux_${PLATFORM}.tar.gz \
    && cd frp_${VERSION}_linux_${PLATFORM} \
    && mkdir /frp \
    && mkdir /frps \
    && mv frps /frp \
    && mv frps.toml /frps \
    && cd .. \
    && rm -rf *.tar.gz frp_${VERSION}_linux_${PLATFORM}

VOLUME /frps

CMD /frp/frps -c /frps/frps.toml
