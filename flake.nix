{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      flake = {
        templates = {
          base = {
            description = "Base DevShell";
            path = ./template/base;
          };
          neovim = {
            description = "Neovim Base DevShell";
            path = ./template/neovim-plugin;
          };
          iac = {
            description = "Packages for IaC";
            path = ./template/iac;
          };
          ansible = {
            description = "Packages for Ansible development";
            path = ./template/ansible;
          };
          k8s = {
            description = "Packages for working with Kubernetes";
            path = ./template/k8s;
          };
          go = {
            description = "Packages for working with go";
            path = ./template/golang;
          };
          django = {
            description = "Packages for working with django";
            path = ./template/django;
          };
        };
      };
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin"];
      perSystem = {
        config,
        system,
        pkgs,
        ...
      }: let
        inherit (pkgs) jq mkShell;
      in {
        devShells = {
          default = mkShell {
            buildInputs = [jq];
            shellHook = ''
              echo "Pick a flake to build"
            '';
          };
        };
      };
    };
}
