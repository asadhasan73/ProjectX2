# Use a base image with Ubuntu, which is similar to the CI environment
FROM ubuntu:latest

#Default directory
WORKDIR /ProjectX



RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 git curl clang llvm lcov default-jdk zip build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN which clang

RUN curl -L https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-amd64 -o /usr/local/bin/bazel && \
    chmod +x /usr/local/bin/bazel

RUN which bazel
RUN bazel --version

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ouspg/ProjectX2/main/install.sh)"

# RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/CodeIntelligenceTesting/cifuzz/main/install.sh)"
# Updating latest installation from script
# RUN git clone https://github.com/asadhasan73/cifuzz && \
#   cd cifuzz && \
#    make install

#Provide your repository link below
RUN git clone https://github.com/asadhasan73/ProjectX2

WORKDIR /ProjectX/ProjectX2
RUN ls -a

CMD ["sh", "-c", "cifuzz run test:test --use-sandbox=false > /ProjectX/ProjectX2/fuzzing.log 2>&1 && cat /ProjectX/ProjectX2/fuzzing.log"]
