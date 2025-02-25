{
  description = "Go Project Baseline";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux"];

      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: let
        inherit (pkgs) mkShell;
        name = "Project Name";
        vendorHash = "";
      in {
        devShells = {
          default = mkShell {
            inputsFrom = [self'.packages.default];
            buildInputs = with pkgs; [
              go
              revive
              gopls
              goimports
            ];
          };
        };

        packages = {
          default = pkgs.buildGoModule {
            inherit name vendorHash;
            src = ./.;
          };
        };
      };
    };
}
