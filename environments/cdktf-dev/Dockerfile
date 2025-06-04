FROM ubuntu:24.04
LABEL Name="CDKTF development container" \
      Author="Abraham Sotelo"

ARG USERNAME
ARG UID
ARG GROUPNAME
ARG GID
ARG TZ_PATH

RUN  useradd -m -u ${UID} -g ${GID} -s /bin/zsh ${USERNAME}

RUN apt update && apt install -y \
  tzdata \
  sudo \
  git \
  curl \
  wget \
  unzip \
  python3 \
  build-essential \
  ncurses-term \
  zsh && \
  rm -rf /var/lib/apt/lists/*

ENV TERM=xterm-256color

RUN echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN ln -fs ${TZ_PATH} /etc/localtime

USER ${USERNAME}
WORKDIR /home/${USERNAME}
RUN git clone https://github.com/abraham-sotelo/configurations.git && \
  /home/${USERNAME}/configurations/setup.sh
USER root
WORKDIR /home/${USERNAME}

RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - &&\
  apt install -y nodejs
  
  RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg && \
    apt update -y && apt install google-cloud-cli -y

RUN wget https://releases.hashicorp.com/terraform/1.8.1/terraform_1.8.1_linux_amd64.zip && \
  unzip terraform_1.8.1_linux_amd64.zip && \
  mv terraform /usr/local/bin/terraform && \
  rm terraform_1.8.1_linux_amd64.zip && \
  npm install --global cdktf-cli@latest tsx yarn

CMD ["zsh"]