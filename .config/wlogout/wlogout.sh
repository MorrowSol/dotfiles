#!/bin/bash

# 提取monitorID的值
monitorID=$(hyprctl activeworkspace | grep "monitorID:" | awk '{print $2}')

# 检查monitorID的值，并执行相应的命令
if [ "$monitorID" -eq 1 ]; then
    wlogout -L 500 -R 500 -T 350 -B 350
else
    wlogout
fi