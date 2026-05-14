FROM alpine:3.12

WORKDIR /gmqttd

COPY gmqttd-linux /gmqttd/gmqttd
COPY cmd/gmqttd/default_config.yml /gmqttd/default_config.yml
COPY cmd/gmqttd/thingspanel.yml /gmqttd/thingspanel.yml
COPY cmd/gmqttd/certs /gmqttd/certs

ENV GMQTT_CONFIG_PATH=/gmqttd/default_config.yml \
    TZ=Asia/Shanghai

EXPOSE 1883 8883 8082 8083 8084

RUN chmod +x /gmqttd/gmqttd

ENTRYPOINT ["/bin/sh", "-c", "./gmqttd start -c $GMQTT_CONFIG_PATH"]
