#! /bin/bash
LIST_OF_APPS="ansible"

# update system
echo "Updating ..."
sudo dnf -y update
# install development tools
# sudo dnf -y groupinstall "Development Tools"
# install development libraries
# sudo dnf -y groupinstall "Development Libraries"

# add rpmfusion
echo "Adding rpmfusion repository ..."
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
#install ansible
echo "Installing Ansible ..."
sudo dnf install -y $LIST_OF_APPS
echo "Running ansible playbook ..."
ansible-playbook -K post_install.yml
# oh-my-zsh
echo "Installing oh-my-zsh ..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "Installing antibody .."
curl -sL git.io/antibody | sh -s
# installing powerline zsh
echo "Installing powerline with pip ..."
pip install powerline-status --user
echo "Setting zsh as default shell ..."
chsh -s /bin/zsh
