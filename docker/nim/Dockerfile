FROM ubuntu:latest
RUN apt-get update &&\
    apt-get install -y -q git &&\
    git clone -b master git://github.com/nim-lang/Nim.git &&\
    cd Nim &&\
    git clone -b master --depth 1 git://github.com/nim-lang/csources &&\
    cd csources && sh build.sh &&\
    cd .. &&\
    bin/nim c koch &&\
    ./koch boot -d:release &&\
    git clone https://github.com/nim-lang/nimble.git &&\
    cd nimble &&\
    git clone -b v0.13.0 --depth 1 https://github.com/nim-lang/nim vendor/nim &&\
    nim c -r src/nimble install && \
    echo "export PATH=$HOME/.nimble/bin:$PATH" >> ~/.profile &&\
    source ~/.profile &&\
    nimble refresh &&\
    nimble install jester

EXPOSE 5000
