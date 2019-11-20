FROM mesosphere/aws-cli

RUN apk --no-cache --update add bash \
    openssl \
    ca-certificates \
    openssh

RUN apk --no-cache --update add ansible; exit 0

RUN wget https://releases.hashicorp.com/packer/1.2.2/packer_1.2.2_linux_amd64.zip -O packer.zip && \
    unzip packer.zip -d /usr/bin/ && \
    rm -f packer.zip

COPY runner.sh /bin/runner.sh

ENTRYPOINT ["/bin/bash", "/bin/runner.sh"]
