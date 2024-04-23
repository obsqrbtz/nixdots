{ pkgs, ... }: {
  programs.fish.enable = true;

  users = {
    defaultUserShell = pkgs.fish;

    users.dan = {
      isNormalUser = true;
      description = "Dan";
      extraGroups = [ "networkmanager" "wheel" "input" "docker" ];
      packages = with pkgs; [];
    };
  };
}
