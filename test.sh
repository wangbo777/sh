#!/bin/bash

# 简单的服务器管理脚本

# 打印菜单
echo "--------------------"
echo "服务器管理脚本"
echo "1. 检查系统状态"
echo "2. 启动服务"
echo "3. 停止服务"
echo "4. 更新系统"
echo "5. 查看日志"
echo "6. 退出"
echo "--------------------"
read -p "请输入选项: " option

# 系统状态检查
check_status() {
    echo "检查服务器状态..."
    uptime
    free -h
    df -h
}

# 启动服务
start_service() {
    read -p "请输入要启动的服务名称: " service
    sudo systemctl start $service
    echo "$service 启动成功!"
}

# 停止服务
stop_service() {
    read -p "请输入要停止的服务名称: " service
    sudo systemctl stop $service
    echo "$service 停止成功!"
}

# 更新系统
update_system() {
    echo "更新系统..."
    sudo apt update && sudo apt upgrade -y
    echo "系统更新完成!"
}

# 查看日志
view_logs() {
    echo "查看系统日志..."
    sudo journalctl -xe
}

# 根据用户输入执行操作
case $option in
    1)
        check_status
        ;;
    2)
        start_service
        ;;
    3)
        stop_service
        ;;
    4)
        update_system
        ;;
    5)
        view_logs
        ;;
    6)
        echo "退出脚本"
        exit 0
        ;;
    *)
        echo "无效选项，请重新选择!"
        ;;
esac
