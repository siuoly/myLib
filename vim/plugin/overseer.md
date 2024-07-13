## command
:OverseerOpen 
:OverseerOpen left
:OverseerOpen right
:OverseerRunCmd python3 a.py

- can read .justfile 

## task templates
用 template 而非 task.json 或者 justfile, 好處是自定 components (e.g.: qflist)
```lua
-- lazyvim config
require("overseer").setup({
  templates = { "builtin", "user.cpp_build" },
})
-- /home/stevearc/.config/nvim/lua/overseer/template/user/cpp_build.lua
return {
  name = "g++ build",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand("%:p")
    return {
      cmd = { "g++" },
      args = { file },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
```

## register/load template
```lua
overseer.register_template({
  -- Template definition (see below)
})
-- You can also load them separately from setup
overseer.load_template("myplugin.second_task")
```

## Custom task Template definition
```lua
{
  -- Required fields
  name = "Some Task",
  builder = function(params)
    -- This must return an overseer.TaskDefinition
    return {
      -- cmd is the only required field
      cmd = {'echo'},
      -- cmd = { vim.bo.filetype },
      -- additional arguments for the cmd
      args = {"hello", "world"},
      -- the name of the task (defaults to the cmd of the task)
      name = "Greet",
      -- set the working directory for the task
      cwd = "/tmp",
      -- additional environment variables
      env = {
        VAR = "FOO",
      },
      -- the list of components or component aliases to add to the task
      components = {"my_custom_component", "default"},
      -- arbitrary table of data for your own personal use
      metadata = {
        foo = "bar",
      },
    }
  end,
  -- Optional fields
  desc = "Optional description of task",
  -- Tags can be used in overseer.run_template()
  tags = {overseer.TAG.BUILD},
  params = {
    -- See :help overseer-params
  },
  -- Determines sort order when choosing tasks. Lower comes first.
  priority = 50,
  -- Add requirements for this template. If they are not met, the template will not be visible.
  -- All fields are optional.
  condition = {
    -- A string or list of strings
    -- Only matches when current buffer is one of the listed filetypes
    filetype = {"c", "cpp"},
    -- A string or list of strings
    -- Only matches when cwd is inside one of the listed dirs
    dir = "/home/user/my_project",
    -- Arbitrary logic for determining if task is available
    callback = function(search)
      print(vim.inspect(search))
      return true
    end,
  },
}
```

## .vscode/task.json example
```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "type": "process",
      "label": "(vscode) test",
      "group": "test",
      "command": "./run_tests.sh",
      "presentation": {
        "reveal": "silent"
      }
    },
    {
      "type": "shell",
      "label": "(vscode) sleep",
      "group": "test",
      "command": "sleep",
      "args": [
        "10"
      ]
    },
    {
      "type": "process",
      "label": "(vscode) test file",
      "group": "test",
      "command": "./run_tests.sh",
      "args": [
        "${file}"
      ],
      "presentation": {
        "reveal": "always"
      }
    },
    {
      "type": "process",
      "label": "(vscode) prompt input",
      "group": "test",
      "command": "echo",
      "args": [
        "${input:word}",
        "${input:position}"
      ]
    },
    {
      "type": "process",
      "label": "(vscode) background",
      "command": "./tests/fake_background_task.sh",
      "isBackground": true,
      "presentation": {
        "revealProblems": "onProblem",
      },
      "problemMatcher": {
        "pattern": {
          "regexp": "^([^:]+):(\\d+)",
          "file": 1,
          "line": 2
        },
        "background": {
          "activeOnStart": false,
          "beginsPattern": "^START$",
          "endsPattern": "^END$"
        }
      }
    },
    {
      "label": "(vscode) compound parallel",
      "dependsOn": [
        "(vscode) test",
        "(vscode) sleep"
      ]
    },
    {
      "label": "(vscode) compound sequence",
      "dependsOn": [
        "(vscode) sleep",
        "(vscode) test",
        "(vscode) prompt input"
      ],
      "dependsOrder": "sequence"
    },
    {
      "type": "shell",
      "label": "(vscode) create/move/delete",
      "command": "rm",
      "args": [
        "vscode_moved_test_file.txt"
      ],
      "dependsOn": "(vscode) move"
    },
    {
      "type": "shell",
      "label": "(vscode) move",
      "command": "mv vscode_test_file.txt vscode_moved_test_file.txt && sleep 4",
      "dependsOn": "(vscode) create"
    },
    {
      "type": "shell",
      "label": "(vscode) create",
      "command": "touch vscode_test_file.txt && sleep 4"
    },
    {
      "label": "Build/Test/Serve pipeline",
      "dependsOn": [
        "make build",
        "run tests",
        "run webserver"
      ],
      "dependsOrder": "sequence"
    },
    {
      "label": "make build",
      "type": "shell",
      "command": "echo make: Nothing to be done for 'all'. && sleep 4"
    },
    {
      "label": "run tests",
      "type": "shell",
      "command": "echo 'starting tests...' && sleep 4 && echo 'Tests passed'"
    },
    {
      "label": "run webserver",
      "type": "shell",
      "command": "echo 'Serving on 127.0.0.1:8080' && sleep 120"
    }
  ],
  "inputs": [
    {
      "id": "word",
      "description": "This is a word",
      "type": "promptString"
    },
    {
      "id": "position",
      "description": "This is a position",
      "type": "pickString",
      "options": [
        "first",
        "second",
        "third"
      ]
    }
  ]
}
```
### python task.json
```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "autopep8 current file",
      "type": "process",
      "command": "${config:python.formatting.autopep8Path}",
      "args": ["--in-place", "${file}"]
    },
    {
      "taskName": "Run File",
      "command": "python ${file}",
      "type": "shell",
      "group": {
          "kind": "build",
          "isDefault": true
      },
      "presentation": {
          "reveal": "always", // 打開視窗
          "panel": "new",
          "focus": true
      }
    },
    {
      "taskName": "nosetest",
      "command": "nosetests -v",
      "type": "shell",
      "group": {
          "kind": "test",
          "isDefault": true
      },
      "presentation": {
          "reveal": "always",
          "panel": "new",
          "focus": true
      }
    }
  ]
}
```
