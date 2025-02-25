# Flakes for personal development
Repository contains a list of flakes for projects, technology or languages that I use often.

Contains:
- IaC
- Ansible
- Golang
- K8s
- Django

# Requirements
You will need:
- flakes (enabled)
- direnv (for ease of use)

# Usage
Run the following command to "generate" your flake.

```bash
nix flake init -t github:mvaldes14/flakes#base
nix flake init -t github:mvaldes14/flakes#iac
nix flake init -t github:mvaldes14/flakes#ansible
nix flake init -t github:mvaldes14/flakes#golang
nix flake init -t github:mvaldes14/flakes#k8s
nix flake init -t github:mvaldes14/flakes#django
```

Modify the flake if desired and run direnv allow. 
Your environment should be ready.
