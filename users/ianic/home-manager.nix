{ config, lib, pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./doom-emacs.nix
    ./shell.nix
    ./git.nix
    ./desktop.nix
  ];
  # Home-manager 22.11 requires this be set. We never set it so we have
  # to use the old state version.
  home.stateVersion = "18.09";
}
