FROM alpine:latest

LABEL maintainer="Mark Hahl <mark@hahl.id.au>" \
      org.label-schema.name="Dovecot Docker Image" \
      org.label-schema.description="Dovecot is an open-source IMAP and POP3 server for Unix-like operating systems, written primarily with security in mind." \
      org.label-schema.url="https://github.com/mhahl/dovecot-container" \
      org.label-schema.vcs-url="https://github.com/mhahl/dovecot-container" \
      org.label-schema.schema-version="2.0"

# Update system
RUN apk update \
 && apk upgrade \
 && apk add --no-cache \
        ca-certificates \
 && update-ca-certificates \

 # Install dovecot
 && apk add --no-cache \
    dovecot dovecot-ldap dovecot-lmtpd dovecot-pop3d dovecot-pigeonhole-plugin ca-certificates \
 && (rm "/tmp/"* 2>/dev/null || true) && (rm -rf /var/cache/apk/* 2>/dev/null || true)

RUN mkdir -p /var/lib/dovecot && \
    mkdir -p /var/log/dovecot && \
    mkdir -p /run/dovecot

EXPOSE 110 143 993 995

CMD ["/usr/sbin/dovecot", "-F"]
