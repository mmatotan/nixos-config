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

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      exec = "hyprpaper";
      monitor = "main, 1920x1080@60.00HHz, 0x0, 1";
      decoration = {
        rounding = "4";
        inactive_opacity = "0.8";
      };
      general = {
        gaps_in = "8";
        gaps_out = "16";
        border_size = "4";
      };
      input = {
        follow_mouse = "0";
        mouse_refocus = "false";
        accel_profile = "flat";
      };
      bind =
        [
          "$mod, Return, exec, alacritty"
          "$mod SHIFT, Return, exec, firefox"
	  "$mod, q, killactive"
	  "$mod, f, fullscreen"
        ]
        ++ (
          builtins.concatLists (builtins.genList (i:
              let ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );
    };
  };
}
