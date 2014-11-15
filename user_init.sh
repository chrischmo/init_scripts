#!/bin/zsh

echo "========================================================================"
echo "User setup starting..."
echo "Please make sure you run this script from your home directory."
echo "The following requirements are implied:"
echo "- This command is run from within zsh (for the other requirements, see 'sys_init.sh'"
echo "- The user has installed his/her public key for github (use ssh-add)."
echo "========================================================================"


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

# Add ~/.local/bin to path:
cat >>$HOME/.zprofile <<EOL
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
EOL

# Activate zsh plugin:
cat >>$HOME/.zshrc <<EOL
if [[ -r ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source ~/.local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
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


echo "========================================================================"
echo "User setup finished - please check sys_out for possible errors!"
echo "========================================================================"
