{
  description = "Development shells";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
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

        kaskad = pkgs.mkShell {
          buildInputs = with pkgs; [
            gcc
            stdenv.cc.cc.lib
            ninja
            cmake
            swig
            dotnet-sdk_10

            qt6.qtbase
            qt6.qttools
            qt6.qtsvg
            qt6.qtserialport
            qt6.wrapQtAppsHook

            clang-tools
            gdb

            pkg-config
          ];

          shellHook = ''
                                    export CMAKE_GENERATOR="Ninja"
                                    export CMAKE_EXPORT_COMPILE_COMMANDS=ON
                                    echo "KaskadCPP development environment loaded"
                                    echo "Compiler: $(gcc --version | head -n1)"
                                    echo "CMake: $(cmake --version | head -n1)"
                                    echo "Ninja: $(ninja --version)"
                                    echo "Qt6: $(qmake6 -v | grep 'Qt version')"
                                    echo "SWIG: $(swig -version | grep 'SWIG Version')"
            			echo ".NET: $(dotnet --version)"
          '';
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
