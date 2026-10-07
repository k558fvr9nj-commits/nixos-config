{ config, pkgs, ... }:

{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.networkmanager.enable = true;

  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb = {
    layout = "ca";
    variant = "";
  };
  console.useXkbConfig = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
  hardware.bluetooth.enable = true;
  services.printing.enable = true;

  zramSwap.enable = true;
  services.fwupd.enable = true;
  services.btrfs.autoScrub.enable = true;

  users.users.shadow = {
    isNormalUser = true;
    description = "shadow";
    extraGroups = [ "wheel" "networkmanager" ];
  };

  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    git vim wget curl pciutils usbutils htop fastfetch
  ];
}
