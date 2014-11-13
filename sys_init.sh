#!/bin/sh

echo "========================================================================"
echo "Executing System Setup Script:"
echo "========================================================================"


echo "Updating/Upgrading apt: ================================================"
apt-get update && apt-get upgrade -y


echo "Installing essential tools: ============================================"
# Essential build tools
apt-get install build-essential cmake -y
# LibXML
apt-get libxml2 libxml2-dev libxslt1-dev -y
# Essential utitlies
apt-get install zsh tree dtrx ncurses-term aptitude curl sudo htop ppa-purge -y
# Tools for managing dotfiles
apt-get install vcsh myrepos -y
# Vim & Version control
apt-get install vim-nox git tmux -y
# Python-specific
apt-get install python-dev pylint python-pip -y
# Dependencies for powerline
apt-get install socat -y


echo "Setting zsh as default shell: =========================================="
chsh -s /bin/zsh

echo "========================================================================"
echo "Finished System Setup Script. Exit & reconnect to continue with 2nd part"
echo "========================================================================"
