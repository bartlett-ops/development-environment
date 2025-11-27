FROM fedora:42

# Pre-install packages to speed up ansible run
RUN dnf install -y yq
COPY roles/core-tooling/vars/main.yml /tmp/packages.yml
RUN dnf install -y $(yq -r '.packages[]' /tmp/packages.yml)

RUN useradd tom
RUN usermod -aG wheel tom
RUN echo "tom         ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers

USER tom
