#/bin/bash

echo "[-] updateing [-]"
sudo apt update && sudo apt upgrade

echo "[-] Installing fonts [-]"
echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/3270.zip"
unzip 3270.zip -d ~/.fonts
fc-cache -fv
echo "Done installing fonts"

echo "[-] Installing Git [-]"
sudo apt-get install git

echo "[-] Installing Python && Pip [-]"
sudo apt install wget build-essential libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install python3.11
sudo apt install python3.11-venv
sudo apt install python3-pip

echo "[-] Installing Oh My Zsh [-]"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "[-] Installing Plugins [-]"

echo "[-] zsh-autosuggestions [-]"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "[-] zsh-syntax-highlighting [-]"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc

ehco "[-] Installing Starship [-]"
curl -sS https://starship.rs/install.sh | sh

sudo mv .zshrc ~/.zshrc

starship preset nerd-font-symbols -o ~/.config/starship.toml
