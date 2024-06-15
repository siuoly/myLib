
## Set each lsp server
Find accessable setting in the file: `~/.local/share/nvim/mason/share/mason-schemas/lsp/pyright.json`
e.g.:
```json
"python.analysis.typeCheckingMode": {
  "type": "string",
  "enum": [
    "off",
    "basic",
    "standard",
    "strict"
  ],
  "description": "Defines the default rule set for type checking.",
  "scope": "resource",
  "default": "standard"
},
```
then,
```lua
settings = {
  python = {
    analysis = {
      typeCheckingMode = "off"
    }
  }
}
```
