#!/bin/bash

# Check if Homebrew is already installed
if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed. Proceeding with installation..."

    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Verify Homebrew installation
    if command -v brew &>/dev/null; then
        echo "Homebrew has been successfully installed."
    else
        echo "Failed to install Homebrew. Please try again."
        exit 1
    fi
else
    echo "Homebrew is already installed."
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
    echo "Git is already installed"
fi

# Check if Bitwarden is already installed
if [ -d "/Applications/PhpStorm.app" ]; then
    echo "Bitwarden is already installed."
else
    echo "Bitwarden is not installed. Proceeding with installation..."

    # Install Bitwarden using Homebrew
    echo "Installing Bitwarden via Homebrew..."
    brew install --cask bitwarden

    # Verify installation
    if brew list --cask | grep -q "bitwarden"; then
        echo "Bitwarden has been successfully installed."
    else
        echo "Failed to install Bitwarden via Homebrew. Please try again."
        exit 1
    fi
fi

# Install PhpStorm
if [ -d "/Applications/PhpStorm.app" ]; then
    echo "PhpStorm is already installed."
else
    echo "Installing PhpStorm via Homebrew..."
    brew install --cask phpstorm

    if [ -d "/Applications/PhpStorm.app" ]; then
        echo "PhpStorm has been successfully installed."
    else
        echo "Failed to install PhpStorm via Homebrew. Please try again."
        exit 1
    fi
fi

# Check if Google Chrome is already installed
if [ -d "/Applications/Google Chrome.app" ]; then
    echo "Google Chrome is already installed."
else
    echo "Google Chrome is not installed. Proceeding with installation..."

    # Install Google Chrome using Homebrew
    echo "Installing Google Chrome via Homebrew..."
    brew install --cask google-chrome

    # Verify installation
    if [ -d "/Applications/Google Chrome.app" ]; then
        echo "Google Chrome has been successfully installed."
    else
        echo "Failed to install Google Chrome via Homebrew. Please try again."
        exit 1
    fi
fi

if brew list --cask | grep -q "maccy"; then
    echo "Maccy is already installed."
else
    echo "Maccy is not installed. Proceeding with installation..."

    # Install Maccy using Homebrew
    echo "Installing Maccy via Homebrew..."
    brew install --cask maccy

    # Verify installation
    if brew list --cask | grep -q "maccy"; then
        echo "Maccy has been successfully installed."
    else
        echo "Failed to install Maccy via Homebrew. Please try again."
        exit 1
    fi
fi

if [ -d "/Applications/iTerm.app" ]; then
    echo "iTerm2 is already installed."
else
    echo "iTerm2 is not installed. Proceeding with installation..."

    # Install iTerm2 using Homebrew
    echo "Installing iTerm2 via Homebrew..."
    brew install --cask iterm2
    # Verify installation
    if [ -d "/Applications/iTerm.app" ]; then
        echo "iTerm2 has been successfully installed."
    else
        echo "Failed to install iTerm2 via Homebrew. Please try again."
        exit 1
    fi
fi

if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is already installed."
else
    echo "Oh My Zsh is not installed. Proceeding with installation..."
    # Install Oh My Zsh
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # Verify installation
    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "Oh My Zsh has been successfully installed."
    else
        echo "Failed to install Oh My Zsh. Please try again."
        exit 1
    fi
fi

if brew list --cask | grep -q "atuin"; then
    echo "Atuin is already installed."
else
    echo "Atuin is not installed. Proceeding with installation..."

    # Install Atuin using Homebrew
    echo "Installing Atuin via Homebrew..."
    brew install --cask atuin

    # Verify installation
    if brew list --cask | grep -q "atuin"; then
        echo "Atuin has been successfully installed."
    else
        echo "Failed to install Atuin via Homebrew. Please try again."
        exit 1
    fi
fi