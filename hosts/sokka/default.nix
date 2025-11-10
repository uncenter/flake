{ pkgs, ... }:
{
  glade = {
    apps.enable = false;
    programs.enable = false;
    tooling.enable = false;
  };

  networking.hostName = "sokka";

  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;

    initrd.availableKernelModules = [
      "xhci_pci"
      "usbhid"
      "usb_storage"
    ];

    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  hardware.enableRedistributableFirmware = true;
}
