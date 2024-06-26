## 1. use command
```sh
python -m debugpy --listen 0.0.0.0:5678  ./myscript.py  # 允許其他電腦連線
python3 -m debugpy --listen 5678 --wait-for-client ./myscript.py # 僅允許本地連線，等待 client 之後才開始執行程式
```
注意可以先在編輯器上設置中斷點，再 attach 上執行中的程式。可以讓程式先跑，等有需要再連上查看運行狀況。

## 2. add follow ing to your code
```python
import debugpy
# Allow other computers to attach to debugpy at this IP address and port.
# debugpy.listen(('1.2.3.4', 5678))
debugpy.listen(5678)
print("Waiting for debugger attach")
debugpy.wait_for_client()
debugpy.breakpoint()
print('break on this line')

print("following is your code......")
```
