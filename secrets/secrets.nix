let
   nixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIKDznwMBlqOUH/OwUZgmTA8v/VARf5DyPd8ReCupbSr narayan@nixos";
in {
   "secret1.age".publicKeys = [ nixos ];
}

