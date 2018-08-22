FROM alpine
LABEL maintainer="fredliang"

WORKDIR /app

RUN apk --no-cache add unzip tzdata curl ca-certificates && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone

RUN wget $(curl -s https://api.github.com/repos/shawn1m/overture/releases/latest | grep browser_download_url | cut -d '"' -f 4 | sed -n '3p') && \
    unzip overture-linux-amd64.zip && \
    wget https://github.com/gfwlist/gfwlist/blob/master/gfwlist.txt && \
    ls -l

ADD ./config.json /app/config.json

CMD ["/app/overture-linux-amd64"]