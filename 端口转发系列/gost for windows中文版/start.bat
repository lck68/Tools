@echo off

:start
cls
title gost一键-windows版
echo Gost一键-windows版-本脚本不需要管理员权限
echo  说人话版，正常人语言版，通俗易懂
echo ======================================
echo             菜单 请选择
echo 1.作为加密发送端（A端，通常为海外机，加密流量）
echo 2.作为解密接收端（B端，通常为国内机，解密流量）
echo 3.查看开启gost程序数量
echo 4.关闭gost进程（Kill all）
echo ======================================
echo 请输入你的选择:
set /p xuanze= 
if /i "%xuanze%"=="1" cls&goto start1
if /i "%xuanze%"=="2" cls&goto start2
if /i "%xuanze%"=="3" cls&goto start3
if /i "%xuanze%"=="4" cls&goto start4
goto :start
:start1
cls
echo 加密发送端（A端）
echo 请选择传输类型
echo [1]ws
echo [2]wss
echo [3]h2
echo [4]kcp
echo [5]tcp
set /p lx=
if %lx%==1 set lx=ws
if %lx%==2 set lx=wss
if %lx%==3 set lx=h2
if %lx%==4 set lx=kcp
if %lx%==5 set lx=tcp
echo 填你需要转发的那个机子的ip，如果是本机就填127.0.0.1。
echo 例如：广州-香港隧道转发日本机子，那就填日本机子的ip。如果不涉及到前面那种情况就填127.0.0.1.
set /p ip=
echo 填你需要加密的本机的端口。
set /p remoteport=
echo 随便输一个端口，用于隧道内使用。
set /p localport=
echo 是否显示启动窗口（1是0否）
set /p ck=
echo 启动成功，如果没有启动可以手动启动
echo 启动命令 gost -L relay+%lx%://:%localport%/%ip%:%remoteport%
if %ck%==0 echo CreateObject("WScript.Shell").Run "gost -L relay+%lx%://:%localport%/%ip%:%remoteport%",0 >qidongs.vbs
if %ck%==0 cscript.exe /e:vbscript qidongs.vbs >nul
if %ck%==0 del qidongs.vbs
if %ck%==1 start gost -L relay+%lx%://:%localport%/%ip%:%remoteport%
pause
goto :start

:start2
cls
echo 解密接收端（B端）
echo 请选择传输类型
echo [1]ws
echo [2]wss
echo [3]h2
echo [4]kcp
echo [5]tcp
set /p lx=
if %lx%==1 set lx=ws
if %lx%==2 set lx=wss
if %lx%==3 set lx=h2
if %lx%==4 set lx=kcp
if %lx%==5 set lx=tcp
echo 填“加密发送端A端”的ip。
set /p ip=
echo 填你想使用的端口。以后访问A端时，就用本机ip+这个端口。
set /p localport=
echo 填你之前在“加密发送端A端”随便填的那个端口。
set /p remoteport=
echo 是否显示启动窗口（1是0否）
set /p ck=
echo 启动成功，如果没有启动可以手动启动
echo 启动命令 gost -L udp://:%localport% -L tcp://:%localport% -F relay+%lx%://%ip%:%remoteport%
if %ck%==1 start gost -L udp://:%localport% -L tcp://:%localport% -F relay+%lx%://%ip%:%remoteport%
if %ck%==0 echo CreateObject("WScript.Shell").Run "gost -L udp://:%localport% -L tcp://:%localport% -F relay+%lx%://%ip%:%remoteport%",0 >qidongc.vbs
if %ck%==0 cscript.exe /e:vbscript qidongc.vbs >nul
if %ck%==0 del qidongc.vbs
pause
goto :start
:start3
cls
tasklist |findstr gost.exe
pause
goto :start

:start4
cls
taskkill /f /im gost.exe
后台和前台gost均被关闭
goto :start

pause
