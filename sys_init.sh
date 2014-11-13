#!/bin/sh

echo "========================================================================"
echo "Executing System Setup Script:"
echo "========================================================================"


echo "Updating/Upgrading apt: ================================================"
apt-get update && apt-get upgrade -y


echo "Installing essential tools: ============================================"
apt-get install build-essential cmake -y
apt-get libxml2 libxml2-dev libxslt1-dev -y
apt-get install zsh tree dtrx ncurses-term aptitude curl sudo htop ppa-purge -y
apt-get install vim-nox git tmux -y


echo "Installing python-specific tools: ======================================"
apt-get install python-dev pylint python-pip -y


echo "Setting zsh as default shell: =========================================="
chsh -s /bin/zsh

echo "========================================================================"
echo "Finished System Setup Script. Exit & reconnect to continue with 2nd part"
echo "========================================================================"
