FROM fedora:42

# Pre-install packages to speed up ansible run
RUN dnf install -y \
        firefox \
        gcc \
        git \
        make \
        python3 \
        thunderbird \
        tmux \
        wget \
        xclip \
        zsh
RUN useradd tom
RUN usermod -aG wheel tom
RUN echo "tom         ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers

USER tom
