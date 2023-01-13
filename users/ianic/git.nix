{ config, lib, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Igor Anic";
    userEmail = "igor.anic@gmail.com";
    # signing = {
    #   key = "523D5DC389D273BC";
    #   signByDefault = true;
    # };
    aliases = {
      prettylog = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(r) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative";
      root = "rev-parse --show-toplevel";
    };
    extraConfig = {
      branch.autosetuprebase = "always";
      color.ui = true;
      core.askPass = ""; # needs to be empty to use terminal for ask pass
      credential.helper = "store"; # want to make this more secure
      github.user = "ianic";
      push.default = "tracking";
      init.defaultBranch = "main";
      url = {
         "git@github.com:" = {
           insteadOf = "https://github.com/";
         };
      };
      core = {
         editor = "emacsclient -nw";
      };
    };
  };

}
