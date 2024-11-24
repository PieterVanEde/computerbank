# How to prepare a laptop/desktop

## Preparation

1. Make sure the laptop/desktop meets the following criteria:
	- Working battery (test is executed later on)
	- At least 8 GB memory (if less, then really test in OEM phase if the performance is acceptable)
	- Working WIFI adapter (for desktops, you can buy extension cards to provide WIFI functionality)
2. Apply BIOS updates if available (some BIOSes can only be upgraded via Windows utilities, which is then impossible if the Windows installation is already removed)
3. Run the onboard diagnostics if available (usually found during boot menu)
4. If the device came with a SSD or HDD, then make sure to securely wipe it. Please follow the steps in <<TODO link or include other documentation>>
5. When asked how to partition the disk, always choose `wipe entire disk` when it is available. If the disk is already empty, this option is not available of course.
6. Pick an easy to remember password for the default OEM user. This user and all related files are removed before the laptop is shipped.

## OEM preparation

1. Download `Linux Mint`, `Xfce edition` from the [official download page](https://linuxmint.com/download.php)
2. Put the image on a bootable USB disk
3. Boot from the USB disk, and select the `OEM install`.
4. Do install `multimedia codecs` when asked.
5. Always wipe

WARNING: If you are testing the installation within VirtualBox (or other virtualization software), please read the relevant remarks on the [Linux Mint release notes](https://www.linuxmint.com/rel_wilma.php)

When you have booted into the OEM install phase, open a terminal and:
1. Use the program to identify any needed additional drivers.
2. Execute `sudo apt install git -y`
3. Execute `git clone https://github.com/PieterVanEde/computerbank.git`
4. Execute `cd computerbank`
5. Execute `./postinstall.sh`

## Testing

1. Open a browser and start a Youtube video. Check if video and audio work as intended.
2. Open a webpage (nu.nl suits well because there is always lots of content that requires processor activity), and disconnect power. Time to see if the battery lasts for 1 hour. If not: the battery needs replacement.

## Final preparation

1. Reconnect the power
2. Remove any configured WIFI connection
3. Execute the shortcut on the `desktop` to `end the OEM install phase` and after the confirmation, shutdown.
4. Print the manual and stick it on the laptop

The laptop is ready to be shipped.