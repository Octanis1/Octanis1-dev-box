#!/usr/bin/env bash

# TI_MSPGCC_URL=http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/3_02_02_00/exports/msp430-gcc-full-linux-installer-3.2.2.0.run
# TI_MSPGCC_DIR=/opt/ti-mspgcc


# echo "Downloading TI MSPGCC"
# wget -qO installer $TI_MSPGCC_URL
# echo "Installing TI MSPGCC"
# chmod +x installer
# ./installer --mode unattended --prefix $TI_MSPGCC_DIR
# # Copy headers and ldscripts to the correct location to prevent the need to explicitly include them
# cp $TI_MSPGCC_DIR/{include/*.h,msp430-elf/include}
# cp $TI_MSPGCC_DIR/{include/*.ld,msp430-elf/lib}

# echo "export PATH=$TI_MSPGCC_DIR/bin:$PATH" >> /etc/profile
# $TI_MSPGCC_DIR/install_scripts/msp430uif_install.sh

# apt-get update
# apt-get -y dist-upgrade
# apt-get install -y mspdebug linux-image-extra-virtual
# ln -s $TI_MSPGCC_DIR/bin/libmsp430.so /usr/lib/

#gui specifics
apt-get install --force-yes -y xfce4
apt-get install --force-yes -y slim
apt-get install --force-yes -y gnome-icon-theme-full tango-icon-theme
apt-get install -y xfce4-goodies xfce4-mixer geany squeeze synaptic xfburn virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
apt-get install -y freecad kicad firefox
apt-get remove --force-yes -y dictionaries-common



# sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
# apt-get update
# apt-get install --force-yes -y ros-indigo-desktop-full

reboot
