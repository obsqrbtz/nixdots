{
  programs.nixvim.plugins.cmp = {
    enable = true;

    settings = {
      snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

      sources = [
        {name = "path";}
        {name = "nvim_lsp";}
        {name = "cmp_tabby";}
        {name = "luasnip";}
        {
          name = "buffer";
          # Words from other open buffers can also be suggested.
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
        }
        {name = "neorg";}
      ];
    };
  };
}