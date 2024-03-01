ln -sf /usr/share/zoneinfo/Europe/Madrid /etc/localtime
nano /etc/locale.gen
locale-gen
echo LANG=en_GB.UTF-8 > /etc/locale.conf
export LANG=en_GB.UTF-8
echo myarch > /etc/hostname
nano /etc/hosts
127.0.0.1	localhost
::1		localhost
127.0.1.1	myarch
passwd
pacman -S grub efibootmgr
mkdir /boot/efi
mount /dev/nvme0n1p1 /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S sudo
localectl set-keymap de && localectl set-x11-keymap de
pacman -S alacritty scrot nitrogen picom slock rofi dusnt thunar mousepad polybar breeze breeze-gtk qtile
