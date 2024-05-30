# keyd: keyboard setting 鍵盤設定
```bash
sudo systemctl enable keyd   # 開啟
sudo systemctl restart keyd  # 重開
systemctl status keyd ＃檢查服務狀態
sudo ps aux |grep keyd # 檢查程式執行狀態
	/user/bin/keyd  # 正常應顯示
keyd reload  # 開啟程式
```

setting file 程式控制檔案:
```yaml
# /etc/keyd/default.conf
[ids]
*
[main]

# Maps capslock to escape when pressed and control when held.
capslock = overload(capslock, esc)
#capslock = layer(capslock)

[capslock:C]
h = left
k = up
j = down
l = right

o = end
i = home

b = C-left
e = C-right

[ = pageup
] = pagedown

backspace = macro(home S-end delete)
enter = macro(end enter)

# Remaps the escape key to capslock
# esc = capslock
```

## 函數功能
man keyd
[section] ＋binding 集合
有效控制檔 ：.conf (extension) + [ids] section區塊開頭
[ids] sections 包含影響的設定 <vendor_id>:<product:id>
layer:   表示一個按鍵映射集合
cpaslock = layer( nav ) # 建立新層
[nav] ＃該層設定, 按下capsloc即為使用該layer, 搭配其他按鍵
h=left
j=up

stacking sementics : (堆疊語意, 作為功能鍵/組合健）
[main]
capslock = layers(capslock)  # 建立calsploc layer
[capslock:C]  # 該層覆蓋main層, 且capslock本身替換為 control
j = dowm  # capslock + j 作為特例（非control ),替換為 方向鍵下
C - control
M - Meta
A - Alt
S - Shift
G - AltGr


## 對個別應用程式設定
usermod -aG keyd siuoly
> ~/.config/keyd/app.conf

```yaml
[alacritty]
alt.] = macro(C-g n)
alt.[ = macro(c-g p)

[chromium]
alt.[ = C-S-tab
alt.] = macro( C-tab)
```

`keyd-application-mapper` # 執行
# 桌面環境初始化 ~/.xinitrc

`keyd-application-mapper -d` #  背景執行
