#!/bin/bash

echo 'Arch or Fedora?'
read dist

echo 'desktop laptop or otherLaptop?'
echo 'd l or oL'
read br

echo 'wayland, xorg or both?'
echo 'w x11 or  both'
read dispProt

case $dist in 
  'fed')
       if [ $br == 'oL']
       then
         cd dots
         git chekcout otherLaptop
       
         progs=('alacritty' 'kitty' 'vim' 'sway' 'mako' 'ranger' 'rofi' 'waybar' 'fish' 'snap')
         snapProgs=('discord' 'spotify' 'nvim')
           
           echo 'symlinkin'
           for prog in ${progs[@]}; do
             if [ $prog != 'vim' || != 'snap' ]
             then
               ln -sv $HOME/dots/$prog $HOME/.config
             fi
           done
           ln -sv $HOME/dots/.vimrc $HOME/
           ln -sv $HOME/dots/nvim $HOME/.config

           echo 'installing pywal'
           pip3 install --user pywal
           echo 'installing progs'
           
           sudo dnf install ${progs[@]}
           sudo snap install ${snapProgs[@]}
	fi
        ;;
  'arch')
        if [ $br == 'oL' ]
	then
           #checking if yay is installed
           if ! hash yay > /dev/null;
           then
             echo 'yay not installed, installing'
	     sudo pacman -S --needed base-devel
             git clone 'https://aur.archlinux.org/yay.git'
             cd yay
             makepkg -si
           fi
           
           cd dots

           git checkout otherLaptop
       
           progs=('alacritty' 'kitty' 'vim' 'sway' 'mako' 'ranger' 'rofi' 'waybar' 'fish' 'discord' 'neovim' 'python-pywal' 'firefox' 'qt5ct' 'lxappearance' 'python-pip' 'nodejs' 'light' 'polkit' 'kdeconnect' 'gparted' 'openssh' 'pulseaudio' 'xdg-user-dirs')
           symProgs=('alacritty' 'kitty' 'vim' 'sway' 'mako' 'ranger' 'rofi' 'waybar')
           aurProgs=('spotify' 'appimagelauncher' 'polkit-dumb-agent-git')
           
           echo 'symlinkin'
           for prog in ${symProgs[@]}; do
	           rm -frv $HOME/.config/$prog
             ln -sv $HOME/dots/$prog $HOME/.config/
           done
           
	   rm -frv $HOME/.vimrc
           ln -sv $HOME/dots/.vimrc $HOME/
	   rm -frv $HOME/.config/nvim
           ln -sv $HOME/dots/nvim $HOME/.config/
           
           echo 'installing progs'
           
     sudo pacman -S ${progs[@]}
     yay -S ${aurProgs[@]}       

	   python3 -m pip install --user pynvim
	   curl -L https://get.oh-my.fish | fish
     wget -nc "https://vault.bitwarden.com/download/?app=desktop&platform=linux" -O ~/Downloads/Bitwaren.appimage

     wal -s -i /usr/share/backgrounds/default.jpg
     rm -v $HOME/.config/waybar/colors-waybar.css
     ln -sv $HOME/.cache/wal/colors-waybar.css $HOME/.config/waybar/
	
	   echo "copying fonts"
	   sudo cp $(pwd)/fonts/materialdesignicons-webfont.ttf /usr/share/fonts
	   sudo cp $(pwd)/fonts/'JetBrains Mono Bold Italic Nerd Font Complete.ttf' /usr/share/fonts
     
     #echo "setting environment variables"
     #touch ~/.profile
     #echo "MOZ_ENABLE_WAYLAND=1" > ~/.profile
     #echo "exec fish" >> ~/.bashrc

	fi
	;;
esac
