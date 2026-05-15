#!/bin/bash

# Install Homebrew
if ! command -v brew &>/dev/null; then
    echo "Homebrew is not installed. Proceeding with installation..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$(whoami)/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"

    if command -v brew &>/dev/null; then
        echo "Homebrew has been successfully installed."
    else
        echo "Failed to install Homebrew. Please try again."
        exit 1
    fi
else
    echo "Homebrew is already installed."
fi

# Install Git
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

# Install iTerm
if [ -d "/Applications/iTerm.app" ]; then
    echo "iTerm2 is already installed."
else
    echo "iTerm2 is not installed. Proceeding with installation..."

    echo "Installing iTerm2 via Homebrew..."
    brew install --cask iterm2

    if [ -d "/Applications/iTerm.app" ]; then
        echo "iTerm2 has been successfully installed."
    else
        echo "Failed to install iTerm2 via Homebrew. Please try again."
        exit 1
    fi
fi

# Install Oh My Zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is already installed."
else
    echo "Oh My Zsh is not installed. Proceeding with installation..."

    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    if [ -d "$HOME/.oh-my-zsh" ]; then
        echo "Oh My Zsh has been successfully installed."
    else
        echo "Failed to install Oh My Zsh. Please try again."
        exit 1
    fi
fi

# Install zsh-autosuggestions using Oh My Zsh
if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]; then
    echo "zsh-autosuggestions is already installed."
