# Mac setup goals

This document describes and explains the steps to take to restore the functionality of a mac computer to a
particular desired state without retaining any data. to avoid having to manually customise OS settings,
reinstall and configure applications.  

## Configure MacOS

### Restore OS GUI settings

I want to have a script that configures mac OS to how a like it (so I don't have to go into menus etc when I get a new machine). 

- map the Capslock key to Esc. 
- need to use the 'defaults' CLI utility that manages all the settings (stored
  in various '.plist' files (in e.g. ~/Library/Preferences/ but also elsewhere).
  You need to use the 'defaults' utility because all the .plist files are binary
  so can't easily be edited directly. 
- .plist files are XML property lists
- the syntax for this: `defaults read ~/path/to/config.plist`
- The general strategy with 'defaults' is: 
  	- get the readout of all .plist settings
	- make the change in the OS gui
	- get the new readout of all .plist settings
	- grep to find the difference between the two
- you can find the data type of each entry by:

> defaults read-type com.apple.TextEdit CheckGrammarWithSpelling

- find the domain with text-string that you are interested in:

> defaults domains | tr ',' '\n' grep text-string


### Restore config files 

Use tmux (terminal multiplexing) - very helpful for programming
$PATH (/etc...) 
zsh config

I want to set up a configuration of the zsh shell. See e.g. here: https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout
## Restore complement of functionality

### Restore applications

I want to use homebrew to save and recreate as much of the state of the system as possible, captured in a Brewfile. For anything that can't be done this way I want a document that explicitly records what I have done and how to recreate it. Homebrew relies on Mac's Command Line Tools (usually bundled with XCode) to be installed. To install only the CL tools use:

> xcode-select --install

Homebrew will use the mas-cli (mac app store command line interface) tool to install mac app store apps. You need to install this using brew: 'brew install mas'. Then you can use 'mas install "xxx", id:xxxx' to install mac app store apps. See this reference: https://github.com/mas-cli/mas 

I want to use upgrade to the latest version of vim using homebrew. See resources
here:
https://vi.stackexchange.com/questions/10733/when-using-macvim-with-symlinks-is-opening-vim-just-calling-mvim-v
and here:
https://apple.stackexchange.com/questions/59375/how-do-i-install-macvim The best
thing might just be to use Homebrew to install Vim and then make sure that the
$PATH variable (constructed from the file /etc/paths) first looks at the vim
installed by homebrew. 

You can create a record of all the homebrew formulae, casks jjjjjjjjjj jjjj and mas's in a 
Brewfile and read it in when you want to 

 [Update] I want to use Neovim instead of Vim as an editor for everything. Note: use the command nvim instead of neovim 
- This means editing the .init file (~/.config/nvim/init.vim instead of ~/.vimrc)
### Restore application configurations

#### Text editor

I want to use vim as an editor for rust and python. This means I will have to
configure vim to be able to do this, which will probably involve downloading and
installing code analysers.  [Update] I want to use Neovim instead of Vim as an
editor for everything. Note: use the command nvim instead of neovim 

- This means editing the .init file (~/.config/nvim/init.vim instead of
  ~/.vimrc)
- To enable automatic installs of Vim packages use vim-plug plug-in manager. To
  install vim-plug itself, you have to put the plug.vim file in
  ~/.local/share/nvim/site/autoload/ . You may need to create the directory
  yourself, but you can also run the command: 

  > sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

- This also means using the vim-plug plug-in manager (widely recommended as lightweight and reliable) with the ~/.local/share/nvim/plugged folder used for storing plug-ins (vim-plug will put them there but you might have to create the folder yourself). To install plug-ins type :PlugInstall inside vim/nvim or nvim +PlugInstall at the command line. 
- For adding IDE capabilities to nvim use the following tools:
	- ALE (Automatic Linting Engine). This provides both linting and autocompleting. You have to activate the LSP (Language Server Protocol) engine (rust-analyzer) and turn on autocompletion in the .init file. 
	- Language syntax recognition. I used rust.vim for rust, but I'm not sure it's strictly necessary with ALE (check!)

- To

#### IDE

#### Managing 'dotfiles'
All config files (ususally start with a '.' to made them hidden (e.g. .init for
neovim config) can be stored in a remote git repository (e.g. Github) and pulled
when configuring a system. 

It's common to put all the dotfiles into a 'dotfiles' directory inside your home
directory to use git easily (and not have an enormous and fragile .gitignore
file). You can hide/unhide the dotfiles directory with 'chflags hidden/nohidden
~/dotfiles' (this will only change its visibility in the gui). Then make it a
git repo ('git init') - make sure to configure git if you haven't already. 

Move (not copy) all your .dotfiles to the dotfiles directory and create symlinks
from their original locations. For example if you had a .file1 in ~/ :

- move it to ~/dotfiles/.file1
- create a symlink to it from ~/ (ln -s ~/dotfiles/.file1 ~/file1) - this will
  create a new symbolic .file1 in ~/

Note that you should always replace .dotfiles with symlinks in their *original*
location. So, e.g. the neovim .init config file would be replaced with an
init.vim symbolic link at ~/.config/nvim/init.vim 

Then push the repo to your remote repository.  

#### Git config
Set your name and email:
git config --global user.name "Hugh Pastoll"
git config --global user.name hughpastoll@gmail.com

Set default initial branch name to 'main':
git config --global init.defaultBranch main

You will need to add the remote repository so that git knows about it. For
example: git remote add origin https://github/hughpastoll/dotfiles
The name 'origin' and the url could be something completely different. You'll
need to make the repository before you add it - this can be done on github
directly. 

Github now uses personal access tokens (PATs) instead of passwords. Generate a PAT
on the website and use it like you would a password when asked to authenticate.
OSX keychain should store it automatically if git's credential-osxkeychain
functionality has been installed. To check this type 'git credential-osxkeychain'
and if you get output with a <get|store|erase> component you should be fine. 


#### Document creation
Pandoc

### Programming languages

Worth thinking about virtual environment

#### Rust

#### Python 
## Misc 

 I want to have virtual environment managers for python and rust. I might need to write a shell script to be able to recreate them. The .vimrc file in ~/ needs to be edited (see here: https://opensource.com/article/20/7/vim-rust-ide). so that vim can do syntax highlighting etc. The .vimrc file can include a script to install they vim-plug packagemanager if it isn't already installed (therefore don't have to do this through homebrew). The .vimrc file can also include statements that install plugins that are mentioned in the plugin manager 'activation' code block but are not already installed.  

## To do

 - find out about fuzzy search
 - find out about automatic setting of OS configurations

