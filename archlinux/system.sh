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

#################################################################################################3
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

#################################################################################################3
# How do I prevent mouse movement from waking up a suspended computer?
## https://askubuntu.com/a/1385877/1743532
lsusb # find {vender}:{product}
sudo nv /etc/udev/rules.d/90-usb-wakeup.rules
# add:  ACTION=="add", SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c52b", ATTR{power/wakeup}="disabled"
# modify vender,product string
sudo udevadm control --reload-rules
# Disconnect and reconnect the USB device.

##################################################################################################
# free output understand
# reference:
  # diff between buffer & cache: https://www.baeldung.com/linux/free-buffer-cache-report
  # Compute formula: https://serverfault.com/questions/377617/how-to-interpret-output-from-linux-top-command
free -h -w
               total        used        free      shared     buffers       cache   available
Mem:           7.6Gi       4.1Gi       695Mi       550Mi       466Mi       3.2Gi       3.5Gi
Swap:          8.0Gi       7.1Mi       8.0Gi

total: total physical memory space,記憶體總空間,購買記憶體商品上寫的數據
used: actually used memory by each process, 程序使用中記憶體
free: actually unused,free memory, 完全未被使用的記憶體。
shared: used by more than one processes process, 被多個程序所共用的記憶體
buffers: buffer space is where blocks of disk I/O operation having beed read or peding a write are stored. 加快磁碟讀寫，將disk資料事先儲存於此以節省實際讀取時間，將要寫入資料暫時寫於此以緩解寫入時間。
cache: memory which stored frequency used data for save time to access main memory(locality), 將頻繁存取的資料暫存於此，可節省存取記憶時間，因爲空間連續性，cache資料放在離CPU較接近位址。ps. cache:提升記憶體效率, buffer:提升磁碟效率
available: memory which be available for new process, 可用於新程序的記憶空間

formula: used = total- available (每個版本free公式不一樣,e.g. used=total-(free+buffer+cache), man free查看)
         available = free + buff + cache - ... (並非所有cache 可用於新程序,可能被某些專案佔用,故available實際會少一些)

