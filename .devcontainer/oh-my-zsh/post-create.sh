#!/bin/bash

echo '[INFO] Copying p10k.zsh...'
cp ./oh-my-zsh/p10k.zsh ~/.p10k.zsh

echo '[INFO] Setting up oh-my-zsh...'
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc
