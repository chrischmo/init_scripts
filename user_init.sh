#!/bin/zsh

#echo "Installing Prezto: ====================================================="
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "Installing Powerline: =================================================="
pip install psutil pyuv i3-py
pip install --user git+git://github.com/Lokaltog/powerline

# Add ~/.local/bin to path
cat >>$HOME/.zprofile <<EOL
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
EOL

echo "TODO:"
# echo "Set zsh as default shell with 'csh -s /bin/zsh' (requires password)"
echo "Install powerline"
echo "Append 'source /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh' to '/etc/zsh/zshrc'"
echo "Install neobundle and bundles (syntastic, youcompleteme, vim-fugitive, gundo.vim, vim-airline"
echo "Change root password with 'passwd'"
echo "Create regular user"
echo "========================================================================"
