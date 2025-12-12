{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.username = "dan";
  home.homeDirectory = "/home/dan";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    procps

    nodejs_22
    nodePackages.pnpm
    nodePackages.typescript

    rustc
    cargo

    go
    gopls

    dotnet-sdk_10
    python3

    cmake

    clang-tools
    pyright
    rust-analyzer
    nodePackages.typescript-language-server
    lua-language-server
    nil
    stylua
    nixfmt

    lazygit
    eza
    bat
    fzf
  ];

  home.file.".config/zsh/custom.zsh" = {
    source = ../config/zsh/custom.zsh;
    executable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
      save = 10000;
      extended = true;
      share = true;
    };

    initContent = ''
      source ${config.home.homeDirectory}/.config/zsh/custom.zsh
    '';

    shellAliases = {
      ls = "eza --icons";
      cat = "bat -P";
      nix-rebuild = "sudo nixos-rebuild switch --flake .";
      home-rebuild = "home-manager switch --flake .";
      nvim-basedgoose = "NVIM_APPNAME=basedgoose nvim";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Daniel Dada";
        email = "doesdeos@gmail.com";
        signingkey = "~/.ssh/id_ed25519.pub";
      };
      commit.gpgsign = true;
      gpg.format = "ssh";
      credential.helper = "store";
      core.autocrlf = "input";
      url."git@github.com:".insteadOf = "https://github.com/";
      init.defaultBranch = "master";
      pull.rebase = false;
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  home.file.".config/nvim" = {
    source = pkgs.fetchFromGitHub {
      owner = "obsqrbtz";
      repo = "basedgoose.nvim";
      rev = "1bbf671b46e5df3436ca97e023be6348c8b31443";
      sha256 = "VWnk0I6JT/VNQg5WISGg/zkS/RKgxh7oAEySSnOQcsg="; # nix-prefetch-git https://github.com/obsqrbtz/basedgoose.nvim --rev <commit>
    };
    recursive = true;
  };

  programs.clrsync = {
    enable = true;
    defaultTheme = "dark";
    palettesPath = "~/nixdots/config/clrsync/palettes";
    font = "JetBrainsMono Nerd Font Mono";
    fontSize = 14;

    applyTheme = true;

    templates = {
      kitty = {
        enabled = true;
        inputPath = "~/nixdots/config/clrsync/templates/kitty-colors.conf";
        outputPath = "~/.config/kitty/clrsync.conf";
        reloadCmd = "${pkgs.procps}/bin/pkill -SIGUSR1 kitty";
      };
      waybar = {
        enabled = true;
        inputPath = "~/nixdots/config/clrsync/templates/waybar.css";
        outputPath = "~/.config/waybar/colors.css";
        reloadCmd = "${pkgs.procps}/bin/pkill -SIGUSR2 waybar";
      };
      rofi = {
        enabled = true;
        inputPath = "~/nixdots/config/clrsync/templates/rofi.rasi";
        outputPath = "~/.config/rofi/clrsync.rasi";
      };
      nvim = {
        enabled = true;
        inputPath = "~/nixdots/config/clrsync/templates/nvim.lua";
        outputPath = "~/.config/nvim/colors/clrsync.lua";
      };
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
