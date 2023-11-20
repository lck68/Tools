@echo off
setlocal  ::从这里开始，申请管理员权限
set uac=~uac_permission_tmp_%random%
md "%SystemRoot%\system32\%uac%" 2>nul
if %errorlevel%==0 ( rd "%SystemRoot%\system32\%uac%" >nul 2>nul ) else (
    echo set uac = CreateObject^("Shell.Application"^)>"%temp%\%uac%.vbs"
    echo uac.ShellExecute "%~s0","","","runas",1 >>"%temp%\%uac%.vbs"
    echo WScript.Quit >>"%temp%\%uac%.vbs"
    "%temp%\%uac%.vbs" /f
    del /f /q "%temp%\%uac%.vbs" & exit )
endlocal  :: 从这里结束，申请管理员权限
:mulu
cls
title 端口转发面板
echo ====================
echo 需要用管理员权限运行
echo 作者:           
echo 增加端口范围映射
echo ====================
echo 1.增加端口转发
echo 2.删除端口转发
echo 3.查询端口转发
echo ====================
echo 4.清空端口转发规则
echo 5.开启windows端口转发服务
echo ====================
echo 批量操作
echo 6.增加端口范围映射
echo 7.删除端口范围映射
echo 8.退出脚本
echo ====================
set /p xuanze= 
if /i "%xuanze%"=="1" cls&goto zhuanfa
if /i "%xuanze%"=="2" cls&goto shanchu
if /i "%xuanze%"=="3" cls&goto chaxun
if /i "%xuanze%"=="4" cls&goto qingkong
if /i "%xuanze%"=="5" cls&goto kaiqifw
if /i "%xuanze%"=="6" cls&goto fanwei1
if /i "%xuanze%"=="7" cls&goto fanwei2
if /i "%xuanze%"=="7" cls&goto tuichu
goto :mulu
:zhuanfa
 cls
 
 echo 输入被转发的ip/域名
 set ip=0
 set/p ip=
 
 echo 输入需要转发的端口
 set needpoint=0
 set/p needpoint=
if 1%needpoint% NEQ +1%needpoint% echo 请输入正整数，脑瘫 &pause&goto :mulu
if %needpoint% GEQ 65535 (
echo 端口有那么高吗？脑瘫
echo 最大输入65535
pause
goto :mulu
)

 echo 需要转发到本机多少端口
 set topoint=0
 set/p topoint=
if 1%topoint% NEQ +1%topoint% echo 请输入正整数，脑瘫 &pause&goto :mulu
if %topoint% GEQ 65535 (
echo 端口有那么高吗？脑瘫
echo 最大输入65535
pause
goto :mulu
)
 cls
 netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=%topoint% connectaddress=%ip% connectport=%needpoint%
 echo 增加完成 
 pause 
goto :mulu

:shanchu
 cls
 echo 输入转发后的端口
 set/p point=%point%
 cls
 netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=%point%
 echo 完成删除
 pause
goto :mulu

:chaxun
 cls
 netsh interface portproxy show v4tov4
 pause
goto :mulu

:kaiqifw
cls
net start iphlpsvc
echo 开启成功
pause
goto :mulu

:fanwei1
echo 范围转发端口仅支持本机端口等于远程端口
echo 输入被转发的ip/域名
set/p ip=
echo 输入需要转发的端口范围（开始）
set/p star=
echo 输入需要转发的端口范围（结束）
set/p stop=
if %stop% LEQ %star% (
echo 请不要花样作死
pause
goto :mulu
)
if %stop% GEQ 65535 (
echo 端口有那么高吗？脑瘫
echo 最大输入65535
pause
goto :mulu
)
set /a stop+=1
:xh1
netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=%star% connectaddress=%ip% connectport=%star%
echo 增加了%star%端口的映射到%ip%
set /a star+=1
if %star%==%stop% (
echo 增加完成
pause
goto :mulu
)
goto :xh1

:fanwei2
 cls
echo 输入需要删除的端口范围（开始）
set/p star=
echo 输入需要删除的端口范围（结束）
set/p stop=
if %stop% LEQ %star% (
echo 请不要花样作死
pause
goto :mulu
)
if %stop% GEQ 65535 (
echo 端口有那么高吗？脑瘫
echo 最大输入65535
pause
goto :mulu
)
set /a stop+=1
:xh2
 netsh interface portproxy delete v4tov4 listenaddress=0.0.0.0 listenport=%star%
echo 删除了%star%端口的映射
set /a star+=1
if %star%==%stop% (
echo 删除完成
pause
goto :mulu
)
goto :xh2
pause

echo 完成删除
pause
goto :mulu

:tuichu
exit

:qingkong
netsh interface portproxy reset
echo 清空完成
pause
goto :mulu

%0