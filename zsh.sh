#!/bin/bash

set -e

apt update && apt install git zsh curl -y && chsh -s $(which zsh) && \
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o install.sh && \
chmod +x install.sh && \
./install.sh --skip-chsh --unattended && \
rm install.sh && \
git clone http://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions && \
git clone http://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting && \
sed -e '/ZSH_THEME=/s/"robbyrussell"/"ys"/' \
    -e '/plugins=(git/s/)/ zsh-autosuggestions zsh-syntax-highlighting)/' -i ~/.zshrc && \
zsh
