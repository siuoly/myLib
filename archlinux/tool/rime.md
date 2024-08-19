
配置目錄Linux: ~/.local/share/fcitx5/rime
default.custom.yaml: 用于设置输入法的全局配置。
schema.custom.yaml: 用于配置特定语言方案。



```yaml
patch:
  schema_list:
    - schema: luna_pinyin  # 设置默认方案为朙月拼音
  switcher:
    caption: 切换方案
  menu:
    page_size: 5  # 候选词个数
```

```yaml
patch:
  schema_list:
    - schema: bopomofo # default 注音
  menu:
    alternative_select_keys: 123456789
    # alternative_select_keys: ABCDEFGHIJ
    page_size: 9 # 候選字數
  ascii_composer:
    good_old_caps_lock: false
    switch_key:
      Shift_L: commit_code # inline_text
      Shift_R: noop
```
    

重新部署


### 備份字庫
1. 输入法自动生成的“用户数据”（User Data）, `<词典名>.userdb/`, 輸入法自動更新 sync/ 目錄。
2. “用户词典”（`<词典名>.dict.yaml`）以及“自定义短语”（`custom_phrase.txt`）
自定义配置: 如果有自定义配置文件（如 default.custom.yaml 或 schema.custom.yaml），也要一并备份。

備份字庫教學 https://utgd.net/article/20231，僅需同步 sync 目錄即可。
