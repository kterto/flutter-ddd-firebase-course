#!/usr/bin/env bash

if ! command -v lcov &> /dev/null; then
    echo "Updating system available packages and installing lcov for code coverage..."
    sudo apt-get update -y
    sudo apt-get install -y lcov
fi
