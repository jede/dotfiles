defaults write -g ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 0

pwd=$PWD
cd ~
ln -s $pwd/vim/vimrc.before .vimrc.before
ln -s $pwd/vim/vimrc.after .vimrc.after
ln -s $pwd/vim/janus .janus
ln -s $pwd/zshrc .zshrc
cd $pwd


