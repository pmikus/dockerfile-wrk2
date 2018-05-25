FROM alpine:latest

MAINTAINER Peter Mikus <pmikus@gmail.com>

# Install pre-requisities
RUN apk add --update alpine-sdk openssl-dev cmake sleep
RUN apk add --no-cache git

# Install HdrHistogram
RUN git clone https://github.com/HdrHistogram/HdrHistogram_c
RUN cd HdrHistogram_c && cmake CMakeLists.txt && make install

# Install wrk
RUN git clone https://github.com/ahothan/wrk2
RUN cd wrk2 && make && mv wrk /bin/

# Define default command.
ENTRYPOINT ["./wrk"]
