#!/bin/sh

# Packages
echo '##### INSTALLING PACKAGES...'
sudo apt install -y \
        autoconf \
        autoconf \
        automake \
        build-essential \
        compton \
        feh \
        git \
        i3lock \
        i3status \
        libev-dev \
        libev-dev \
        libpango1.0-dev \
        libsnack2-dev \
        libstartup-notification0-dev \
        libxcb-cursor-dev \
        libxcb-icccm4-dev \
        libxcb-keysyms1-dev \
        libxcb-randr0-dev \
        libxcb-shape0-dev \
        libxcb-util0-dev \
        libxcb-xinerama0-dev \
        libxcb-xkb-dev \
        libxcb-xrm-dev \
        libxcb-xrm0 \
        libxcb1-dev \
        libxkbcommon-dev \
        libxkbcommon-x11-dev \
        libyajl-dev \
        neovim \
        rofi \
        tmux


# Neovim plugin manager
echo '##### INSTALLING NEOVIM PLUGIN MANAGER...'
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# GTK theme files
echo '##### INSTALLING GTK THEMES...'
mkdir -p ~/.themes \
        ~/.icons

unzip .icons/NordArc-Icons-1.0.zip -d ~/.icons
unzip .themes/NordArc-Theme-1.0.zip -d ~/.themes

# Gnome terminal theme
echo '##### NORD THEME FOR GNOME-TERMINAL...'
./nord.sh

# Config files
echo '##### COPYING CONFIGURATION FILES...'
mkdir -p ~/.config/i3/ \
        ~/.config/i3status/ \
        ~/.config/rofi \
        ~/.config/nvim \
        ~/.config/gtk-3.0

cp .config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini
cp .config/nvim/init.vim        ~/.config/nvim/init.vim
cp .config/i3/config            ~/.config/i3/config
cp .config/i3status/config      ~/.config/i3status/config
cp .config/rofi/config          ~/.config/rofi/config

cp .tmux.conf .compton.conf .bashrc ~/


# i3gaps
echo '##### INSTALLING i3gaps...'
git clone https://www.github.com/Airblader/i3 ~/Documents/i3-gaps \
&& cd ~/Documents/i3-gaps
autoreconf --force --install
rm -rf build/ && mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make -j8 && sudo make install


# st
echo '##### INSTALLING SIMPLE TERMINAL...'
cd ~/Documents
git clone https://github.com/pypaut/st.git && cd st
make && sudo make clean install

