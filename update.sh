#!/bin/sh

dir=`dirname $0`
dir=`cd $dir && pwd`

vim +PluginUpdate +qall

echo Installing Powerline fonts
cd $dir/external/fonts && git pull
$dir/external/fonts/install.sh

echo Installing Oh My ZSH
brew upgrade zsh
upgrade_oh_my_zsh
cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git pull

echo Installing Python
brew upgrade python@2

echo Installing SafariBooks script
cd $dir/external/safaribooks && git pull
pip install --user .

echo Installing NeoVIM
brew upgrade neovim

echo Installing iTerm2
brew cask upgrade iterm2

echo Installing YCM
cd ~/.vim/bundle/YouCompleteMe

echo Installing prerequisites
curl -sSf https://static.rust-lang.org/rustup.sh | sh

./install.py --all
