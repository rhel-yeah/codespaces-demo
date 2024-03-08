#!/bin/bash

echo '[INFO] Installing oh-my-zsh...'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo '[INFO] Setting up Powerlevel10k...'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

echo '[INFO] Setting up oh-my-zsh...'
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc
