#!/bin/sh

files="zshrc zprofile shell_prompt.sh vimrc zprofile zshenv"

for i in $files; do
    ln -sf $PWD/$i ~/.$i;
done;

mkdir ~/bin 2>/dev/null
ln -sf $PWD/bin/safari ~/bin/safari
ln -sf $PWD/bin/KindleGen_Mac_i386_v2_9 ~/bin/kindlegen

echo Remember to put your safaribooks pass and user to ~/.safaribooks.conf
cp $PWD/safaribooks.conf ~/.safaribooks.conf

