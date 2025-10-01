```
/dev/vda1   512M    EFI System (FAT32)
/dev/vda2   8G      Linux swap
/dev/vda3   rest    Linux filesystem (ext4)
```

`mkfs.fat -F32 /dev/vda1`
`mkswap /dev/vda2`
`swapon /dev/vda2`
`mkfs.ext4 /dev/vda3`
`mount /dev/vda3 /mnt`
`mkdir -p /mnt/boot`
`mount /dev/vda1 /mnt/boot`
`mkdir -p /mnt/etc/nixos`

`nix-env -iA git -f '<nixpkgs>'`
`git clone https://github.com/mmatotan/nixos-config .`
`rm -rf ./.git`
`nixos-install --flake /mnt/etc/nixos/flake.nix#nixos`
