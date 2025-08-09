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
### Partitioning

```
# Setting up disk name to make it easier
DISK=/dev/nvme0n1

# Boot
parted "$DISK" -- mklabel gpt
parted "$DISK" -- mkpart ESP fat32 1MiB 4GiB
parted "$DISK" -- set 1 boot on

mkfs.vfat -n BOOT "$DISK"p1

# Swap
parted "$DISK" -- mkpart Swap linux-swap 4GiB 20GiB
mkswap -L SWAP "$DISK"p2
swapon "$DISK"p2

parted "$DISK" -- mkpart primary 20GiB 100%

mkfs.btrfs -f -L Nixos "$DISK"p3

```

### Creating subvolumes

```
mount -t btrfs "$DISK"p3 /mnt

btrfs subvolume create /mnt/root
btrfs subvolume create /mnt/nix
btrfs subvolume create /mnt/persist
btrfs subvolume create /mnt/log
```

### Creating readonly snapshot and unmounting

```
btrfs subvolume snapshot -r /mnt/root /mnt/root-blank

# Make sure to unmount, otherwise nixos-rebuild will try to remove /mnt
# and fail
umount /mnt
```

### Mounting

```
# /
mount -o subvol=root,compress=zstd,noatime "$DISK"p3 /mnt

# /nix
mkdir /mnt/nix
mount -o subvol=nix,compress=zstd,noatime "$DISK"p3 /mnt/nix

# /persist
mkdir /mnt/persist
mount -o subvol=persist,compress=zstd,noatime "$DISK"p3 /mnt/persist

# /var/log
mkdir -p /mnt/var/log
mount -o subvol=log,compress=zstd,noatime "$DISK"p3  /mnt/var/log

# Mounting boot partition
mkdir /mnt/boot
mount "$DISK"p1 /mnt/boot
```

### Passwords in /persist/password

```
sudo mkdir /mnt/persist/passwords
sudo mkpasswd -m sha-512 "password" > /mnt/persist/passwords/user
sudo mkpasswd -m sha-512 "password" > /mnt/persist/passwords/root
```

### hardware-configuration.nix
```
nixos-generate-config --root /mnt
# adding neededForBoot = true; to /persist and /var/log and add "compress=zstd" "noatime" to options for btrfs filesystems
sudo vim /mnt/etc/nixos/hardware-configuration.nix
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
