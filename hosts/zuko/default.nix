{ inputs, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.raspberry-pi-3
  ];

  glade = {
    apps.enable = false;
    programs.enable = false;
    tooling.enable = false;
  };

  networking.hostName = "zuko";
  networking.wireless.enable = true;

  # taken from https://github.com/NixOS/nixos-hardware/issues/631#issuecomment-1584100732
  # boot.initrd.availableKernelModules = [
  #   "usbhid"
  #   "usb_storage"
  #   "vc4"
  #   "pcie_brcmstb" # required for the pcie bus to work
  #   "reset-raspberrypi" # required for vl805 firmware to load
  # ];

  /*
    You might be tempted to use boot.loader.raspberryPi and/or
    boot.loader.raspberryPi.uboot here.

    Don't.

    Those option will try to install U-Boot and RPi firmware / config stuff in /boot.
    But when using the NixOS aarch64 SD image, all that stuff is *included* in the image
    on a special firmware partition at the start of the SD card, that isn't even mounted
    by default. The boot menu config is communicated to that U-Boot through
    /boot/extlinux, which is written by boot.loader.generic-extlinux-compatible.

    That also means the firmware and U-Boot won't be updated automatically!
  */

  /*
    Another note regarding U-Boot: the U-Boot version included in
    nixos-sd-image-22.11.4369.99fe1b87052-aarch64-linux.img (https://hydra.nixos.org/build/221536209)
    seems to fail to boot when my USB HDD is plugged in (probably tries to boot from it
    and then hangs or something).

    The newest image from includes a newer U-Boot (2023.1):
    nixos-sd-image-23.11pre489246.4e37b4e55b6-aarch64-linux.img (https://hydra.nixos.org/build/221874021)
    With that, the Pi seems to boot without any problems with and without the USB HDD.
  */

  boot.loader.grub.enable = false;
  boot.loader.generic-extlinux-compatible = {
    enable = true;
    configurationLimit = 6;
  };

  boot.initrd.availableKernelModules = [ "usbhid" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_SD";
    fsType = "ext4";
    options = [ "noatime" ];
  };

  hardware.enableRedistributableFirmware = true;
  powerManagement.cpuFreqGovernor = "ondemand";
}
