FROM ubuntu:22.04

WORKDIR /workspace

RUN apt update && apt install -y clang cmake git g++

RUN git clone https://github.com/marcobambini/gravity.git

WORKDIR /workspace/gravity

RUN make

WORKDIR /code

COPY bin .

RUN ln -s /workspace/gravity/gravity /bin/gravity

CMD "./run.sh"