{ pkgs, ... }:
{
    programs.fish = {
        enable = true;
        interactiveShellInit = ''
        set fish_greeting '';
        plugins = [
        { name = "pure"; src = pkgs.fishPlugins.pure.src; }
        ];
    };
}