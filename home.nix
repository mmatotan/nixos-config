{ config, pkgs, ...}:

{
  home.username = "marko";
  home.homeDirectory = "/home/marko";
  home.stateVersion = "25.05";
  programs.bash = {
    enable = true;
  };

  programs.wofi = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "mmatotan";
    userEmail = "mrkanic@gmail.com";
    extraConfig = {
      init.defaultBranch = "master";
    };
  };
}
