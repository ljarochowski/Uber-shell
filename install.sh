#!/bin/sh

dir=`dirname $0`
dir=`cd $dir && pwd`

echo Installing Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

files="zshrc zprofile shell_prompt.sh vimrc zprofile zshenv"

for i in $files; do
    ln -sf $dir/$i ~/.$i;
done;

vim +PluginInstall +qall

mkdir ~/bin 2>/dev/null
ln -sf $dir/bin/safari ~/bin/safari
ln -sf $dir/bin/KindleGen_Mac_i386_v2_9 ~/bin/kindlegen

echo Remember to put your safaribooks pass and user to ~/.safaribooks.conf
cp $dir/safaribooks.conf ~/.safaribooks.conf

echo Installing Powerline fonts
git clone https://github.com/powerline/fonts.git $dir/external/fonts
$dir/external/fonts/install.sh

echo Installing Brew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo Installing Oh My ZSH
brew install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo Installing Python
brew install python@2

echo Installing SafariBooks script
git clone https://github.com/ViciousPotato/safaribooks.git $dir/external/safaribooks
cd $dir/external/safaribooks
pip install --user .

echo Installing NeoVIM
brew install neovim

echo copying vimrc to nvim/init.vim
mkdir -p ~/.config/nvim
ln -sf $dir/vimrc ~/.config/nvim/init.vim

echo Installing YCM
cd ~/.vim/bundle/YouCompleteMe

echo Installing prerequisites
curl -sSf https://static.rust-lang.org/rustup.sh | sh

./install.py --all

echo Changing Shell to ZSH
chsh -s /bin/zsh
