#!/bin/bash

# 获取电池电量
battery_level=$(cat /sys/class/power_supply/BAT1/capacity)
Charg_status=$(cat /sys/class/power_supply/BAT1/status)
if [ "$Charg_status" = "Charging" ]; then
  CN_Charg_status="电池正在充电"
elif [ "$Charg_status" = "Discharging" ]; then
  CN_Charg_status="电池正在放电"
elif [ "$Charg_status" = "Full" ]; then
  CN_Charg_status="电池已充满"
else
  CN_Charg_status="无法读取电池状态"
fi
# 判断电量是否低于50
if [ $battery_level -lt 50 ]; then
  # 构造消息内容
  message="电池电量低于50%，当前电量为：$battery_level，当前充电状态：$CN_Charg_status"

  # 发送消息到飞书机器人
  curl -X POST -H "Content-Type: application/json" -d "{\"msg_type\": \"text\", \"content\": {\"text\": \"$message\"}}" https://open.feishu.cn/open-apis/bot/v2/hook/飞书机器人地址
fi

