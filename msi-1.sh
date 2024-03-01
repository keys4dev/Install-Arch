#!/bin/bash

# Format the first partition with FAT32
mkfs.fat -F32 /dev/nvme0n1p1

# Format the second partition with ext4
mkfs.ext4 /dev/nvme0n1p2

# Update pacman repositories
pacman -Syy

# Install reflector to manage mirrorlist
pacman -S reflector

# Backup mirrorlist
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

# Use reflector to fetch mirrorlist
reflector -c "ES" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist

# Mount the second partition to /mnt
mount /dev/nvme0n1p2 /mnt

# Install essential packages to the mounted system
pacstrap /mnt base linux linux-firmware vim nano

# Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab

echo "Installation completed successfully."
