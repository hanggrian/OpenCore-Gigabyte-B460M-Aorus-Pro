OpenCore Gigabyte B460M Aorus Pro
=================================
![Screenshot](/art/screenshot.png)

OpenCore configurations for Gigabyte B460M Aorus Pro.

Hardware
--------
* Intel Core i5-10400
* Sapphire Pulse RX 580 8GB
* 4x8GB Corsair Vengeance LPX DDR4 2666MHz
* Samsung 970 EVO NVMe M.2 250GB
* Corsair Force MP300 NVMe M.2 120GB (Windows Boot)

Configuration
-------------
* `RELEASE` version of [OpenCorePkg](https://github.com/acidanthera/OpenCorePkg/releases) and all kexts.
* Always use prebuilt SSDTs.
* Setup GUI with modern look.
* `Microsoft` directory is optional, it is a Windows multiboot on different drive.

Resources
---------
* [Desktop ACPI](https://dortania.github.io/Getting-Started-With-ACPI/ssdt-platform.html#desktop)
* [Desktop Comet Lake config.plist](https://dortania.github.io/OpenCore-Install-Guide/config.plist/comet-lake.html)
* [Post-Install: Setting up GUI](https://dortania.github.io/OpenCore-Post-Install/cosmetic/gui.html#setting-up-opencores-gui).