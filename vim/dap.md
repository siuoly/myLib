
安裝 nvim-dap 時候，開啓 python 檔案會自動安裝 nvim-dap-python，
設定 nvim-dap-python 的執行檔爲 python3,
```lua
  {
    "mfussenegger/nvim-dap",
    lazy=false,
    config = function()
      require("dap-python").setup("python3")
    end
  }
```
mason install debugpy

## Question
      vim.keymap.set('n', '<f2>', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
:在 REPL 中顯示訊息

      vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
使用最後的 自定義session開啓控制檔 通常爲測試用

        require('dap.ui.widgets').hover()
顯示鼠標下的 變數訊息，超級好用！！XD

      vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
        require('dap.ui.widgets').preview()
開 preview 視窗來預覽訊息

        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
開啓 當前位置的 frames 視窗,cr 選擇位置

        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
開啓視窗，查看當前 scope 內各個變數的數值

repl: .goto 44   移動到44行
數字 + step into  移動 n次

## 待加入功能
sidebar toggle
dap.run_to_cursor()                                            *dap.run_to_cursor()*
dap.repl.execute( command )


## launch.json example
### python example
```json
{
    // Use IntelliSense to learn about possible attributes.
    // Hover to view descriptions of existing attributes.
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "$schema": "https://raw.githubusercontent.com/mfussenegger/dapconfig-schema/master/dapconfig-schema.json",
    "version": "0.2.0",
    "configurations": [
        {
          "name": "Python Debugger: Current File (Integrated Terminal)", 
          "type": "debugpy",
          "request": "launch",
          "program": "${file}",
          "console": "integratedTerminal"  // plugin提供的
        },
        {
          "name": "Python Debugger: Current File (External Terminal)",
          "type": "debugpy",
          "request": "launch",
          "program": "${file}",
          "console": "externalTerminal"  // 外部 e.g.:alacritty
        },
        {
            "name": "Python Debugger: Module",
            "type": "debugpy",
            "request": "launch",
            "module": "run"
        },
        {
          "name": "Python Debugger: Attach",
          "type": "debugpy",
          "request": "attach",
          "port": 5678,
          "host": "localhost",
          "pathMappings": [
            {
              "localRoot": "${workspaceFolder}", // Maps C:\Users\user1\project1
              "remoteRoot": "." // To current working directory ~/project1
            }
          ]
        },
        {
            "name": "Python Debugger: Current File with Arguments",
            "type": "debugpy",
            "request": "launch",
            "program": "${file}",
            "console": "integratedTerminal",
            "args": "${command:pickArgs}"
        },
        {
          "name": "Attach",
          "type": "debugpy",
          "request": "attach",
          "connect": {
            "host": "remote-machine-name", // replace this with remote machine name
            "port": 5678
          }
        }
    ]
}
```
