defaults write -g ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 0

defaults write org.vim.MacVim MMNativeFullScreen 0


pwd=$PWD

git config --global core.excludesfile $pwd/gitignore_global

cd ~
ln -s $pwd/vim/vimrc .vimrc
ln -s $pwd/vim/gvimrc .gvimrc
[[ !(-a .vim/pack/jede) ]] && mkdir -p .vim/pack && ln -s $pwd/vim/jede ~/.vim/pack/jede
ln -s $pwd/zshrc .zshrc
ln -s $pwd/gemrc .gemrc
ln -s $pwd/ackrc .ackrc
cd $pwd


