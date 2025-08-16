## How to install (currently not tested and only for personal use!)

### References 
- https://github.com/vimjoyer for nearly everything about nix and nixos
- https://guekka.github.io/nixos-server-1/ and
- https://notashelf.dev/posts/impermanence for impermanence setup
- https://github.com/mcdonc for how to backup nixos dotfiles (don't judge me i am a noob)
- https://willbush.dev/blog/impermanent-nixos/ for installing from a git config (again don't judge i'm a noob)

### Starting
- Download a graphical nixos installation iso
- From the iso, go superuser in the terminal
```
sudo su -
```
### Downloading disko.nix
```
curl https://raw.githubusercontent.com/desiirenav/nixos-config/refs/heads/main/modules/nixos/disko.nix -o /tmp/disko.nix
```

### Formatting with disko.nix
```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko.nix
```

### Passwords in /persist/password

```
sudo mkdir /mnt/persist/passwords
sudo mkpasswd -m sha-512 "password" > /mnt/persist/passwords/user
sudo mkpasswd -m sha-512 "password" > /mnt/persist/passwords/root
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
sudo mv -i /mnt/etc/nixos/hardware-configuration.nix /mnt/etc/nixos/modules/nixos/ && \
cd /mnt/etc/nixos && \
sudo rm -f configuration.nix && \
git add .
sudo cp -r /mnt/etc/nixos /mnt/persist

```

### Installing

```
NIX_CONFIG="experimental-features = nix-command flakes" \
  sudo nixos-install --flake .#nixos --no-root-passwd
```


## nixos-anywhere-test

### Password for ssh
```
passwd
```

### Config from github
```
git clone https://github.com/desiirenav/nixos-config.git && \
cd nixos-config
```

### ip
```
ip addr
```

### Executing nixos-anywhere
```
sudo nix --experimental-features "nix-command flakes" run github:nix-community/nixos-anywhere '.#nixos' --target-host nixos@ip


```
