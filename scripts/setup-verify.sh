#!/usr/bin/env bash

if ! command -v fvm &> /dev/null; then
    echo "Do you wish to use FVM?"
    select choice in "Yes" "No"; do
        case $choice in
            Yes ) make setup-fvm; break;;
            No ) break;;
        esac
    done
    echo "Remember to configure your IDE as needed."
else
    echo "FVM already installed."
fi

echo "LEFTHOOK check needed..."

make install
