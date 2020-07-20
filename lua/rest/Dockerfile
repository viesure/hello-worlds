FROM debian:buster-slim

RUN apt-get update && apt-get install -y build-essential libreadline-dev make curl wget unzip
RUN apt-get update && apt-get install -y build-essential libreadline-dev make curl wget unzip

COPY hello.lua /tmp/hello.lua

RUN curl -R -O http://www.lua.org/ftp/lua-5.2.4.tar.gz \
    && tar -zxf lua-5.2.4.tar.gz \
    && cd lua-5.2.4 \
    && make linux test \
    && make install
RUN wget https://luarocks.org/releases/luarocks-3.3.1.tar.gz \
    && tar zxpf luarocks-3.3.1.tar.gz \
    && cd luarocks-3.3.1 \
    && ./configure --with-lua-include=/usr/local/include \
    && make && make install

RUN luarocks install restserver-xavante

ENTRYPOINT ["lua", "/tmp/hello.lua"]
