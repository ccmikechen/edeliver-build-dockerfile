FROM jdeathe/centos-ssh:2.6.0

ENV ELIXIR_VERSION=1.9.1
ENV LC_ALL=en_US.utf8

# Erlang & Elixir

RUN yum install -y epel-release gcc gcc-c++ glibc-devel make ncurses-devel openssl-devel autoconf java-1.8.0-openjdk-devel git wget unzip && \
    wget https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm &&\
    rpm -Uvh erlang-solutions-1.0-1.noarch.rpm &&\
    yum install -y erlang

RUN mkdir /opt/elixir && \
    cd /opt/elixir && \
    wget https://github.com/elixir-lang/elixir/releases/download/v${ELIXIR_VERSION}/Precompiled.zip && \
    unzip Precompiled.zip && \
    rm Precompiled.zip && \
    ln -s /opt/elixir/bin/iex /usr/local/bin/iex && \
    ln -s /opt/elixir/bin/mix /usr/local/bin/mix && \
    ln -s /opt/elixir/bin/elixir /usr/local/bin/elixir && \
    ln -s /opt/elixir/bin/elixirc /usr/local/bin/elixirc

RUN mix local.hex --force && \
    mix local.rebar --force

# NodeJS

RUN /usr/bin/curl --silent --location https://rpm.nodesource.com/setup_10.x | bash && \
    yum install nodejs -q -y && \
    npm install --global yarn

# Clean up

RUN yum clean all
