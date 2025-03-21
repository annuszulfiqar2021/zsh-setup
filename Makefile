POWER_LEVEL_10K_GITHUB = https://github.com/romkatv/powerlevel10k.git

oh-my-zsh:
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	@echo "Please restart your terminal to apply changes"

power-level-10k:
	git clone --depth=1 $(POWER_LEVEL_10K_GITHUB) ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

update-zshrc:
	@if grep -q "ZSH_THEME=" ~/.zshrc; then \
		sed -i '' 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc; \
	else \
		echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc; \
	fi
	@echo "ZSH_THEME updated in ~/.zshrc"

setup-p10k:
	cp "$(CURDIR)/reference-p10k.zsh" ~/.p10k.zsh
	@echo "p10k configuration file copied to ~/.p10k.zsh"

all: oh-my-zsh power-level-10k update-zshrc setup-p10k
	@echo "All done! Please restart your terminal to apply changes"
