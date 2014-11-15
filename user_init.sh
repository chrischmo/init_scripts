#!/bin/zsh

echo "Installing NeoBundle:  ====================================================="
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | zsh

echo "Installing Prezto: ====================================================="
git clone --recursive https://github.com/chrischmo/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
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

echo "Setting up vcsh: ==========================================="
# Clone the myrepos template:
vcsh clone https://github.com/chrischmo/vcsh_mr_template.git mr
mr update
vcsh pull
# Set remote repo of mr from HTTP to SSH URL (TODO How can I fix this permanently?):
vcsh mr remote rm origin
vcsh mr remote add origin git@github.com:chrischmo/vcsh_mr_template.git
vcsh mr push --set-upstream origin master


echo "TODO:"
echo "Change root password with 'passwd'"
echo "Create regular user"
echo "========================================================================"
