FROM ubuntu:jammy-20230301


RUN ["/bin/bash", "-c", "echo I am now using bash!"]

# Install Dependencies

RUN yes | unminimize \
    && apt update \    
    && apt install -yq \
        apt-utils --no-install-recommends apt-utils \
        asciidoctor \        
        bash-completion \
        build-essential \
        ca-certificates \
        curl \
        git \
        git-lfs \
        gnupg \
        htop \
        jq \
        less \
        llvm \
        locales \
        lsb-release \
        man-db \
        net-tools \        
        nano \        
        python3 \        
        python3-pip \    
        software-properties-common \
        ssh \
        sudo \
        unzip \
        wget \
        vim \     
    && locale-gen en_US.UTF-8 \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/*
ENV LANG=en_US.UTF-8

# Install NodeJS
RUN cd /tmp \
    && curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash \    
    && apt install -y nodejs

# Install Docker
# RUN sudo mkdir -m 0755 -p /etc/apt/keyrings \
#     && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
#     && echo \
#   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
#   $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
#   && apt update \
#   && apt install -yq docker-ce
 
# Install AWS CLI tool then cleanup
RUN cd /tmp \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install \
    && rm awscliv2.zip \
    && rm -rf /tmp/aws

# Install PostgreSQL Client
RUN curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/postgresql.gpg \
    && echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | sudo tee -a /etc/apt/sources.list.d/pgdg.list \
    && sudo apt update \
    && sudo apt install -y postgresql-client-13 libpq-dev

# Set up user bootcamp
ARG USERNAME=bootcamp
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
USER $USERNAME

# Refresh OS and packages
RUN sudo apt update \
    && sudo apt upgrade -yq \
    && sudo apt autoremove -y

ENV SHELL /bin/bash