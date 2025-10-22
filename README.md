### References 
- https://github.com/vimjoyer 
- https://guekka.github.io/nixos-server-1
- https://notashelf.dev/posts/impermanence 
- https://willbush.dev/blog/impermanent-nixos
- https://github.com/frvgmxntx/dxtsz
- https://github.com/Rexcrazy804/Zaphkiel/tree/master
- https://github.com/Soliprem/nix-config/tree/main

### Installation (For personnal use only)

Starting
```
sudo su -
```
Downloading disko.nix
```
curl https://raw.githubusercontent.com/desiirenav/nixos-config/refs/heads/main/nixos/modules/hardware/disko.nix -o /tmp/disko.nix
```

Formatting with disko.nix
```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko.nix
```

Passwords in /persist/password

```
# Mount the disk
sudo cp -r /run/media/nixos/Ventoy/passwords/ /mnt/persist/
```

Creating /etc/nixos
```
sudo mkdir -p /mnt/etc/nixos
```

Using my nixos-config from github
```
git clone https://github.com/desiirenav/nixos-config.git && \
sudo cp -r nixos-config/. /mnt/etc/nixos && \
sudo cp -r /mnt/etc/nixos /mnt/persist && \
cd /mnt/etc/nixos && \
sudo rm -rf .git
```

Installing

```
NIX_CONFIG="experimental-features = nix-command flakes" \
  sudo nixos-install --flake .#nixos --no-root-passwd
```

