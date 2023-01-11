{ config, pkgs, callPackage, ... }:

{

  services.xserver = {
    layout = "us(mac), hr(unicode)";
    displayManager = {
      sessionCommands = ''
        ${pkgs.xorg.xset}/bin/xset r rate 400 40
      '';
    };
  };

  # https://github.com/nix-community/home-manager/pull/2408
  # environment.pathsToLink = [ "/share/fish" ];
  #
  imports = [
    ./keyboard.nix
  ];

  users.users.ianic = {
    isNormalUser = true;
    home = "/home/ianic";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.zsh;
    hashedPassword = "$6$C5ywu42NGOjx0umV$uLU4zZHFyb1PEQB8ts1kBxQhIhaMK7DWLpzk8VaFBJlN6pb2tQ50N4Lc0RJW7iLwyDwqSgIlDiZfQSWSS5nO30";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA66VPfCd+lRrUVOQqqjfaQu9z7JRGeYsCd1sb3IlQuI5SHg+17BV8YQVLePxaeSnFILXQBKfu2wbaCD/hH63YCR74mN5IU60LTSY922X7Te32bk3RSnW6aSS26yKheGMFjKjABk6VQB8C7OkXVh+paIinkAWzqBhVbaKHIr6KUDh+uLda7lEI8IVd0xhHFGD5TLYg7siSw7n9Xe18+IJ33JhPIQ33IpLPUGKb4tl7XWDf7BLWnmzMKfOR4tw5nFIknpuHAWNvDkQpbs1h3N7pYJltlcleKuRXstMj0A7x8u3lsnnV326F4Hu+0wD8dzedQTsrPewx8b3MVOvsXTkp0w== ianic@tien"
    ];
  };

  services.emacs.package = pkgs.emacsUnstable;

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    #(import ./doom-emacs.nix)
    #
    # (import (builtins.fetchTarball {
    #   url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    # }))
  ];
}
