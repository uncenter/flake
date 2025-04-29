{ pkgs, ... }:
{
  glade = {
    apps.enable = false;
    programs.enable = false;
    tooling.enable = false;
  };

  networking.hostName = "zuko";
  networking.wireless.enable = true;

  # taken from https://github.com/NixOS/nixos-hardware/issues/631#issuecomment-1584100732
  boot.initrd.availableKernelModules = [
    "usbhid"
    "usb_storage"
    "vc4"
    "pcie_brcmstb" # required for the pcie bus to work
    "reset-raspberrypi" # required for vl805 firmware to load
  ];
  hardware.enableRedistributableFirmware = true;
}
