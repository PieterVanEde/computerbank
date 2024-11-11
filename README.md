# How to install

1. Download `Linux Mint`, `Xfce edition` from the [official download page](https://linuxmint.com/download.php)
2. Put the image on a bootable USB disk
3. Boot from the USB disk, and select the `OEM install`.

WARNING: If you are testing the installation within VirtualBox (or other virtualization software), please read the relevant remarks on the [Linux Mint release notes](https://www.linuxmint.com/rel_wilma.php)

When you have booted into the OEM install phase, open a terminal and:
1. Use the program to identify any needed additional drivers.
2. Execute `sudo apt install git -y`
3. Execute `git clone https://github.com/PieterVanEde/computerbank.git`
4. Execute `cd computerbank`
5. Execute `./postinstall.sh`
6. Execute the shortcut on the `desktop` to `end the OEM install phase` and after the confirmation, shutdown.

The laptop is ready to be shipped.