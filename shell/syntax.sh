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
