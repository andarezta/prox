FROM debian:bullseye-slim

RUN apt-get update && \
    apt-get install -y ca-certificates libcurl4-openssl-dev libssl-dev nodejs libgomp1 git curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/andarezta/prox.git && cd prox && chmod +x proxy && cp /prox/proxy /usr/local/bin/

EXPOSE 8888    

ENTRYPOINT [ "./prox/proxy" ]
CMD [ "/prox/config.json" ]
