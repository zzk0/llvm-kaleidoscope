from silkeh/clang:15

# Add your public key here
ARG SSH_PUBLIC_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDZWK85J3e54l2bJRuhcrsvtWioOGf1EGi27Q/RYxi/Aj/09E4aII6yFlTY1t8k1j3jVl7UWxTC78QZSgQD3Gd9KF8SR+4Cl1OyYmufOZPpFRpPFjLZfMIB1prlSnyLq+H1i6dd0lGjjULLZ9OXfaFfjPFVV2Qg4a4ynWsLOsLGW5eou/2h0sszBWGl/+SLnzcFI6oeGGVSVuNzx8P2Yxw8J5h1kFFk6jVQSRUznlmGHSvSguQ9RjmZJTgroCFH0zcceaJymoLIcZleeoIo2XxNpwvSy4Xob+AILQdY8eJNUwR4dKuxAWJjvTHy70pUPoM9P0qF9CpXjuEBMmbDgkOR zzk@DESKTOP-7SBRJOU"

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
