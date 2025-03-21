# My Custom ZSH Setup

Based on [this gist](https://gist.github.com/AmreeshTyagi/013feb0a2b95fddf7361e58a4d8ff128)

## Install

```bash
# install oh-my-zsh and powerlevel10k
sudo chmod +x setup.sh
./setup.sh
```

Log out of the shell and log back in to see the changes.
Better to do <CTRL+D> and then log back in because `zsh` shell might start in the middle of installation.
Now setup the p10k profile.

> Note: you might directly be taken into a terminal session to setup a new profile. Just type `q' to exit the setup and then follow the steps below.

```bash
# setup the powerlevel10k configuration
cd <path/to/this/zsh/setup>
cp reference-p10k.zsh ~/.p10k.zsh

# add the p10k configuration to the zshrc
echo '[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc
source ~/.zshrc
```

## Uninstall

```bash
uninstall_oh_my_zsh
rm -rf ~/.zshrc 
rm -rf ~/.zshrc.pre-oh-my-zsh
rm -rf ~/.p10k.zsh
```