@echo off
chcp 65001 >nul
title 启动UI服务
echo 正在启动UI服务...

REM 检查是否在项目根目录
if not exist "ui" (
    echo 错误：未找到"ui"目录，请确保在项目根目录下运行此脚本
    pause
    exit /b 1
)

REM 激活虚拟环境
if exist "venv\Scripts\activate.bat" (
    echo 正在激活虚拟环境...
    call "venv\Scripts\activate.bat"
) else (
    echo 错误：未找到虚拟环境，请先创建venv
    pause
    exit /b 1
)

REM 进入ui目录
cd /d "ui"

REM 检查package.json是否存在
if not exist "package.json" (
    echo 错误：ui目录下未找到package.json
    pause
    exit /b 1
)

REM 运行构建和启动命令
echo 正在运行npm run build_and_start...
npm run build_and_start

REM 保持窗口打开
pause