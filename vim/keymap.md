在tmux當中，欲使用 alt+function key，使用以下映射：
map <f49> :alt+f1<cr>
map <f50> :alt+f2<cr>
map <f51> :alt+f3<cr>
map <f52> :alt+f4<cr>
map <f53> :alt+f5<cr>
map <f54> :alt+f6<cr>
map <f55> :alt+f7<cr>
map <f56> :alt+f8<cr>
map <f57> :alt+f9<cr>
map <f58> :alt+f10<cr>
map <f59> :alt+f11<cr>
map <f60> :alt+f12<cr>

查詢方法：
在tmux teminal上，鍵入 Control-V alt+f7 ，打印出 ^[[18;3~
查詢 terminfo 的對應映射 "kf55=\E[18;3~"
在 nvim 上使用 map<f55> :echo "alt+7""<cr>
但是在 kitty terminal 當中無用


map <f13> :shift+f1<cr>
map <f14> :shift+f2<cr>
map <f15> :shift+f3<cr>
map <f16> :shift+f4<cr>
map <f17> :shift+f5<cr>
map <f18> :shift+f6<cr>
map <f19> :shift+f7<cr>
map <f20> :shift+f8<cr>
map <f21> :shift+f9<cr>
map <f22> :shift+f10<cr>
map <f23> :shift+f11<cr>
map <f24> :shift+f12<cr>
