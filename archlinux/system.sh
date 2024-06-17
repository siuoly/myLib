# delete user
sudo userdel <user>

# usermod
usermod -aG <groups> <users> # e.g. usermod -aG docker,wheel siuoly 
usermod -g <group> <user> # change primilary group of user, any file created would belong to this group
"add user to groups"
id -Gn # show what groups user be in
groups # show what groups user be in
groupadd <group> # create group
groupdel <group>
cat /etc/group # list all group and user belong state

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
# show cudnn version:
https://stackoverflow.com/questions/31326015/how-to-verify-cudnn-installation

# terminfo
sudo tic -xs <xxx.info> # make terminfo file to /usr/share/terminfo so system known your system, e.g. arch AUR: xst-git

# process info
cat /proc/$$/environ  # environment variable 環境變數
cat /proc/$$/comm  # 命令名稱

# process find
ps aux | rg kitty # find program name "kitty"
pgrep kitty # same above
pstree $PID # find subprocess of the PID process
pstree -asp $PID # -s:parent, -a: show with argument, -p: show pid

# usb using
lsblk # check usb usage
mkdir /mnt/usb
sudo mount /dev/<device> /mnt/usb -o umask=000 # e.g. mount /dev/sdb1 /mnt/usb, all user is writable
chown $USER /mnt/usb # for presonal usage
umount /mnt/usb # remove usb

# create symbolic link
readlink -f FILE
ln -s /full/path/a /full/path/link_a
ln -s "$(pwd)/a" link_a
ln -s `pwd`/a link_a
ln -sr a link_a

# password 3 times locked
faillock --user siuoly # show info
faillock --user siuoly --reset # unlock


#################################################################################################3
# create swap 
## from https://linuxize.com/post/create-a-linux-swap-file/
sudo fallocate -l 8G /swapfile # or following ,optional
# sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576 # 1024*1024=1048576(1G)
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
# edit /etc/fstab , add following line
# /swapfile swap swap defaults 0 0
sudo swapon --show # test success
sudo free -h

# remove swap
sudo swapoff -v /swapfile
# edit /etc/fstab
# /swapfile swap swap defaults 0 0 # remove line
sudo rm /swapfile

#################################################################################################3
# How do I prevent mouse movement from waking up a suspended computer?
## https://askubuntu.com/a/1385877/1743532
lsusb # find {vender}:{product}
sudo nv /etc/udev/rules.d/90-usb-wakeup.rules

# add:  ACTION=="add", SUBSYSTEM=="usb", DRIVERS=="usb", ATTRS{idVendor}=="046d", ATTRS{idProduct}=="c52b", ATTR{power/wakeup}="disabled"
# modify vender(046d), product(c52b) string

# add2:
# ACTION=="add", SUBSYSTEM=="pci|usb", ATTR{power/wakeup}=="enabled", ATTR{power/wakeup}="disabled" 
# disable all usb device to wakeup system
sudo udevadm control --reload-rules
# Disconnect and reconnect the USB device.

## time, https://wiki.archlinux.org/title/System_time
timedatectl
timedatectl set-time "2034-05-25 11:13:45" # update sys clock manually
hwclock --show # show hardware clock
hwclock --systohc # update hw clock by sys clock
pacman -S ntp
ntpd -u ntp:ntp # first use
ntpq -p #show delay

# mouse move speed set
xinput --list # check id=<id>
xinput --list-props <id> # check attribute(<attr>): number
xinput --set-prop <id> <attr> <value>

# screen saver control 關閉螢幕保護程式 
xset s off
# prevent external monitor turn off
xset dpms 600 0 0 # standby:600 sec, suspend:disable, off:disable

# keybaord repeat speed
xset r rate 200 50 # 1:<time to starte repeat(ms)>  2:<repeat speed>

# disk/io speed test
dd if=/dev/zero of=/tmp/test1.img bs=1G count=1   # throughtput (write speed)
dd if=/dev/zero of=/tmp/test2.img bs=512 count=1000  # latency (write many blocks/files delay)
sudo hdparm -Tt /dev/sda


###############################################################################################
# Thinkpad trackpoint speed small redpoint speed
# 1. find config file path
find /sys/devices/platform/i8042 -name name | xargs grep -Fl TrackPoint | sed 's/\/input\/input[0-9]*\/name$//'
# 2. output target info
cat /sys/devices/platform/i8042/serio1/serio2/{sensitivity,speed}
# 3. sudo write indicated number to configure file
echo 255 |sudo tee /sys/devices/platform/i8042/serio1/serio2/sensitivity  # origin:200
echo 255 |sudo tee /sys/devices/platform/i8042/serio1/serio2/speed   # origin:97
# 4. add udev rule, append following declaration
nvim /etc/udev/rules.d/trackpoint.rules
SUBSYSTEM=="serio", DRIVERS=="psmouse", DEVPATH=="/sys/devices/platform/i8042/serio1/serio2", ATTR{sensitivity}="220", ATTR{speed}="110"
# 5. reboot or run following command enble setting
sudo udevadm control --reload-rules
sudo udevadm trigger

