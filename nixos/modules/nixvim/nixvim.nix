{

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    plugins = {
      lightline.enable = true;
      telescope.enable = true;
      treesitter.enable = true;
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          bashls.enable = true;
          clangd.enable = true;
          rust-analyzer.enable = true;
          csharp-ls.enable = true;
        };
      };
      cmp = {
        enable = true;
        completion.autocomplete = [ "TextChanged" ];
      };
    };
  };
}
