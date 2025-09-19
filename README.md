## Installation (only for personal use!)

### References 
- https://github.com/vimjoyer for nearly everything about nix and nixos
- https://guekka.github.io/nixos-server-1/ and
- https://notashelf.dev/posts/impermanence for impermanence setup
- https://willbush.dev/blog/impermanent-nixos/ for installing from a git config 

### Starting
- Download a graphical nixos installation iso
- From the iso, go superuser in the terminal
```
sudo su -
```
### Downloading disko.nix
```
curl https://raw.githubusercontent.com/desiirenav/nixos-config/refs/heads/main/modules/nixos/system/disko.nix -o /tmp/disko.nix
```

### Formatting with disko.nix
```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko.nix
```

### Passwords in /persist/password

```
# Mount the disk
sudo cp -r /run/media/nixos/Ventoy/passwords/ /mnt/persist/
sudo cp -r /run/media/nixos/Ventoy/ssh/ /mnt/persist/
```

### hardware-configuration.nix
```
sudo nixos-generate-config --no-filesystems --root /mnt
```

### Using my nixos-config from github
```
git clone https://github.com/desiirenav/nixos-config.git && \
sudo cp -r nixos-config/. /mnt/etc/nixos && \
sudo mkdir -p /mnt/etc/nixos/modules/nixos && \
sudo mv -i /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/modules/nixos/system && \
cd /mnt/etc/nixos && \
sudo rm -rf .git configuration.nix flake.lock && \
sudo cp -r /mnt/etc/nixos /mnt/persist
```

### Installing

```
NIX_CONFIG="experimental-features = nix-command flakes" \
  sudo nixos-install --flake .#nixos --no-root-passwd
```

### Changing permissions
```
sudo chmod -v 755 /mnt/etc/nixos && \
sudo chmod -v 755 /mnt/persist
```
### Copying dotfiles in /etc/nixos
```
sudo cp -r /mnt/persist/nixos/* /mnt/etc/nixos/
```
