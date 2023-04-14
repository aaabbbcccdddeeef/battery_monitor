# battery_monitor
每5分钟监控电池电量，低于50则推送到飞书webhook机器人。
使用 crontab 工具定时运行脚本。在终端中输入以下命令打开 crontab 编辑器：

crontab -e
在文件末尾添加以下内容：

*/5 * * * * /path/to/check_battery.sh
这将每隔 5 分钟运行一次脚本。注意将 /path/to/check_battery.sh 替换为你实际的脚本路径。
