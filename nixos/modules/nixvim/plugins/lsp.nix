{
  programs.nixvim.plugins = {

    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = false;
      indent = true;
    };

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
    };
  };
}