FROM registry.access.redhat.com/ubi9/ubi:latest

LABEL maintainer="Mark Hahl <mark@hahl.id.au>" \
      org.label-schema.name="Dovecot Docker Image" \
      org.label-schema.description="Dovecot is an open-source IMAP and POP3 server for Unix-like operating systems, written primarily with security in mind." \
      org.label-schema.url="https://github.com/mhahl/dovecot-container" \
      org.label-schema.vcs-url="https://github.com/mhahl/dovecot-container" \
      org.label-schema.schema-version="2.0"

RUN dnf install --repofrompath=centos-appstream,http://mirror.stream.centos.org/9-stream/AppStream/x86_64/os/ --repofrompath=centos,http://mirror.stream.centos.org/9-stream/BaseOS/x86_64/os --disablerepo=* --enablerepo=centos dovecot --nobest && dnf clean all -y

RUN mkdir -p /var/lib/dovecot && \
    mkdir -p /var/log/dovecot && \
    mkdir -p /run/dovecot

EXPOSE 110 143 993 995

CMD ["/sbin/dovecot", "-F"]
