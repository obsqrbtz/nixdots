{ config, pkgs, inputs, ... }:

{
  home.username = "dan";
  home.homeDirectory = "/home/dan";
  home.stateVersion = "24.11";

  home.packages = with pkgs; [
    inputs.clrsync.packages.x86_64-linux.clrsync

    nodejs_22
    nodePackages.pnpm
    nodePackages.typescript
    nodePackages.typescript-language-server

    rustc
    cargo
    rust-analyzer

    go
    gopls

    dotnet-sdk_10
    python3

    clang-tools
    cmake

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
      rev = "923bb9d5f685e7d8450426a3a132b8d7d43059f2";
      sha256 =
        "INOG+wOflldGtrf1aydQc9UfP8vW0O5mvkfjNEOB0wo="; # nix-prefetch-git https://github.com/obsqrbtz/basedgoose.nvim --rev <commit>
    };
    recursive = true;
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
