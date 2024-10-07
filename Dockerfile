FROM public.ecr.aws/docker/library/debian:stable-20240904

RUN apt-get update
RUN apt-get install -y \
      software-properties-common \
      python3-launchpadlib
#RUN add-apt-repository universe
RUN add-apt-repository ppa:inkscape.dev/stable
RUN apt-get update
RUN apt-get install -y \
      golang-go \
      inkscape \
      texlive-full

COPY src/fonts /root/.fonts
COPY . /root/build
WORKDIR /root/build
RUN ./make.sh release
