#!/bin/bash

                        ############################################################################################################################
                        #                                                   SCRIPT BY F3L3P1N0                                                     #
                        ############################################################################################################################

# COPIA DE TODOS LOS ARCHIVOS DE CONFIGURACIÓN

function copia() {
    # Kitty    
    mkdir "$HOME/.config/"
    cp -rv ~/Bspwm2/home/* "$HOME/.config/"
    sudo cp -rv ~/Bspwm2/root/usr/share/fonts/* "/usr/share/fonts/"
    sudo cp -rv ~/Bspwm2/root/usr/bin/* "/usr/bin/"

}

# INSTALACION DE REQUERIMIENTOS


# INSTALACION DE TODOS LOS PAQUETES
# INSTALACION DE BETTERLOCKSCREEN


# MENSAJES PARA FINALIZAR INSTALACIÓN


# SE COMPRUEBA SI EL INSTALADOR SE EJECUTA COMO ROOT

if [ $(whoami) != 'root' ]; then
    ruta=$(pwd)
    copia "$ruta"

else
    echo 'Error, el script no debe ser ejecutado como root.'
    exit 0
fi



