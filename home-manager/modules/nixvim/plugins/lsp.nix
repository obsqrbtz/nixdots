{
  programs.nixvim.plugins = {

    treesitter = {
      enable = true;
      nixGrammars = true;
      nixvimInjections = true;
      folding = false;
      indent = true;
    };
    treesitter-context.enable = true;
    rainbow-delimiters.enable = true;
    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = false;
      };
    };

    hmts.enable = true;

    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        bashls.enable = true;
        clangd.enable = true;
        rust-analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
        };
        csharp-ls.enable = true;
      };
      keymaps.lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "K" = "hover";
      };
    };
    lsp-lines = {
      enable = true;
      currentLine = true;
    };
  };
}