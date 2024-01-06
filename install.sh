#!/bin/bash

                        ############################################################################################################################
                        #                                                   SCRIPT BY F3L3P1N0                                                     #
                        ############################################################################################################################

# COPIA DE TODOS LOS ARCHIVOS DE CONFIGURACIÓN

function copia() {
    # Kitty    
    #mkdir "$HOME/.config/kitty"
    cp -rv $1/home/* "$HOME/"

    # fonts
    sudo cp -rv $1/root/usr/share/fonts/* "/usr/share/fonts/"
    sudo cp -rv $1/root/usr/bin/* "/usr/bin/"
}

# INSTALACION DE REQUERIMIENTOS

function requerimientos() {
    # Update
    sudo pacman -Syu --noconfirm

    # yay
    git clone https://aur.archlinux.org/yay-git.git
    cd yay-git
    makepkg --noconfirm -si

    # git dash xsetroot xrandr xdpyinfo xrdb xset imagemagick megatools bc unzip
    sudo pacman -S --noconfirm git dash xorg-xsetroot xorg-xrandr xorg-xdpyinfo xorg-xrdb xorg-xset imagemagick megatools bc unzip

    # i3lock-color
    git clone https://aur.archlinux.org/i3lock-color.git
    cd i3lock-color
    makepkg --noconfirm -si
}

# INSTALACION DE TODOS LOS PAQUETES

function paquetes() {
    # Alacritty bspwm sxhkd feh polybar picom flameshot rofi sddm zsh lsd bat zsh-syntax-highlighting zsh-autosuggestions
    sudo pacman -S --noconfirm bspwm sxhkd feh polybar picom flameshot rofi sddm zsh lsd bat zsh-syntax-highlighting zsh-autosuggestions
    sudo pacman -S --noconfirm kitty firefox mousepad lxappearance thunar mpd libmpdclient blueberry yakuake flatpak
    #sudo pacman -S --noconfirm open-vm-tools

    # tema para sddm
    yay -S --noconfirm sddm-theme-sugar-candy-git i3-volume
    yay -S --noconfirm picom-git betterlockscreen
}

# INSTALACION DE BETTERLOCKSCREEN

function betterlockscreen() {

    sudo systemctl enable betterlockscreen@$USER
}

# MENSAJES PARA FINALIZAR INSTALACIÓN

function finalizacion() {
    echo "INSTALACIÓN FINALIZADA"
    notify-send "INSTALACIÓN FINALIZADA"
    sleep 1
    notify-send "3"
    sleep 1
    notify-send "2"
    sleep 1
    notify-send "1"
    sleep 1
    notify-send "REINICIANDO..."
    sleep 1
    reboot
}

# SE COMPRUEBA SI EL INSTALADOR SE EJECUTA COMO ROOT

if [ $(whoami) != 'root' ]; then
    ruta=$(pwd)
    requerimientos
    paquetes
    copia "$ruta"
    betterlockscreen "$ruta"
    finalizacion
else
    echo 'Error, el script no debe ser ejecutado como root.'
    exit 0
fi



