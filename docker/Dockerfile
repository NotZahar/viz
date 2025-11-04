FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

WORKDIR /app

COPY . .

RUN ./docker/install_dependencies.sh
RUN ./docker/setup_locale.sh
RUN ./docker/setup_zsh.sh
RUN ./docker/setup_build_tools.sh

ENV SHELL=/bin/zsh

CMD ["/bin/zsh"]
