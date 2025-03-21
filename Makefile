OH_MY_ZSH_INSTALLER = https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
POWER_LEVEL_10K_GITHUB = https://github.com/romkatv/powerlevel10k.git

oh-my-zsh:
	sh -c "$(curl -fsSL $(OH_MY_ZSH_INSTALLER))"
	@echo "Please restart your terminal to apply changes"

power-level-10k:
	git clone --depth=1 $(POWER_LEVEL_10K_GITHUB) ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

all: oh-my-zsh power-level-10k
	@echo "All done! Please restart your terminal to apply changes"
