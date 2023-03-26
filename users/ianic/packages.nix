{ config, lib, pkgs, ... }:
{
  home.packages = [
    pkgs.bat
    pkgs.chromium
    pkgs.fd
    pkgs.firefox
    pkgs.fzf
    pkgs.git-crypt
    pkgs.htop
    pkgs.jq
    pkgs.ripgrep
    pkgs.rofi
    pkgs.tree
    pkgs.watch
    pkgs.zathura

    pkgs.wget
    pkgs.inetutils
    pkgs.dig
    pkgs.websocat

    #pkgs.xorg.xkbcomp
    #pkgs.xorg.xev
    #pkgs.xorg.xmodmap

    pkgs.go
    pkgs.gopls
    pkgs.zigpkgs.master

    pkgs.tlaplusToolbox
    pkgs.tetex
  ];

  programs.go = {
    enable = true;
    goPath = "code/go";
    #goPrivate = [ "github.com/mitchellh" "github.com/hashicorp" "rfc822.mx" ];
  };

  programs.gpg.enable = true;

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "tty";

    # cache the keys forever so we don't get asked for a password
    defaultCacheTtl = 31536000;
    maxCacheTtl = 31536000;
  };

}
