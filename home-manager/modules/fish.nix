{ pkgs, ... }:
{
    programs.fish = {
        enable = true;
        interactiveShellInit = ''
        set fish_greeting '';
        #plugins = [
        #{ name = "hydro"; src = pkgs.fishPlugins.hydro.src; }
        #];
    };
}