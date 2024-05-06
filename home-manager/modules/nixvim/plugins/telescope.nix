{
  programs.nixvim.plugins.telescope = {
    enable = true;

    keymapsSilent = true;

    settings.defaults = {
      file_ignore_patterns = [
        "^.git/"
        "^.mypy_cache/"
        "^__pycache__/"
        "^output/"
        "^data/"
        "%.ipynb"
      ];
      set_env.COLORTERM = "truecolor";
      extensions.fzf-native = { 
        enable = true; 
      };
    };
  };
}