echo 'Arch or Fedora?'
read dist

echo 'desktop laptop or otherLaptop?'
echo 'd l or oL'
read br

echo 'installing pywal'
pip3 install --user pywal

echo 'cloning dots'
git clone 'https://github.com/phaggy/dots'
cp dots $HOME/


case $dist in 
  'fed')
       case $br in
         'oL')
         cd dots
         git chekcout otherLaptop
       
         progs=('alacritty' 'kitty' 'vim' 'sway' 'mako' 'ranger' 'rofi' 'waybar' 'fish' 'snap')
         snapProgs=('discord' 'spotify' 'nvim')
           
           echo 'symlinkin'
           for prog in ${progs[@]}; do
             if [ $prog != 'vim' ] || [ $prog != 'snap' ] then
               ln -sv $HOME/dots/$prog $HOME/.config
             fi
           done
           ln -sv $HOME/dots/.vimrc $HOME/
           ln -sv $HOME/dots/nvim $HOME/.config
           
           echo 'installing progs'
           
           sudo dnf install ${progs[@]}
           sudo snap install ${snapProgs[@]}
           ;;
  'arch')
        case $br in
          'ol')
           #checking if yay is installed
           if ! hash yay > /dev/null;
           then
             echo 'yay not installed, installing'
             git clone 'https://aur.archlinux.org/yay.git'
             cd yay
             makepkg -si
           fi
           
           cd $HOME/dots
           git chekcout otherLaptop
       
           progs=('alacritty' 'kitty' 'vim' 'sway' 'mako' 'ranger' 'rofi' 'waybar' 'fish' 'discord' 'spotify')
           aurProgs=('nvim')
           
           echo 'symlinkin'
           for prog in ${progs[@]}; do
             if [ $prog != 'vim' ] || [ $prog != 'snap' ] then
               ln -sv $HOME/dots/$prog $HOME/.config
             fi
           done
           ln -sv $HOME/dots/.vimrc $HOME/
           ln -sv $HOME/dots/nvim $HOME/.config
           
           echo 'installing progs'
           
           sudo pacman -S ${progs[@]}
           yay -S ${snapProgs[@]}       

           wal -s -i $HOME/dots/pics/main.png
;;
esac
