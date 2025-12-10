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
    
    rustup
    
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
      bindkey '^R' history-incremental-search-backward
      bindkey '^[[A' history-search-backward
      bindkey '^[[B' history-search-forward
      
      setopt AUTO_CD
      
      setopt COMPLETE_IN_WORD
      setopt ALWAYS_TO_END
      
      PS1='%F{cyan}%n@%m%f:%F{blue}%~%f$ '
    '';

    shellAliases = {
      ls = "eza";
      cat = "bat";
      nix-rebuild = "sudo nixos-rebuild switch --flake .";
      home-rebuild = "home-manager switch --flake .#dan";
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
      rev = "master";
      sha256 = "10za9srvkkxhiwrnpgnngkl6xsqvbbnpv1vkzj1fhwp7kzj6vq2a"; # Run nix-prefetch-url to get this
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
