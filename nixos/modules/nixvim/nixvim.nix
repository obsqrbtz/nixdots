{

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    plugins.lightline.enable = true;
    plugins.coq-nvim.enable = true;
    plugins.lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        bashls.enable = true;
        clangd.enable = true;
        rust-analyzer.enable = true;
        csharp-ls.enable = true;
      };
    };
    plugins.nvim-cmp = {
      enable = true;
      completion.autocomplete = [ "TextChanged" ];
    };
  };
}
