# syntax=docker/dockerfile:1
FROM debian:stable
RUN apt-get update -y && apt-get install -y g++ cmake zlib1g-dev libbz2-dev python python3 python3-pip wget
RUN python3 -m pip install --upgrade cutadapt
RUN wget http://cab.spbu.ru/files/release3.15.5/SPAdes-3.15.5.tar.gz
RUN tar -zxf SPAdes-3.15.5.tar.gz
WORKDIR /SPAdes-3.15.5
RUN PREFIX=/usr/local ./spades_compile.sh
WORKDIR /app
COPY main.sh .
ENTRYPOINT ["bash", "main.sh"]