############## systemctl suspend need password ##################################################
# ==== AUTHENTICATING FOR org.freedesktop.login1.halt ====
sudo -e /usr/share/polkit-1/actions/org.freedesktop.login1.policy # edit polkit rule files
'
search login1.suspend
edit 
  <action id="org.freedesktop.login1.suspend">
      <allow_inactive>auth_admin_keep</allow_inactive>
      <allow_active>yes</allow_active>
to
      <allow_inactive>yes</allow_inactive>
      <allow_active>yes</allow_active>
'

#NOTE:

###############################################################
# ISA understand
"
x86_64:
equal to: x64, amd64, which is 64 bit register. It is a ISA(Instruction Set Architecture)
comparing to x86, which is 32 bit register. ps.: x86=i386=IA32.
comparing to arm, ppc ,these is diff ISA.
"
##################################################################################################
# free output understand
# reference:
  # diff between buffer & cache: https://www.baeldung.com/linux/free-buffer-cache-report
  # Compute formula: https://serverfault.com/questions/377617/how-to-interpret-output-from-linux-top-command

free -h -w
"
               total        used        free      shared     buffers       cache   available
Mem:           7.6Gi       4.1Gi       695Mi       550Mi       466Mi       3.2Gi       3.5Gi
Swap:          8.0Gi       7.1Mi       8.0Gi
"
"
total: total physical memory space,記憶體總空間,購買記憶體商品上寫的數據
used: actually used memory by each process, 程序使用中記憶體
free: actually unused,free memory, 完全未被使用的記憶體。
shared: used by more than one  process, 被多個程序所共用的記憶體
buffers: buffer space is where blocks of disk I/O operation having been read or pending a write are stored. 加快磁碟讀寫，將disk資料事先儲存於此以節省實際讀取時間，將要寫入資料暫時寫於此以緩解寫入時間。
cache: memory which stored frequency used data for save time to access main memory(locality), 將頻繁存取的資料暫存於此，可節省存取記憶時間，因爲空間連續性，cache資料放在離CPU較接近位址。ps. cache:提升記憶體效率, buffer:提升磁碟效率
available: memory which be available for new process, 可用於新程序的記憶空間

formula: used = total- available (每個版本free公式不一樣,e.g. used=total-(free+buffer+cache), man free查看)
         available = free + buff + cache - ... (並非所有cache 可用於新程序,可能被某些專案佔用,故available實際會少一些)
"

############# lvm #########################################
物理卷 (PV) MBR GPT分区 被内核映射的设备
卷组 (VG) <LeftMouse>物理卷的一个组
逻辑卷 (LV)  "虚拟/逻辑卷" 
物理块 (PE) 一个卷组中最小的连续区域(默认为4 MiB)，
lvmdiskscan 列出可被用作物理卷的设备
pvcreate DEVICE 在列出的设备上创建物理卷： 
# pvcreate /dev/sda2
pvdisplay 你可以用以下命令查看已创建好的物理卷：
vgcreate <volume_group> <physical_volume> 创建卷组（VG）
# vgcreate VolGroup00 /dev/sda2
vgextend <卷组名> <物理卷> 让该卷组扩大到其他所有的物理卷:
# vgextend VolGroup00 /dev/sdb1
# vgextend VolGroup00 /dev/sdc
vgcreate VolGroup00 /dev/sda2 /dev/sdb1 /dev/sdc 一步创建卷组
lvcreate -L <卷大小> <"卷组名"> -n <卷名>
# lvcreate -L 10G VolGroup00 -n lvolhome
# lvcreate -L 30G lvm -n root
# lvcreate -L 8G lvm --name swap
# lvcreate -l 100% lvm -n home
lvreduce -L <卷大小> <"卷名稱">
# lvreduce -L -50G /dev/lvm00/home # 縮小home卷 50G 大小
# lvreduce -L -50G /dev/lvm00/home --resizefs # 處理檔案系統問題，需要卸載該磁區，建議從root執行
lvrename <VG> <LV> <LV_new>
# lvrename lvm00 home home_new

mkfs.fat -F32 /dev/sda1 # Format the boot partition first
mkfs.ext4 /dev/lvm/root # Format the other partitions
mkfs.ext4 /dev/lvm/home
该逻辑卷创建完后，你就可以通过/dev/mapper/Volgroup00-lvolhome或/dev/VolGroup00/lvolhome来访问它。与卷组命名类似，你可以按你的需要将逻辑卷命名。
######################################################################
