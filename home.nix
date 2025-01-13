{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "luke";
  home.homeDirectory = "/home/luke";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Manage my dots folders
  home.file.".config/awesome".source = ./dots/awesome;
  home.file.".config/picom".source = ./dots/picom;
  home.file.".config/rofi".source = ./dots/rofi;

}
