#!/usr/bin/env bash

TI_MSPGCC_URL=http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/3_02_02_00/exports/msp430-gcc-full-linux-installer-3.2.2.0.run
TI_MSPGCC_DIR=/opt/ti-mspgcc

echo "Downloading TI MSPGCC"
wget -qO installer $TI_MSPGCC_URL
echo "Installing TI MSPGCC"
chmod +x installer
./installer --mode unattended --prefix $TI_MSPGCC_DIR

# Copy headers and ldscripts to the correct location to prevent the need to explicitly include them
cp $TI_MSPGCC_DIR/{include/*.h,msp430-elf/include}
cp $TI_MSPGCC_DIR/{include/*.ld,msp430-elf/lib}

echo "export PATH=$TI_MSPGCC_DIR/bin:$PATH" >> /etc/profile
$TI_MSPGCC_DIR/install_scripts/msp430uif_install.sh

apt-get update
apt-get -y dist-upgrade
apt-get install -y mspdebug linux-image-extra-virtual
ln -s $TI_MSPGCC_DIR/bin/libmsp430.so /usr/lib/


#gui specifics
echo "Downloading and installing GUI (XFCE)"
apt-get install --force-yes -y xfce4
apt-get install --force-yes -y slim
apt-get install --force-yes -y gnome-icon-theme-full tango-icon-theme
apt-get install -y xfce4-goodies xfce4-mixer geany squeeze synaptic xfburn virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
apt-get remove --force-yes -y dictionaries-common

echo "Downloading and installing applications"
apt-get install -y freecad kicad firefox
apt-get install --force-yes -y git
apt-get install --force-yes -y stellarium
apt-get install --force-yes -y openjdk-7-jdk
apt-get install --force-yes -y eclipse
apt-get install --force-yes -y geany


echo "Downloading and installing ROS"
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu trusty main" > /etc/apt/sources.list.d/ros-latest.list'
apt-get update
apt-get install --force-yes -y ros-indigo-desktop-full


echo "Downloading Energia and Eclipse, making shortcut on Desktop"
wget http://energia.nu/downloads/downloadv3.php?file=energia-0101E0014-linux.tgz
tar xvf downloadv3.php\?file\=energia-0101E0014-linux.tgz 
ln -s /home/vagrant/energia-0101E0014/energia /home/vagrant/Desktop/energia 

wget http://mirror.switch.ch/eclipse/technology/epp/downloads/release/luna/SR1a/eclipse-cpp-luna-SR1a-linux-gtk.tar.gz
tar xvf eclipse-cpp-luna-SR1a-linux-gtk.tar.gz 
ln -s /home/vagrant/eclipse/eclipse /home/vagrant/Desktop/eclipse


echo "Cloning Octanis1 repos onto Desktop"

git clone https://github.com/Octanis1/Octanis1-Electronics.git /home/vagrant/Desktop/Octanis1-Electronics
git clone https://github.com/Octanis1/Octanis1-Eclipse.git /home/vagrant/Desktop/Octanis1-Eclipse
git clone https://github.com/Octanis1/Octanis1-CAD.git /home/vagrant/Desktop/Octanis1-CAD
git clone https://github.com/Octanis1/Octanis1-3D-Simulation.git /home/vagrant/Desktop/Octanis1-3D-Simulation
git clone https://github.com/Octanis1/Octanis1-Energia.git /home/vagrant/Desktop/Octanis1-Energia
git clone https://github.com/Octanis1/Octanis1-Documentation.git /home/vagrant/Desktop/Octanis1-Documentation


echo "Setting up keyboard to CH-DE"

wget https://raw.githubusercontent.com/Octanis1/Octanis1-dev-box/master/setup/keyboard
mv keyboard /etc/default/keyboard


echo "Setting up firefox"
cd /home/vagrant
rm -rf .mozilla
wget https://raw.githubusercontent.com/Octanis1/Octanis1-dev-box/master/setup/mozzarella.tar.gz
tar xvf mozzarella.tar.gz
chown vagrant .mozilla -R


echo "Rebooting."

reboot





