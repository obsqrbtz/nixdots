{
  description = "Development shells";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system} = {
        js = pkgs.mkShell {
          buildInputs = with pkgs; [
            nodejs_22
            nodePackages.pnpm
            nodePackages.typescript
            nodePackages.typescript-language-server
            nodePackages.vscode-langservers-extracted
          ];
        };

        rust = pkgs.mkShell {
          buildInputs = with pkgs; [
            rustc
            cargo
            rustfmt
            clippy
            rust-analyzer
          ];
        };

        go = pkgs.mkShell {
          buildInputs = with pkgs; [
            go
            gopls
            gotools
            go-tools
          ];
        };

        cpp = pkgs.mkShell {
          buildInputs = with pkgs; [
            gcc
            clang-tools
            cmake
            gnumake
            gdb
          ];
        };

        csharp = pkgs.mkShell {
          buildInputs = with pkgs; [
            dotnet-sdk_10
            omnisharp-roslyn
          ];
        };
      };
    };
}
