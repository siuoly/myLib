# linux system command
# show system information
neofetch 
hostnamectl
uname --all

# show cpu information
lscpu

# show disk information, disk specification
sudo lshw -class storage
sudo smartctl -a /dev/sda

# show cuda version
nvcc --version
cat /usr/local/cuda/version.txt
nvidia-smi
# show cudnn version
# https://stackoverflow.com/questions/31326015/how-to-verify-cudnn-installation

#NOTE:
#x86_64:
# equal to: x64, amd64, which is 64 bit register. It is a "ISA(Instruction Set Architecture)"
# comparing to x86, which is 32 bit register. ps.: x86=i386=IA32.
# comparing to arm, ppc ,these is diff ISA.

# terminfo
sudo tic -xs <xxx.info> # make terminfo file to /usr/share/terminfo
# that system known your system, e.g. archlinux AUR: xst-git

# usb using
lsblk # check usb usage
mkdir /mnt/usb
sudo mount /dev/<device> /mnt/usb # e.g. mount /dev/seb /mnt/usb
chown $USER /mnt/usb # for presonal usage
umount /mnt/usb # remove usb

# create swap 
## from https://linuxize.com/post/create-a-linux-swap-file/
sudo fallocate -l 8G /swapfile # or following ,optional
# sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576 # 1024*1024=1048576(1G)
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
      # edit /etc/fstab
      /swapfile swap swap defaults 0 0 # add new line
sudo swapon --show # test success
sudo free -h

# remove swap
sudo swapoff -v /swapfile
      # edit /etc/fstab
      /swapfile swap swap defaults 0 0 # remove line
sudo rm /swapfile

