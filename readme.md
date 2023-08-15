
# Install from Live Media

Command

```bash
nixos-install --flake .#hostname
```

# Apply System Configuration

Command

```bash
sudo nixos-rebuild switch --flake .#hostname
```

# Apply User Configuration

Command

```bash
home-manager switch --flake .#username@hostname
```
