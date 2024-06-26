#!/bin/bash

# 獲取已連接的顯示器列表
xrandr_query=$(xrandr --query)
connected_monitors=$(echo "$xrandr_query" | grep " connected" | cut -d" " -f1)

# 計算連接的顯示器數量
monitor_count=$(echo "$connected_monitors" | wc -l)

# 如果有多於一個顯示器
if [ "$monitor_count" -gt 1 ]; then
    # 獲取主顯示器名稱
    primary_monitor=$( echo "$xrandr_query" | grep " primary" | cut -d" " -f1)

    # 找到主顯示器的解析度
    # primary_resolution=$(xrandr | grep -A1 "^$primary_monitor connected" | tail -n1 | cut -d" " -f4)
    
    # 找到第二顯示器名稱
    secondary_monitor=$(echo "$connected_monitors" | grep -v "$primary_monitor" | head -n1)

    # 設置第二顯示器在主顯示器的左邊
    echo xrandr --output "$secondary_monitor" --auto --left-of "$primary_monitor"
    xrandr --output "$secondary_monitor" --auto --left-of "$primary_monitor"

    if pgrep -x "polybar" > /dev/null && pgrep -fa "polybar outside -r" > /dev/null; then
        echo "Polybar is already running."
    else
        # 呼叫 polybar
        polybar outside -r
    fi
else
    echo "只有一個顯示器連接，無需進行設置。"
fi
