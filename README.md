# Nixdots

Personal configuration boilerplate

## Setup

### Generate hardware configuration
```bash
sudo nixos-generate-config --show-hardware-config > hosts/<machine-name>/hardware-configuration.nix
```

### Build the configuration

VM:
```bash
sudo nixos-rebuild switch --flake .#nixos-vm
```

Desktop:
```bash
sudo nixos-rebuild switch --flake .#nixos-desktop
```

## Development Environments

Create a `.envrc` file in the project root:

```bash
# For C++
use flake ~/nixdots/dev-shells#cpp

# JS/TS
use flake ~/nixdots/dev-shells#js

# more in nixdots/dev-shells
```

Then run `direnv allow` in the project directory.
