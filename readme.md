
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
https://unix.stackexchange.com/questions/597788/how-to-add-windows-10-from-another-nvme-drive-to-systemd-boot-loader-entries
