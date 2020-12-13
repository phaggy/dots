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
       
           progs=('alacritty' 'kitty' 'vim' 'sway' 'mako' 'ranger' 'rofi' 'waybar' 'fish' 'discord' 'neovim' 'python-pywal' )
           aurProgs=('spotify')
           
           echo 'symlinkin'
           for prog in ${progs[@]}; do
	     echo $prog
             if [[ "$prog" != "vim" ]] || [[ "$prog" != "fish" ]] || [[ "$prog" != "discord" ]] || [[ "$prog" != "neovim" ]] || [[ "$prog" != "python-pywal" ]]; then
	       echo $prog
               #ln -sv $HOME/dots/$prog $HOME/.config/
             fi
           done
           
           ln -sv $HOME/dots/.vimrc $HOME/
           ln -sv $HOME/dots/nvim $HOME/.config/
           
           echo 'installing progs'
           
           sudo pacman -S ${progs[@]}
           yay -S ${aurProgs[@]}       

           wal -s -i $HOME/dots/pics/main.png
	fi
	;;
esac
