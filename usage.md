sudo nixos-generate-config --show-hardware-config > hosts/<machine-name>/hardware-configuration.nix

sudo nixos-rebuild switch --flake .#nixos-vm
sudo nixos-rebuild switch --flake .#nixos-desktop

home-manager switch --flake .#dan # no need to run if rebuilding system
