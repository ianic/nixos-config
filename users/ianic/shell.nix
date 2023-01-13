{ config, lib, pkgs, ... }:
{

  home.sessionVariables = {
    LANG = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    EDITOR = "emacsclient -nw";
    PAGER = "less -FirSwX";
    MANPAGER = "sh -c 'col -bx | ${pkgs.bat}/bin/bat -l man -p'";
    DEFAULT_USER = "ianic";
  };

  # folders to add to the $PATH
  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/script"
  ];

  programs.bash = {
    enable = true;
    shellOptions = [];
    historyControl = [ "ignoredups" "ignorespace" ];
    initExtra = builtins.readFile ./bashrc;

    shellAliases = {
      ga = "git add";
      gc = "git commit";
      gco = "git checkout";
      gcp = "git cherry-pick";
      gdiff = "git diff";
      gl = "git prettylog";
      gp = "git push";
      gs = "git status";
      gt = "git tag";
      e = "emacsclient -n";
    };
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      e = "emacsclient -n";
      d = "ls -al";
      #update = "sudo nixos-rebuild switch";
    };
    history = {
      size = 10000;
      path = ".local/share/zsh/history";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };
    # interactiveShellInit = ''
    #   SPACESHIP_PROMPT_ADD_NEWLINE=false
    #   SPACESHIP_PROMPT_SEPARATE_LINE=false
    #   # https://denysdovhan.com/spaceship-prompt/docs/Options.html#exit-code-exit_code
    #   SPACESHIP_PROMPT_ORDER=(
    #     time          # Time stampts section
    #     user          # Username section
    #     dir           # Current directory section
    #     host          # Hostname section
    #     git           # Git section (git_branch + git_status)
    #     jobs          # Background jobs indicator
    #     exit_code     # Exit code section
    #     char          # Prompt character
    #   )
    #   SPACESHIP_PROMPT_ASYNC=false
    #   SPACESHIP_USER_SHOW=false
    #   SPACESHIP_DIR_PREFIX=
    #   setopt completealiases
    # '';
  };

  programs.direnv = {
    enable = true;
    # ref: https://github.com/nix-community/nix-direnv
    nix-direnv.enable = true;

    # ref: https://github.com/nix-community/home-manager/blob/176e455371a8371586e8a3ff0d56ee9f3ca2324e/modules/programs/direnv.nix#L31
    #      https://manpages.ubuntu.com/manpages/bionic/man1/direnv.toml.1.html
    config = {
      whitelist = {
        prefix= [
          "$HOME/code/"
          "$HOME/src/"
        ];

        exact = ["$HOME/.envrc"];
      };
    };
  };

  programs.alacritty = {
    enable = true;

    settings = {
      env.TERM = "xterm-256color";

      key_bindings = [
        { key = "K"; mods = "Command"; chars = "\\x0c"; }
        { key = "V"; mods = "Command"; action = "Paste"; }
        { key = "C"; mods = "Command"; action = "Copy"; }
	      { key = "F"; mods = "Command"; action = "SearchForward"; }
	      { key = "B"; mods = "Command"; action = "SearchBackward"; }
        { key = "Key0"; mods = "Command"; action = "ResetFontSize"; }
        { key = "Equals"; mods = "Command"; action = "IncreaseFontSize"; }
        { key = "Minus"; mods = "Command"; action = "DecreaseFontSize"; }
      ];
    };
  };

  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./kitty;
  };


}
