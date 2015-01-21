FROM debian:jessie

ENV SALT_VERSION=2014-07

RUN apt-get update -q && apt-get install -y wget
RUN wget http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key
RUN echo "b702969447140d5553e31e9701be13ca11cc0a7ed5fe2b30acb8491567560ee62f834772b5095d735dfcecb2384a5c1a20045f52861c417f50b68dd5ff4660e6  debian-salt-team-joehealy.gpg.key" | sha512sum -c
RUN apt-key add debian-salt-team-joehealy.gpg.key
RUN echo "deb http://debian.saltstack.com/debian jessie-saltstack-${SALT_VERSION} main" > /etc/apt/sources.list.d/saltstack.list
RUN apt-get update -q && apt-get install -y salt-master

EXPOSE 4505 4506

VOLUME ["/srv/salt", "/srv/pillar", "/etc/salt/pki"]

CMD ["salt-master"]
