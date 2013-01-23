defaults write -g ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 0

defaults write org.vim.MacVim MMNativeFullScreen 0


pwd=$PWD

git config --global core.excludesfile $pwd/gitignore_global

cd ~
ln -s $pwd/vim/vimrc.before .vimrc.before
ln -s $pwd/vim/vimrc.after .vimrc.after
[[ !(-a .janus) ]] && ln -s $pwd/vim/janus .janus
ln -s $pwd/zshrc .zshrc
ln -s $pwd/gemrc .gemrc
ln -s $pwd/ackrc .ackrc
cd $pwd


