#!/bin/bash

# 设置wallpaper文件夹的路径
WALLPAPER_DIR="$HOME/Pictures/wallpaper"

# 获取wallpaper文件夹下的所有图片文件
images=("$WALLPAPER_DIR"/*)

# 获取图片文件的数量
num_images=${#images[@]}

# 生成一个随机数，用于选择图片
random_index=$((RANDOM % num_images))

# 获取随机选择的图片路径
random_image="${images[random_index]}"

# 打印随机选择的图片路径
echo "$random_image"

mapfile -t monitors < <(hyprctl monitors | grep 'Monitor' | awk '{print $2}')

hyprctl hyprpaper unload all

hyprctl hyprpaper preload "$random_image"

# 遍历数组中的每个元素
for monitor in "${monitors[@]}"; do
    echo "$monitor wallpaper changed"
    hyprctl hyprpaper wallpaper "$monitor,$random_image"
done

# 运行命令并将结果存储到数组中



