#!/usr/bin/env bash

sudo() {
    [ $UID -eq 0 ] || set -- command sudo "$@"
    "$@"
}

if type apt-get >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get --assume-yes install curl
elif type dnf >/dev/null 2>&1; then
    sudo dnf check-update
    sudo dnf install -y curl
elif type yum >/dev/null 2>&1; then
    sudo yum check-update
    sudo yum install -y curl
else
    echo "Unable to find a supported package manager"
    exit 1
fi
