install:
	sudo chmod +x setup.sh
	./setup.sh
	@echo "All done! Please restart your terminal to apply changes"

p10k-profile:
	cp "$(PWD)/reference-p10k.zsh" ~/.p10k.zsh
	@echo "p10k configuration file copied to ~/.p10k.zsh"

setup: install p10k-profile

teardown:
	uninstall_oh_my_zsh
	-rm -rf ~/.zshrc 
	-rm -rf ~/.zshrc.pre-oh-my-zsh
	-rm -rf ~/.p10k.zsh
