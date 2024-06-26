# Linux shell language syntax command
# comparsing number
x=1; y=2
 [[ $x -eq $y ]] || [ $x -eq $y ]
 [[ $x -ne $y ]] || [ $x -ne $y ]
 [[ $x -gt $y ]] || [ $x -gt $y ]
 [[ $x -lt $y ]] || [ $x -lt $y ]
 [[ "$x" = "Y"   ||  "$x" = "y" ]]

[ -z "" ] && ehco "string length is zero"
[ -n "1" ] && ehco "string length is non-zero"
[ "aaa" = "aaa" ] && echo "string is equal"
# e.g. detect if exist variable # if True, the varaible not exist 
[ -z $TMUX ] && echo "not exist \$TMUX" || echo "exist \$TMUX"
[ "$SHELL" = "/usr/bin/zsh" ] && echo "zsh" || echo "other"

# pattern match [[ ]],  not [ ]
[[ "abc-x" = "abc"* ]] && echo true
[[ "a-xx-a" = *"xx"* ]] && echo true
[[ "xterm" =~ ."xterm" ]] && echo false
[[ "xterm" =~ .*"xterm" ]] && echo true

# 参数扩展 Parameter Expansion
ip="local:arch-x260"
ip="${ip%%:*}:127.0.0.1" # loacl:127.0.0.1  # 末尾替換
ip="ftp:${ip##*:}" # ftp:127.0.0.1   # 行首替換
"
%%：从变量末尾开始，删除最长匹配的子字符串。
%：从变量末尾开始，删除最短匹配的子字符串。
##：从变量开头开始，删除最长匹配的子字符串。
#：从变量开头开始，删除最短匹配的子字符串。
"

# redirect stdout, stderr
ls >file # equal to: ls 1>file
ls >file 2>error_log # stderr
ls >file 2>&1 # both stdout,stderr to file
ls >file 2>&1 |less # both stdout,stderr to file and pipe

# process id
echo $$ # current process PID
echo $BASHPID # current process/function PID
ehco $! # previous running process $PID

# wait usage
wait # wair for all process compelete
wait $PID1 $PID2 # wait for PID1 PID2 process compelete
## e.g. 
kill_sleep(){ [ $sleep_pid -ne 0 ] && kill $sleep_pid >/dev/null 2>&1 }
trap "kill_sleep" USR1 # when receive signal USR1 , by kill -s USR1, # call function kill_sleep
sleep 1000& PID=$! # make sleep program background, and record PID
wait # wait sleep process # when receive USR signal, kill sleep immediately

# expand previous last argument https://stackoverflow.com/a/36654936
ls /etc/pacman.d/mirrorlist # first command
cat !$ # type "tab" to exapnd previous argument
cat $_ # the same

# keyboard:
<esc> + .
<alt> + . # it cycles through the last arg of your previous cmd

# expand previous all arugments 
echo 1 2 3 4
cat !^ # first
cat !$ # last arg
cat !* # all
cat !:1 # fitst arg, e.g. !:2, !:3
cat !:2-3 # 2nd ~ 3rd arg
!<pattern> # most recent cmd matching <pattern>
!!:s/<cmd1>/<cmd2> # last cmd, substitude cmd1 with cmd2
!!:s!<cmd1>!<cmd2> # the same

# use history cmd
!1 # fitst cmd
!-1 # last cmd
!3:2 # take the 2nd arg from the 3rd cmd in the history,

# hotkey
<ctrl> + x + e # edit current command on editor
<ctrl> + b # vi mode, using vi-keybinding
fc # edit last comand
