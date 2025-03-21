#!/bin/bash

# Detect OS type
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    OS_TYPE="mac"
    SED_COMMAND="sed -i ''"
    INSTALL_COMMAND="brew install"
else
    # Linux and others
    OS_TYPE="linux"
    SED_COMMAND="sed -i"
    INSTALL_COMMAND="sudo apt install"
fi

# Install zsh
if [[ "$OS_TYPE" == "mac" ]]; then
    brew install zsh
else
    sudo apt install zsh -y
fi

# Show version
zsh --version

# Set zsh as default shell
chsh -s $(which zsh)

# Echo zsh
echo $SHELL

# Logout & Login if don't see zsh as default shell.
echo "Logout & Login if don't see zsh as default shell."

# Install oh-my-zsh. https://github.com/ohmyzsh/ohmyzsh
# Assuming you have curl installed.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Use agnoster theme
# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes#agnoster
# Edit ZSH_THEME
if [[ "$OS_TYPE" == "mac" ]]; then
    sed -i '' 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
else
    sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
fi

# Install powerline font
if [[ "$OS_TYPE" == "mac" ]]; then
    brew tap homebrew/cask-fonts
    brew install --cask font-powerline-symbols
else
    sudo apt-get install fonts-powerline -y
fi

# Install powerlevel10k
sudo rm -R ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k 2>/dev/null || true
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Edit zshrc and add powerlevel
if [[ "$OS_TYPE" == "mac" ]]; then
    sed -i '' 's/ZSH_THEME="agnoster"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
else
    sed -i 's/ZSH_THEME="agnoster"/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
fi

# Install plugins (zsh-autosuggestions and zsh-syntax-highlighting)
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions 2>/dev/null || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 2>/dev/null || true

# Enable plugins
if [[ "$OS_TYPE" == "mac" ]]; then
    sed -i '' 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
else
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
fi

echo "Successfully Installed. Start new terminal and configure powerlevel10k."
echo "If p10k configuration wizard does not start automatically, run following"
echo "p10k configure"
echo "Thanks for using this script. It actually saves lot of time to install & configure zsh."