############ Install applications #############
## First install command line tools (required for homebrew to work)
#xcode-select --install 
#
## Fetch and execute homebrew install script (the script requires bash, not zsh)
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
#
#
## Homebrew expects Brewfile to be in the home directory (Brewfile will have been
## created using the command 'brew bundle dump' to capture all installs). 
#brew bundle
# Overwrite Brewfile: brew bundle dump --file=~/dotfiles/Brewfile --force
########### Fetch and organise dotfiles ###########
# Make sure you're in the home directory
cd ~/ 

# Clone from personal repo (will create a dotfiles subdirectory)
git clone https://github.com/hughpastoll/dotfiles 
# Hide new dotfiles directory from OS GUI
chflags hidden ~/dotfiles

# Change default shell to bash (from mac default zsh)
chsh -s /bin/bash

## Install neovim plug-in manager
#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create -dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#
## Install neovim plugins
#nvim +PlugInstall
#
#echo "Done"
