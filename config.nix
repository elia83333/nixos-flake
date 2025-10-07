{ config, pkgs, spicetify-nix, ... }:

{
  imports = [
    ./hardware/hardware.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = ["kvm-amd"];

  # Network & Hostname
  networking.hostName = "iusenixbtw";
  networking.networkmanager.enable = true;

  # Timezone & Keyboard
  time.timeZone = "Europe/Rome";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "it_IT.UTF-8";
    LC_IDENTIFICATION = "it_IT.UTF-8";
    LC_MEASUREMENT = "it_IT.UTF-8";
    LC_MONETARY = "it_IT.UTF-8";
    LC_NAME = "it_IT.UTF-8";
    LC_NUMERIC = "it_IT.UTF-8";
    LC_PAPER = "it_IT.UTF-8";
    LC_TELEPHONE = "it_IT.UTF-8";
    LC_TIME = "it_IT.UTF-8";
  };
  services.xserver.xkb = {
    layout = "it";
    variant = "winkeys";
  };
  console.keyMap = "it2";

  # Users
  users.users.elia = {
    isNormalUser = true;
    description = "elia";
    extraGroups = [ "networkmanager" "wheel" "docker" "libvirtd" "qemu-libvirtd" "kvm" ];
    packages = with pkgs; [];
  };

  # NixOS System
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.05";
  programs.niri.enable = true;

  # Audio
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Spicetify
  programs.spicetify = {
    enable = true;
    enabledExtensions = [ spicetify-nix.extensions.marketplace ];
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    dejavu_fonts
  ];

  # Virtualisation
  virtualisation.vmware.guest.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.virtualbox.host.enable = false;
  users.groups.libvirtd.members = ["elia"];
  virtualisation.spiceUSBRedirection.enable = true;
  services.spice-vdagentd.enable = true;

  # Docker
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      experimental = true;
      default-address-pools = [
        {
          base = "172.30.0.0/16";
          size = 24;
        }
      ];
    };
  };
}

