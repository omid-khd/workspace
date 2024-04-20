#!/bin/bash

# Check if Homebrew is already installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed. Proceeding with installation..."

    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew is already installed."
fi

# Verify Homebrew installation
if command -v brew &>/dev/null; then
    echo "Homebrew has been successfully installed."
else
    echo "Failed to install Homebrew. Please try again."
    exit 1
fi

# Install Git using Homebrew
if ! command -v git &>/dev/null; then
    echo "Installing Git via Homebrew..."
    brew install git
    echo "Git has been successfully installed."

    if ! command -v git &>/dev/null; then
        echo "Failed to install Git via Homebrew. Please try again."
        exit 1
    fi
else
    echo "Git already installed"
fi
