FROM microsoft/dotnet:1.0.5-sdk

RUN apt-get install bash

# volumes
VOLUME "/mindtouch/solid-doodle"

WORKDIR /mindtouch/solid-doodle

COPY ./docker/files/run-tests.sh /usr/bin/run-tests
RUN chmod +x /usr/bin/run-tests