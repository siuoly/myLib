# Linux shell language syntax command
# comparsing number
x=1
y=2
 [[ $x -eq $y ]] || [ $x -eq $y ]
 [[ $x -ne $y ]] || [ $x -ne $y ]
 [[ $x -gt $y ]] || [ $x -gt $y ]
 [[ $x -lt $y ]] || [ $x -lt $y ]

 # detect if exist variable
if [ -z $TMUX ];then  # True, not exist the varaible
  echo "not exist \$TMUX"
else
  echoo "exist \$TMUX"
fi

echo $$ # current process PID
echo $BASHPID # current process/function PID
ehco $! # previous running process $PID

wait # wair for all process compelete
waid $PID1 $PID2 # wait for PID1 PID2 process compelete
