# power show
```sh
upower -d 
tlp-stat -s # show tlp status
tlp-stat --battery  # show battery
tlp-stat -p # show cpu performance
```

# tlp setting
```sh
# /etc/tlp.conf
START_CHARGE_THRESH_BAT1=80
STOP_CHARGE_THRESH_BAT1=95

#CPU_ENERGY_PERF_POLICY_ON_AC=balance_performance
#CPU_ENERGY_PERF_POLICY_ON_BAT=balance_power
#CPU_MIN_PERF_ON_BAT=0
#CPU_MAX_PERF_ON_BAT=30 --> 60
```

# power history ,battery history
```sh
# 1. upower & watch
watch -tn 60 "echo -n \`date +%H:%M\`|tee -a log; upower -i /org/freedesktop/UPower/devices/battery_BAT1 |grep percentage |cut  -c 25-28|tee -a log"
# 2. battop
yay -S battop
battio -d 3 # refresh every 3s.
# 3. batstat
yay -S batstat-git
```
when installing batstat,edit **src/batstat/main.cpp** ,checking **/sys/class/power_supply/BAT1/** files.
```c
# define ENERGY "energy"
# define POEWRR "power"
```
