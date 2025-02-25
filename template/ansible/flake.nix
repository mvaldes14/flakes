{
  description = "Ansible Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux"];

      perSystem = {
        pkgs,
        system,
        ...
      }: let
        inherit (pkgs) mkShell;
      in {
        devShells = {
          default = mkShell {
            buildInputs = with pkgs; [
              ansible
              ansible-lint
              python311Packages.kubernetes
              python311Packages.pip
              python3Packages.virtualenv
              python3Packages.molecule-plugins
              python3Packages.molecule-plugins.optional-dependencies.docker
              python3Packages.molecule
            ];
            shellHook = ''
              Commands available:
              - ansible
              - ansible-lint
              - molecule
            '';
          };
        };
      };
    };
}