else
    echo "zsh-autosuggestions is not installed. Proceeding with installation..."

    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    if [ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
        echo "zsh-autosuggestions has been successfully installed."
    else
        echo "Failed to install zsh-autosuggestions. Please try again."
        exit 1
    fi
fi

# Install Chroma
if command -v chroma &>/dev/null ; then
    echo "Chroma is already installed."
else 
    echo "Chroma is not installed. Proceeding with installation..."
    echo "Installing Chroma..."
    brew install chroma

    if brew list --formula | grep -q "chroma"; then
        echo "Chroma has been successfully installed"
    else
        echo "Failed to install Chroma via Homebrew. Please try again."
        exit 1
    fi
fi

# Install Atuin
if command -v atuin &>/dev/null ; then
    echo "Atuin is already installed."
else
    echo "Atuin is not installed. Proceeding with installation..."

    echo "Installing Atuin..."
    curl https://raw.githubusercontent.com/atuinsh/atuin/main/install.sh | bash

    # Verify installation
    if brew list --cask | grep -q "atuin"; then
        echo "Atuin has been successfully installed."
    else
        echo "Failed to install Atuin via Homebrew. Please try again."
        exit 1
    fi
fi

# Install Opencode
if command -v opencode &>/dev/null ; then
    echo "Opencode is already installed."
else
    echo "Opencode is not installed. Proceeding with installation..."

    echo "Installing Opencode..."
    brew install opencode

    # Verify installation
    if brew list --formula | grep -q "opencode"; then
        echo "Opencode has been successfully installed."
    else
        echo "Failed to install Opencode via Homebrew. Please try again."
        exit 1
    fi
fi

# Install Bat
if brew list --formula | grep -q "bat"; then
    echo "bat is already installed."
else
    echo "bat is not installed. Proceeding with installation..."
    echo "Installing bat via Homebrew..."

    brew install bat

    if brew list --formula | grep -q "bat"; then
        echo "bat has been successfully installed."
    else
        echo "Failed to install bat via Homebrew. Please try again."
        exit 1
    fi
fi

# Install TLDR
if brew list --formula | grep -q "tldr"; then
    echo "tldr is already installed."
else
    echo "tldr is not installed. Proceeding with installation..."
    echo "Installing tldr via Homebrew..."
    brew install tldr

    if brew list --formula | grep -q "tldr"; then
        echo "tldr has been successfully installed."
    else
        echo "Failed to install tldr via Homebrew. Please try again."
        exit 1
    fi
fi

# Install PHP 8.3
if brew list --formula | grep -q "php@8.3"; then
    echo "PHP 8.3 is already installed."
else
    echo "PHP 8.3 is not installed. Proceeding with installation..."
    echo "Installing php8.3 via Homebrew..."
    brew install php@8.3

    if brew list --formula | grep -q "php@8.3"; then
        brew install imagemagick
        brew install pkg-config
        brew link --force php@8.3
        pecl install xdebug-3.3.1 imagick redis
        echo "PHP 8.3 has been successfully installed."
    else
        echo "Failed to install PHP 8.3 via Homebrew. Please try again."
        exit 1
    fi
fi

# Install GitHub Desktop
if [ -d "/Applications/GitHub Desktop.app" ]; then
    echo "GitHub Desktop is already installed."
else
    echo "GitHub Desktop is not installed. Proceeding with installation..."

    echo "Installing GitHub Desktop via Homebrew..."
    brew install --cask github

    if brew list --cask | grep -q "github"; then
        echo "GitHub Desktop has been successfully installed."
    else
        echo "Failed to install GitHub Desktop via Homebrew. Please try again."
        exit 1
    fi
fi

# Install Bitwarden
if [ -d "/Applications/Bitwarden.app" ]; then
    echo "Bitwarden is already installed."
else
    echo "Bitwarden is not installed. Proceeding with installation..."

    echo "Installing Bitwarden via Homebrew..."
    brew install --cask bitwarden

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

# Install Google Chrome
if [ -d "/Applications/Google Chrome.app" ]; then
    echo "Google Chrome is already installed."
else
    echo "Google Chrome is not installed. Proceeding with installation..."

    echo "Installing Google Chrome via Homebrew..."
    brew install --cask google-chrome

    if [ -d "/Applications/Google Chrome.app" ]; then
        echo "Google Chrome has been successfully installed."
    else
        echo "Failed to install Google Chrome via Homebrew. Please try again."
        exit 1
    fi
fi

# Install Firefox
if [ -d "/Applications/Firefox.app" ]; then
    echo "Firefox is already installed."
else
    echo "Firefox is not installed. Proceeding with installation..."

    echo "Installing Firefox via Homebrew..."
    brew install --cask firefox

    if [ -d "/Applications/Firefox.app" ]; then
        echo "Firefox has been successfully installed."
    else
        echo "Failed to install Google Chrome via Homebrew. Please try again."
        exit 1
    fi
fi

# Install Maccy
if brew list --cask | grep -q "maccy"; then
    echo "Maccy is already installed."
else
    echo "Maccy is not installed. Proceeding with installation..."

    echo "Installing Maccy via Homebrew..."
    brew install --cask maccy

    if brew list --cask | grep -q "maccy"; then
        echo "Maccy has been successfully installed."
    else
        echo "Failed to install Maccy via Homebrew. Please try again."
        exit 1
    fi
fi

# Install Another Redis Desktop Manager
if brew list --cask | grep -q "another-redis-desktop-manager"; then
    echo "Another Redis Desktop Manager is already installed."
else
    echo "Another Redis Desktop Manager is not installed. Proceeding with installation..."
    echo "Installing Another Redis Desktop Manager via Homebrew..."
    brew install --cask another-redis-desktop-manager

    # Verify installation
    if brew list --cask | grep -q "another-redis-desktop-manager"; then
        echo "Another Redis Desktop Manager has been successfully installed."
    else
        echo "Failed to install Another Redis Desktop Manager via Homebrew. Please try again."
        exit 1
    fi
fi

# Install DBeaver
if brew list --cask | grep -q "dbeaver-community"; then
    echo "DBeaver is already installed."
else
    echo "DBeaver is not installed. Proceeding with installation..."
    echo "Installing DBeaver via Homebrew..."
    brew install --cask dbeaver-community

    # Verify installation
    if brew list --cask | grep -q "dbeaver-community"; then
        echo "DBeaver has been successfully installed."
    else
        echo "Failed to install DBeaver via Homebrew. Please try again."
        exit 1
    fi
fi

# Install VLC
if brew list --cask | grep -q "vlc"; then
    echo "VLC is already installed."
else
    echo "VLC is not installed. Proceeding with installation..."
    echo "Installing VLC via Homebrew..."
    brew install --cask vlc

    # Verify installation
    if brew list --cask | grep -q "vlc"; then
        echo "VLC has been successfully installed."
    else
        echo "Failed to install VLC via Homebrew. Please try again."
        exit 1
    fi
fi

# Install Folx
if brew list --cask | grep -q "folx"; then
    echo "Folx is already installed."
else
    echo "Folx is not installed. Proceeding with installation..."
    echo "Installing Folx via Homebrew..."
    brew install --cask folx

    # Verify installation
    if brew list --cask | grep -q "folx"; then
        echo "Folx has been successfully installed."
    else
        echo "Failed to install Folx via Homebrew. Please try again."
        exit 1
    fi
fi

# Install Postman
if brew list --cask | grep -q "postman"; then
    echo "Postman is already installed."
else
    echo "Postman is not installed. Proceeding with installation..."
    echo "Installing Postman via Homebrew..."
    brew install --cask postman

    # Verify installation
    if brew list --cask | grep -q "postman"; then
        echo "Postman has been successfully installed."
    else
        echo "Failed to install Postman via Homebrew. Please try again."
        exit 1
    fi
fi

# Install devToys
if brew list --cask | grep -q "devtoys"; then
    echo "devToys is already installed."
else
    echo "devToys is not installed. Proceeding with installation..."
    echo "Installing devToys via Homebrew..."
    brew install --cask devtoys

    # Verify installation
    if brew list --cask | grep -q "devtoys"; then
        echo "devToys has been successfully installed."
    else
        echo "Failed to install devToys via Homebrew. Please try again."
        exit 1
    fi
fi
fi

# Install glow
if brew list --cask | grep -q "glow"; then
    echo "glow is already installed."
else
    echo "glow is not installed. Proceeding with installation..."
    echo "Installing glow via Homebrew..."
    brew install glow

    # Verify installation
    if brew list --cask | grep -q "glow"; then
        echo "glow has been successfully installed."
    else
        echo "Failed to install glow via Homebrew. Please try again."
        exit 1
    fi
fi
