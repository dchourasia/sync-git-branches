FROM alpine:latest

RUN apk add --no-cache \
	bash \
	git \
	curl \
	jq \
  openssh-client

RUN adduser -D ci

RUN mkdir /home/ci/.ssh
ADD *.sh /home/ci/

ADD known_hosts /home/ci/.ssh
RUN chown -R ci: /home/ci
RUN chmod 555 /home/ci/*.sh 
RUN chmod 700 /home/ci/.ssh

USER ci

ENTRYPOINT ["/home/ci/entrypoint.sh"]
