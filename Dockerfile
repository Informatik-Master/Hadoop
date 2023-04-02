FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN sudo apt-get update \
    && sudo apt-get install -y wget git unzip build-essential libz-dev zlib1g-dev maven

WORKDIR /workspaces/graal-workshop
RUN wget https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-22.3.1/graalvm-ce-java11-linux-amd64-22.3.1.tar.gz \
    && mkdir -p /usr/local/graalvm \
    && tar -xvzf graalvm-ce-java11-linux-amd64-22.3.1.tar.gz -C /usr/local/graalvm \


ENV JAVA_HOME="/usr/local/graalvm/graalvm-ce-java11-22.3.1"
ENV PATH="/usr/local/graalvm/graalvm-ce-java11-22.3.1/bin:$PATH"
ENV GRAALVM_HOME="/usr/local/graalvm/graalvm-ce-java11-22.3.1"

RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.5/hadoop-3.3.5.tar.gz
RUN tar -xvzf hadoop-3.3.5.tar.gz -C /usr/local/hadoop/hadoop-3.3.5
ENV HADOOP_HOME="/usr/local/hadoop/hadoop-3.3.5"
ENV PATH="/usr/local/hadoop/hadoop-3.3.5/bin:$PATH"

ENV DEBIAN_FRONTEND=dialog
