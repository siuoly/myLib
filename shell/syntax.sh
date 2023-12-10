# Linux shell language syntax command
# comparsing number
x=1; y=2
 [[ $x -eq $y ]] || [ $x -eq $y ]
 [[ $x -ne $y ]] || [ $x -ne $y ]
 [[ $x -gt $y ]] || [ $x -gt $y ]
 [[ $x -lt $y ]] || [ $x -lt $y ]

# detect if exist variable # if True, the varaible not exist 
[ -z $TMUX ] && echo "not exist \$TMUX" || echo "exist \$TMUX"

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
