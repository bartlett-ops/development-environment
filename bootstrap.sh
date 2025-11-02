#!/bin/bash
set -euo pipefail
IFS='\n\t'

if ! command -v ansible-playbook >/dev/null; then
    sudo dnf install -y git python3 python3-pip
    pip install ansible
fi

if [[ $(basename "${PWD}") != "development-environment" ]]; then
    echo "Cloning project"
    git clone https://github.com/bartlett-ops/development-environment.git
    cd development-environment
fi

git pull origin "$(git branch --show-current)"

ansible-galaxy install -r ./requirements.yml
ansible-playbook -i ./hosts.yaml --ask-become-pass ./site.yaml

echo "You should now reboot for all changes to take effect"
