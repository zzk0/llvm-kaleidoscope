from silkeh/clang:15

# Add your public key here
ARG SSH_PUBLIC_KEY=""

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt update && \
    apt install -y build-essential lld openssh-server python3-pip git && \
    apt clean

# config ssh server
RUN sed -i 's/#Port 22/Port 22122/g' /etc/ssh/sshd_config && \
    sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config && \
    mkdir ~/.ssh && \
    echo "$SSH_PUBLIC_KEY" >> ~/.ssh/authorized_keys && \
    chmod 700 ~/.ssh && \
    chmod 600 ~/.ssh/authorized_keys

# install cmake
RUN pip3 config set global.index-url https://mirrors.bfsu.edu.cn/pypi/web/simple && \
    pip3 install cmake

# entrypoint
COPY ./entrypoint.sh /home/entrypoint.sh
RUN chmod +x /home/entrypoint.sh
ENTRYPOINT ["/home/entrypoint.sh"]
