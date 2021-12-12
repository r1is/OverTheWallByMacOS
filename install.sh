#!/bin/zsh

workdir="/usr/local/etc"

cp -r ./clash/ /usr/local/etc/
if [ -d /usr/local/etc/clash ];then
    echo "已将clash拷贝到${workdir}/clash目录下"
else
    echo "拷贝失败，请检查环境和脚本"
    exit 1
fi

cp ./clash.plist ~/Library/LaunchAgents/
if [ -f ~/Library/LaunchAgents/clash.plist ];then
    launchctl load ~/Library/LaunchAgents/clash.plist
    if [ $? -eq 0 ];then
        echo "服务安装成功"
        echo "启动clash: launchctl start clash"
        echo "停止clash: launchctl stop clash"
    else
        echo " launchctl load  ~/Library/LaunchAgents/clash.plist  执行失败"
    fi

else
    echo "服务安装失败，请检查！"
fi

