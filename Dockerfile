FROM alpine:latest

RUN apk add --no-cache \
	bash \
	git \
	curl \
	jq \
  openssh-client

WORKDIR /script

ADD *.sh /script
RUN chmod 555 /script/*.sh
ADD known_hosts /script

ENTRYPOINT ["/script/entrypoint.sh"]
